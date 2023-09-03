package com.rs.fer.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.rs.fer.entity.Expense;
import com.rs.fer.entity.User;
import com.rs.fer.service.FERService;

import java.util.List;

@Controller
public class FERController {

	@Autowired
	private FERService ferService;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView home() {
		return new ModelAndView("Login");
	}

	@RequestMapping(value = "/showRegistration", method = RequestMethod.GET)
	public ModelAndView showRegistration() {
		return new ModelAndView("Registration");
	}

	@RequestMapping(value = "/registration", method = RequestMethod.POST)
	public ModelAndView registration(@ModelAttribute User user, HttpServletRequest request) {

		HttpSession session = request.getSession();
		boolean isEmailAvailable = ferService.isEmailAvailable(user.getEmail());
		String viewName = null;

		if (isEmailAvailable == false) {
			session.setAttribute("status", "Given Email is not available,Please try with something else...");
			viewName = "Registration";
		} else {

			boolean isRegister = ferService.registration(user);

			if (isRegister) {
				session.setAttribute("status", "User Registration is successfully completed......");
				viewName = "Login";
			} else {
				session.setAttribute("status", "User registration is failed.....");
				viewName = "Registration";
			}

		}

		return new ModelAndView(viewName);
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public ModelAndView login(@RequestParam String username, @RequestParam String password,
			HttpServletRequest request) {

		int userId = ferService.login(username, password);
		String viewName = null;
		HttpSession session = request.getSession();

		if (userId > 0) {
			session.setAttribute("userId", userId);
			session.setAttribute("username", username);
			session.setAttribute("status", "Welcome to the user :" + username);
			viewName = "Dashboard";
		} else {
			session.setAttribute("status", "Please try again later....");
			viewName = "Login";
		}

		return new ModelAndView(viewName);
	}

	@RequestMapping(value = "/showAddExpense", method = RequestMethod.POST)
	public ModelAndView showAddExpense() {
		return new ModelAndView("AddExpense");
	}

	@RequestMapping(value = "/addExpense", method = RequestMethod.POST)
	public ModelAndView addExpense(@ModelAttribute Expense expense, HttpServletRequest request) {

		HttpSession session = request.getSession();

		int userId = Integer.parseInt(session.getAttribute("userId").toString());
		expense.setUserId(userId);

		boolean isAddExpense = ferService.addExpense(expense);

		if (isAddExpense) {
			session.setAttribute("status", "Expense added successfully....");
		} else {
			session.setAttribute("status", "Expense are not added...");
		}

		return new ModelAndView("Dashboard");
	}

	@RequestMapping(value = "/showResetPassword", method = RequestMethod.POST)
	public ModelAndView showResetPassword() {
		return new ModelAndView("ResetPassword");
	}

	@RequestMapping(value = "/resetPassword", method = RequestMethod.POST)
	public ModelAndView resetPassword(@ModelAttribute User user, HttpServletRequest request) {

		HttpSession session = request.getSession();

		String newPassword = request.getParameter("newPassword");

		int id = Integer.parseInt(session.getAttribute("userId").toString());

		String currentPassword = request.getParameter("currentPassword");

		boolean isResetPassword = ferService.resetPassword(newPassword, id, currentPassword);

		if (isResetPassword) {
			session.setAttribute("status", "Password is successfully updated....");
		} else {
			session.setAttribute("status", "password is not updated");
		}

		return new ModelAndView("Dashboard");
	}

	@RequestMapping(value = "/showEditExpenseOptions", method = RequestMethod.POST)
	public ModelAndView showEditExpenseOptions(HttpServletRequest request) {

		HttpSession session = request.getSession();
		int userId = Integer.parseInt(session.getAttribute("userId").toString());

		List<Expense> expenseOptions = ferService.getExpenseOptions(userId);
		session.setAttribute("expenseOptions", expenseOptions);

		return new ModelAndView("EditExpenseOptions");
	}

	@RequestMapping(value = "/showEditExpense", method = RequestMethod.POST)
	public ModelAndView showEditExpense(@RequestParam int expenseId, HttpServletRequest request) {

		HttpSession session = request.getSession();

		Expense expense = ferService.getExpense(expenseId);
		session.setAttribute("expense", expense);

		return new ModelAndView("EditExpense");
	}

	@RequestMapping(value = "/editExpense", method = RequestMethod.POST)
	public ModelAndView editExpense(@ModelAttribute Expense expense, HttpServletRequest request) {

		HttpSession session = request.getSession();
		Expense expenseObj = (Expense) session.getAttribute("expense");

		expense.setUserId(expenseObj.getUserId());
		expense.setId(expenseObj.getId());

		boolean isEditExpense = ferService.editExpense(expense);

		if (isEditExpense) {
			session.setAttribute("status", "Expense edited successfully....");
		} else {
			session.setAttribute("stats", "Expense are not edited...");
		}

		return new ModelAndView("Dashboard");
	}

	@RequestMapping(value = "/showDeleteExpenseOptions", method = RequestMethod.POST)
	public ModelAndView showDeleteExpenseOptions(HttpServletRequest request) {

		HttpSession session = request.getSession();

		int userId = Integer.parseInt(session.getAttribute("userId").toString());

		List<Expense> deleteExpenseOptions = ferService.getExpenseOptions(userId);
		session.setAttribute("deleteExpenseOptions", deleteExpenseOptions);

		return new ModelAndView("DeleteExpenseOption");
	}

	@RequestMapping(value = "/deleteExpense", method = RequestMethod.POST)
	public ModelAndView deleteExpense(@RequestParam int expenseId, HttpServletRequest request) {

		HttpSession session = request.getSession();

		boolean isDeleteExpense = ferService.deleteExpense(expenseId);

		if (isDeleteExpense) {
			session.setAttribute("status", "Expense deleted successfully....");
		} else {
			session.setAttribute("stats", "Expense are not deleted...");
		}

		return new ModelAndView("Dashboard");
	}

	@RequestMapping(value = "/showExpenseReport", method = RequestMethod.POST)
	public ModelAndView showExpenseReport() {
		return new ModelAndView("ExpenseReport");
	}

	@RequestMapping(value = "/expenseReport", method = RequestMethod.POST)
	public ModelAndView expenseReport(@RequestParam String type, @RequestParam String fromDate,
			@RequestParam String toDate, HttpServletRequest request) {

		HttpSession session = request.getSession();

		int userId = Integer.parseInt(session.getAttribute("userId").toString());

		List<Expense> expenses = ferService.getExpenseReport(userId, type, fromDate, toDate);

		session.setAttribute("expenses", expenses);

		return new ModelAndView("ExpenseReportPost");
	}

	@RequestMapping(value = "/showNameInfo", method = RequestMethod.POST)
	public ModelAndView showNameInfo(HttpServletRequest request) {

		HttpSession session = request.getSession();

		int userId = Integer.parseInt(session.getAttribute("userId").toString());

		User user = ferService.getUser(userId);
		session.setAttribute("user", user);
		return new ModelAndView("NameInfo");
	}

	@RequestMapping(value = "/showContactInfo", method = RequestMethod.POST)
	public ModelAndView showContactInfo() {
		return new ModelAndView("ContactInfo");
	}

	@RequestMapping(value = "/showAddressInfo", method = RequestMethod.POST)
	public ModelAndView showAddressInfo() {
		return new ModelAndView("AddressInfo");
	}

	@RequestMapping(value = "/showReview", method = RequestMethod.POST)
	public ModelAndView showReview() {
		return new ModelAndView("Review");
	}

	@RequestMapping(value = "/updateProfile", method = RequestMethod.POST)
	public ModelAndView updateProfile(HttpServletRequest request) {

		HttpSession session = request.getSession();

		User user = (User) session.getAttribute("user");

		boolean isUserUpdate = ferService.updateUser(user);

		if (isUserUpdate) {
			session.setAttribute("status", "User Profile Updated successfully....");
		} else {
			session.setAttribute("status", "User Profile is not updated...");
		}
		return new ModelAndView("Dashboard");
	}

}
