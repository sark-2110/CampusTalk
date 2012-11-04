<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>CampusTalk</title>
		<link rel="icon" href="assets/favicon.ico" sizes="32x32">
		<link rel="shortcut icon" href="assets/favicon.ico" type="image/x-icon">
		<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" media="all"/>
		<link rel="stylesheet" type="text/css" href="css/bootstrap-responsive.min.css" media="all"/>
		<link rel="stylesheet" type="text/css" href="css/style.css" media="all"/>
		<link rel="stylesheet/less" type="text/css" href="less/style.less" media="all"/>
 		<script type="text/javascript" src="js/jquery-1.8.2.min.js"></script>
		<script type="text/javascript" src="js/bootstrap.min.js"></script>
		<script type="text/javascript" src="js/less-1.3.0.min.js"></script>
		<script type="text/javascript">
			$(function() {
				less.env = "development";
				less.watch();
				$("#ViewGroup").find("form").hide();
			});
			var objMyData = [];
			objMyData=${requestScope.userJSon}
		</script>
	</head>
	<body>
		<div class="container header">
			<img src="assets/logo_small.png" class="campustalk-logo"/>
		</div>
		<div class="account-tray">
			<img src="${requestScope.User.pictureUrl}" class="account-user-img" />
			<div class="profile-block">
				<div class="profile-details">
					<img src="${requestScope.User.pictureUrl}" class="profile-img" />
					<table class="profile-options">
						<tr>
							<td><label class="user-title">${requestScope.User.firstname}  ${requestScope.User.lastname}</label></td>
						</tr>
						<tr>
							<td><label class="user-group-title">Administrator</label></td>
						</tr>
						<tr>
							<td style="padding-bottom: 15px;"><a href="#" class="user-option">Messages</a></td>
						</tr>
						<tr>
							<td style="padding-bottom: 15px;"><a href="#" class="user-option">Events</a></td>
						</tr>
					</table>
				</div>
				<div class="profile-actions">
					<button id="btnLogout" class="btn btn-flat btn-blue">Logout</button>
					<button id="btnSettings" class="btn btn-flat btn-blue">Settings</button>
				</div>
			</div>
		</div>
		<div class="container panels-block">
			<ul class="nav nav-pills" id="panel-tabs">
				<li class="active"><a href="#groups" data-toggle="pill">Groups</a></li>
				<li><a href="#users" data-toggle="pill">Users</a></li>
			</ul>
			<div class="tab-content">
				<div class="tab-pane active" id="groups">
					<div class="input-append">
						<input type="text" name="txtNewGroup" placeholder="Enter group name to create..." class="span3" /><a href="#CreateGroup" role="button" class="btn disabled">Add</a>
					</div>
					<table class="table table-stripped table-hover">
						<thead>
							<tr>
								<th>Group ID</th>
								<th>Name</th>
								<th colspan="3">Actions</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>1</td>
								<td>MSc. I.T. 2011</td>
								<td><a href="#EditGroup" data-toggle="modal"><i class="icon-edit"></i>&nbsp;Edit</a></td>
								<td><a href="#"><i class="icon-trash"></i>&nbsp;Delete</a></td>
								<td><a href="#ViewGroup"  data-toggle="modal"><i class="icon-eye-open"></i>&nbsp;View all</a></td>
							</tr>
							<tr>
								<td>2</td>
								<td>BTech 2009</td>
								<td><a href="#EditGroup" data-toggle="modal"><i class="icon-edit"></i>&nbsp;Edit</a></td>
								<td><a href="#"><i class="icon-trash"></i>&nbsp;Delete</a></td>
								<td><a href="#ViewGroup" data-toggle="modal"><i class="icon-eye-open"></i>&nbsp;View all</a></td>
							</tr>
						</tbody>
					</table>
					<!-- Create Group Modal -->
					<div class="modal hide fade" id="CreateGroup" tabindex="-1" role="dialog" aria-labelledby="dlgLabel" aria-hidden="true">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
							<h3 id="dlgLabel">Create Group</h3>
						</div>
						<div class="modal-body">
							<form class="form-horizontal">
								<div class="control-group">
									<label class="control-label">Name</label>
									<div class="controls">
										<input type="text" name="txtGroupName" />
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">Description</label>
									<div class="controls">
										<textarea name="txtGroupDesc"></textarea>
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">Members</label>
									<div class="controls">
										<textarea name="txtGroupMembers"></textarea>
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">Group Status</label>
									<div class="controls">
										<select name="txtGroupStatus">
											<option value="-1" selected>Select status...</option>
											<option value="0">Inactive</option>
											<option value="1">Active</option>
										</select>
									</div>
								</div>
							</form>
						</div>
							<div class="modal-footer">
								<button class="btn btn-flat" data-dismiss="modal" aria-hidden="true">Close</button>
								<button class="btn btn-green">Save</button>
							</div>
						</div>
					<!-- Edit Group Modal -->
					<div class="modal hide fade" id="EditGroup" tabindex="-1" role="dialog" aria-labelledby="dlgLabel" aria-hidden="true">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
							<h3 id="dlgLabel">Edit Group</h3>
						</div>
						<div class="modal-body">
							<form class="form-horizontal">
								<div class="control-group">
									<label class="control-label">Name</label>
									<div class="controls">
										<input type="text" name="txtGroupName" />
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">Description</label>
									<div class="controls">
										<textarea name="txtGroupDesc"></textarea>
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">Status</label>
									<div class="controls">
										<select name="txtGroupStatus">
											<option value="-1" selected>Select status...</option>
											<option value="0">Inactive</option>
											<option value="1">Active</option>
										</select>
									</div>
								</div>
							</form>
						</div>
						<div class="modal-footer">
							<button class="btn btn-flat" data-dismiss="modal" aria-hidden="true">Cancel</button>
							<button class="btn btn-green">Save</button>
						</div>
					</div>
					<!-- View Group Members Modal -->
					<div class="modal hide fade" id="ViewGroup" tabindex="-1" role="dialog" aria-labelledby="dlgLabel" aria-hidden="true">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
							<h3 id="dlgLabel"></h3>
						</div>
						<div class="modal-dropform">
							<form class="form-horizontal form-edit-member">
								<legend>Edit User</legend>
								<div class="control-group">
									<label class="control-label">Email</label>
									<div class="controls">
										<input type="text" name="txtUserEmail" />
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">Group</label>
									<div class="controls">
										<select name="txtUserGroup">
											<option value="-1" selected>Select group...</option>
											<option value="0">MSc. I.T.</option>
											<option value="1">BTech 2009</option>
										</select>
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">Privilege</label>
									<div class="controls">
										<select name="txtUserPrivilege">
											<option value="-1" selected>Select level...</option>
											<option value="0">Student</option>
											<option value="1">Moderator</option>
											<option value="2">Professor</option>
											<option value="3">Administrator</option>
										</select>
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">Status</label>
									<div class="controls">
										<select name="txtUserStatus">
											<option value="-1" selected>Select status...</option>
											<option value="0">Inactive</option>
											<option value="1">Active</option>
										</select>
									</div>
								</div>
								<div class="control-group button-group">
									<button type="button" class="btn btn-flat" id="btnCancelEdit">Cancel</button>
									<button type="button" class="btn btn-green">Save</button>
								</div>
							</form>
							<form class="form-horizontal form-add-member">
								<legend>Add Users</legend>
								<div class="control-group">
									<label class="control-label">Email List</label>
									<div class="controls">
										<textarea name="txtUserEmail"></textarea>
									</div>
								</div>
								<div class="control-group">
										<label class="control-label">Group</label>
									<div class="controls">
										<select name="txtUserGroup">
											<option value="-1" selected>Select group...</option>
											<option value="0">MSc. I.T.</option>
											<option value="1">BTech 2009</option>
										</select>
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">Privilege</label>
									<div class="controls">
										<select name="txtUserPrivilege">
											<option value="-1" selected>Select level...</option>
											<option value="0">Student</option>
											<option value="1">Moderator</option>
											<option value="2">Professor</option>
											<option value="3">Administrator</option>
										</select>
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">Status</label>
									<div class="controls">
										<select name="txtUserStatus">
											<option value="-1" selected>Select status...</option>
											<option value="0">Inactive</option>
											<option value="1">Active</option>
										</select>
									</div>
								</div>
								<div class="control-group button-group">
									<button type="button" class="btn btn-flat" id="btnCancelAdd">Cancel</button>
									<button type="button" class="btn btn-green">Save</button>
								</div>
							</form>
						</div>
						<div class="modal-body">
							<table class="table table-stripped table-hover">
								<thead>
									<tr>
										<th>User ID</th>
										<th>Email</th>
										<th>Name</th>
										<th>Level</th>
										<th colspan="2">Actions</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>1</td>
										<td>201112039@daiict.ac.in</td>
										<td>Kushal Pandya</td>
										<td>Student</td>
										<td><a href="#EditGroupUser"><i class="icon-edit"></i>&nbsp;Edit</a></td>
										<td><a href="#"><i class="icon-trash"></i>&nbsp;Delete</a></td>
									</tr>
									<tr>
										<td>2</td>
										<td>201112071@daiict.ac.in</td>
										<td>Faishal Saiyed</td>
										<td>Student</td>
										<td><a href="#EditGroupUser"><i class="icon-edit"></i>&nbsp;Edit</a></td>
										<td><a href="#"><i class="icon-trash"></i>&nbsp;Delete</a></td>
									</tr>
								</tbody>
							</table>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-green" id="btnAddGroupMembers">Add Members</button>
							<button class="btn btn-flat" data-dismiss="modal" aria-hidden="true">Close</button>
						</div>
						<div class="modal-disable-overlay">&nbsp;</div>
					</div>
				</div>
				<div class="tab-pane" id="users">
					<div class="input-append">
						<input type="text" name="txtNewUser" placeholder="Enter user name to create..." class="span3" /><a href="#CreateUser" role="button" class="btn disabled">Add</a>
					</div>
					<table class="table table-stripped table-hover">
						<thead>
							<tr>
								<th>User ID</th>
								<th>Email</th>
								<th>Name</th>
								<th>Group</th>
								<th>Level</th>
								<th colspan="2">Actions</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>1</td>
								<td>201112039@daiict.ac.in</td>
								<td>Kushal Pandya</td>
								<td>MSc. I.T. 2011</td>
								<td>Student</td>
								<td><a href="#EditUser" data-toggle="modal"><i class="icon-edit"></i>&nbsp;Edit</a></td>
								<td><a href="#EditUser" data-toggle="modal"><i class="icon-trash"></i>&nbsp;Delete</a></td>
							</tr>
							<tr>
								<td>2</td>
								<td>asim_benerjee@daiict.ac.in</td>
								<td>Asim Benerjee</td>
								<td>Professors</td>
								<td>Professor</td>
								<td><a href="#EditUser" data-toggle="modal"><i class="icon-edit"></i>&nbsp;Edit</a></td>
								<td><a href="#EditUser" data-toggle="modal"><i class="icon-trash"></i>&nbsp;Delete</a></td>
							</tr>
							<tr>
								<td>3</td>
								<td>sbg@daiict.ac.in</td>
								<td>Student Body Government</td>
								<td>Community</td>
								<td>Student+</td>
							<td><a href="#EditUser" data-toggle="modal"><i class="icon-edit"></i>&nbsp;Edit</a></td>
								<td><a href="#EditUser" data-toggle="modal"><i class="icon-trash"></i>&nbsp;Delete</a></td>
							</tr>	
						</tbody>
					</table>
					<!-- Create User Modal -->
					<div class="modal hide fade" id="CreateUser" tabindex="-1" role="dialog" aria-labelledby="dlgLabel" aria-hidden="true">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
							<h3 id="dlgLabel">Create User</h3>
						</div>
						<div class="modal-body">
							<form class="form-horizontal">
								<div class="control-group">
									<label class="control-label">Email List</label>
									<div class="controls">
										<textarea name="txtUserEmail"></textarea>
									</div>
								</div>
								<div class="control-group">
										<label class="control-label">Group</label>
									<div class="controls">
										<select name="txtUserGroup">
											<option value="-1" selected>Select group...</option>
											<option value="0">MSc. I.T.</option>
											<option value="1">BTech 2009</option>
										</select>
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">Privilege</label>
									<div class="controls">
										<select name="txtUserPrivilege">
											<option value="-1" selected>Select level...</option>
											<option value="0">Student</option>
											<option value="1">Moderator</option>
											<option value="2">Professor</option>
											<option value="3">Administrator</option>
										</select>
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">Status</label>
									<div class="controls">
										<select name="txtUserStatus">
											<option value="-1" selected>Select status...</option>
											<option value="0">Inactive</option>
											<option value="1">Active</option>
										</select>
									</div>
								</div>
							</form>
						</div>
						<div class="modal-footer">
							<button class="btn btn-flat" data-dismiss="modal" aria-hidden="true">Close</button>
							<button class="btn btn-green">Save</button>
						</div>
					</div>
					<!-- Edit User Modal -->
					<div class="modal hide fade" id="EditUser" tabindex="-1" role="dialog" aria-labelledby="dlgLabel" aria-hidden="true">
							<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
							<h3 id="dlgLabel">Edit User</h3>
						</div>
						<div class="modal-body">
							<form class="form-horizontal">
								<div class="control-group">
									<label class="control-label">Email</label>
									<div class="controls">
										<input type="text" name="txtUserEmail" />
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">Group</label>
									<div class="controls">
										<select name="txtUserGroup">
											<option value="-1" selected>Select group...</option>
											<option value="0">MSc. I.T.</option>
											<option value="1">BTech 2009</option>
										</select>
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">Privilege</label>
									<div class="controls">
										<select name="txtUserPrivilege">
											<option value="-1" selected>Select level...</option>
											<option value="0">Student</option>
											<option value="1">Moderator</option>
											<option value="2">Professor</option>
											<option value="3">Administrator</option>
										</select>
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">Status</label>
									<div class="controls">
										<select name="txtUserStatus">
											<option value="-1" selected>Select status...</option>
											<option value="0">Inactive</option>
											<option value="1">Active</option>
										</select>
									</div>
								</div>
							</form>
						</div>
						<div class="modal-footer">
							<button class="btn btn-flat" data-dismiss="modal" aria-hidden="true">Close</button>
							<button class="btn btn-green">Save</button>
						</div>
					</div>
				</div>
			</div>
		</div>
		<script type="text/javascript" src="js/script.js"></script>
		<script type="text/javascript" src="js/controlpanel.js"></script>
	</body>
</html>