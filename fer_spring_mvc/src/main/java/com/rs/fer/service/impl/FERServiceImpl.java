package com.rs.fer.service.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rs.fer.entity.Expense;
import com.rs.fer.entity.User;
import com.rs.fer.repository.ExpenseRepository;
import com.rs.fer.repository.UserRepository;
import com.rs.fer.service.FERService;
import com.rs.fer.util.DBUtil;

@Service
public class FERServiceImpl implements FERService {
	
	@Autowired
	private UserRepository userRepository;
	
	@Autowired
	private ExpenseRepository expenseRepository;

	@Transactional
	@Override
	public boolean registration(User user) {

		return userRepository.save(user).getId() > 0;
	}

	@Transactional
	@Override
	public boolean addExpense(Expense expense) {

		return expenseRepository.save(expense).getId() > 0;
	}

	@Override
	public boolean editExpense(Expense expense) {
		return addExpense(expense);
	}

	@Transactional
	@Override
	public boolean deleteExpense(int expenseId) {
		try {
           expenseRepository.deleteById(expenseId);
           return true;
		}catch(Exception ex) {
			return false;
		}

	}

	@Override
	public int login(String username, String password) {
		List<User> users = userRepository.findByUsernameAndPassword(username, password);
		
		if(users != null && !users.isEmpty()) {
			return users.get(0).getId();
		}
		return 0;
	}

	@Override
	public boolean resetPassword(String newPassword, int userId, String currentPassword) {
		User user = getUser(userId);
		
		if(currentPassword.equals(user.getPassword())) {
			user.setPassword(newPassword);
			return registration(user);
		}
		
		return false;
	}

	@Override
	public Expense getExpense(int expenseId) {
		return expenseRepository.findById(expenseId).get();
	}

	@Override
	public List<Expense> getExpenseOptions(int userId) {
		return expenseRepository.findByUserId(userId);

	}

	@Override
	public List<Expense> getExpenseReport(int userId, String type, String fromDate, String toDate) {
		
		return expenseRepository.findByUserIdAndTypeAndDateBetween(userId, type, fromDate, toDate);
	}

	@Override
	public User getUser(int userId) {
		return userRepository.findById(userId).get();
	}

	@Override
	public boolean updateUser(User user) {
		return registration(user);
	}

	@Override
	public boolean isEmailAvailable(String email) {
		
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		// 1.Register the driver
		try {
			connection = DBUtil.getConnection();

			// 3.create the statement object
			String query = "SELECT * FROM USER_ANNOTATIONS WHERE EMAIL=?";
			preparedStatement = connection.prepareStatement(query);

			// 4.Execute the statement object
			preparedStatement.setString(1, email);

			ResultSet resultSet = preparedStatement.executeQuery();

			while (resultSet.next()) {
				return false;
			}
		} catch (SQLException se) {
			se.printStackTrace();
		} finally {
			DBUtil.closeConnection(connection);
		}
		

	
		return true;
	}

}
