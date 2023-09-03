package com.rs.fer.service;

import java.util.List;

import com.rs.fer.entity.Expense;
import com.rs.fer.entity.User;

public interface FERService {

	boolean registration(User user);

	boolean addExpense(Expense expense);

	boolean editExpense(Expense expense);
	
	boolean deleteExpense(int expenseId);
	
	int login(String username, String password);
	
    boolean resetPassword(String newPassword,int userId,String currentPassword);
    
    Expense getExpense(int expenseId);
    
    List<Expense> getExpenseOptions(int userId);
    
    List<Expense> getExpenseReport(int userId, String type ,String fromDate ,String toDate);
    
    User getUser(int userId);

	boolean updateUser(User user);
	
	boolean isEmailAvailable(String email);
}




