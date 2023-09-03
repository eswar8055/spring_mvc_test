<html>
<head>
<title>FER-Dash Board</title>
<script>
	function submitForm(path) {
		//1.Get the form object
		var form = document.DashboardForm;

		//2.set the action
		form.action = path;

		//3.submit the form
		form.submit();
	}
</script>
</head>

<body>
	<form name='DashboardForm' method='post'>
		<table align='center' border='4' height="550" width="800">

			<tr align='center' height='75'>
				<td colspan='2'>FamilyExpenceReport
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; User : ${username} </td>
			</tr>
			<tr align="center">

				<td width="150px"><br> <br> <a
					href="javascript: submitForm('showAddExpense')">Add Expense</a>
					<br> <br> <a
					href="javascript: submitForm('showEditExpenseOptions')">Edit
						Expense</a> <br> <br> <a
					href="javascript: submitForm('showDeleteExpenseOptions')">Delete
						Expense</a> <br> <br> <a
					href="javascript: submitForm('showExpenseReport')">Expense
						Report</a> <br> <br> <a
					href="javascript: submitForm('showResetPassword')">Reset
						Password</a> <br> <br> <a
					href="javascript: submitForm('showNameInfo')">Update Profile</a>
					<br> <br></td>
				<td>