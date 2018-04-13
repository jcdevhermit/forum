<?php
	include ('layout_manager.php');
	include ('content_function.php');
	addview($_GET['cid'], $_GET['scid'], $_GET['tid']);
?>
<html>
<head><title>Home - FFForum</title></head>
<link href="/forum/styles/main.css" type="text/css" rel="stylesheet" />
<body>
	<div class="pane">
		<div class="header"><h1><a href="/forum">FFForum</a></h1></div>
		<div class="loginpane">
			<?php
				session_start();
				if (isset($_SESSION['username'])) {
					logout();
				} else {
					if (isset($_GET['status'])) {
						if ($_GET['status'] == 'reg-success') {
							echo "<h1 style='color: green;'>new user registered successfully!</h1>";
						} else if ($_GET['status'] == 'login-fail') {
							echo "<h1 style='color: red;'>invalid username and/or password!</h1>";
						}
					}
					loginform();
				}
			?>
		</div>
		<div class="forumdesc">
			<p>Welcome to FFForum where you can discuss anything in the universe!</p>
			<?php
				if (!isset($_SESSION['username'])) {
					echo "<p>please login first or <a href='/forum/register'>click here</a> to register.</p>";
				}
			?>
		</div>
		<?php
			if (isset($_SESSION['username'])) {
				replytopost($_GET['cid'], $_GET['scid'], $_GET['tid']);
			}
		?>
		<div class="content">
			<?php disptopic($_GET['cid'], $_GET['scid'], $_GET['tid']); ?>
		</div>
	</div>
</body>
</html>