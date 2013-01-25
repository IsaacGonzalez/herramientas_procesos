<!DOCTYPE html>
<html lang="en">
	<head>
		<g:layoutTitle/>
		<r:layoutResources/>
		<style>
			body{
				background: url(<g:resource dir="images" file="wild_oliva.png" />);
			}
			.navbar .brand {
				margin-left: 0px;
			}
			.container{
				background: white;
				border-radius: 0px 0px 15px 15px;
				padding: 20px;
				-webkit-box-sizing: border-box;
					-moz-box-sizing: border-box;
						box-sizing: border-box;
			}
		</style>
	</head>
	<body>
	<div class="navbar navbar-static-top">
		<div class="navbar-inner">
			<a class="brand" href="${createLink(uri: '/')}">Herramientas Procesos</a>
			<ul class="nav">
				<li><a href="#">Acerca De</a></li>
				<li><a href="#">Contacto</a></li>
				<li><a href="#">Reportar Bugs</a></li>
			</ul>
		</div>
	</div>
		<div class="container">
			<g:layoutBody/>
		</div>      
		<r:layoutResources/>
	</body>
</html>