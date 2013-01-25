<html>
   <head>
      <meta name="layout" content="main"/>
      <r:require modules="bootstrap"/>
   </head>
   
<body>
<div class="row">
	<div class="span2">
		<ul class="nav nav-list">
		  <li class="nav-header">Controladores</li>
			<g:each var="c" in="${grailsApplication.controllerClasses.sort { it.fullName } }">
				<li>
					<g:link controller="${c.logicalPropertyName}">${c.name}</g:link>
				</li>
			</g:each>
		</ul>
	</div>
	<div class="span9">
		<div class="hero-unit" id="hero">
			<h1>Analisis de Procesos</h1>
		</div>
	</div>
	<div class="span9">
		<p>
			Es m&aacute;s f&aacute;cil alcanzar los resultados esperados cuando se utilizan herramientas apropiadas para el prop&oacute;sito perseguido. Es por ello que proponemos una serie de herramientas que facilitan el logro de los objetivos del sistema Procesos Eficientes.
		</p>
	</div>	
</div>
<style>
	#hero {
		background: url(<g:resource dir="images" file="gears.jpg" />) no-repeat top center;
		background-size: 100%;
		color: white;
		text-shadow: 2px 8px 6px rgba(0,0,0,0.2),
                 0px -5px 35px rgba(255,255,255,0.3);
	}
</style>

</body>
</html>