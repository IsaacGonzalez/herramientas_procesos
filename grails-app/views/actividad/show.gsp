
<%@ page import="herramientas_procesos.Actividad" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'actividad.label', default: 'Actividad')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
		<r:require modules="bootstrap"/>
	</head>
	<body>
		<a href="#show-actividad" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-actividad" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list actividad">
			
				<g:if test="${actividadInstance?.nombre}">
				<li class="fieldcontain">
					<span id="nombre-label" class="property-label"><g:message code="actividad.nombre.label" default="Nombre" /></span>
					
						<span class="property-value" aria-labelledby="nombre-label"><g:fieldValue bean="${actividadInstance}" field="nombre"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${actividadInstance?.descripcion}">
				<li class="fieldcontain">
					<span id="descripcion-label" class="property-label"><g:message code="actividad.descripcion.label" default="Descripcion" /></span>
					
						<span class="property-value" aria-labelledby="descripcion-label"><g:fieldValue bean="${actividadInstance}" field="descripcion"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${actividadInstance?.tipo}">
				<li class="fieldcontain">
					<span id="tipo-label" class="property-label"><g:message code="actividad.tipo.label" default="Tipo" /></span>
					
						<span class="property-value" aria-labelledby="tipo-label"><g:fieldValue bean="${actividadInstance}" field="tipo"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${actividadInstance?.duracionMinutos}">
				<li class="fieldcontain">
					<span id="duracionMinutos-label" class="property-label"><g:message code="actividad.duracionMinutos.label" default="Duracion Minutos" /></span>
					
						<span class="property-value" aria-labelledby="duracionMinutos-label"><g:fieldValue bean="${actividadInstance}" field="duracionMinutos"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${actividadInstance?.agregaValor}">
				<li class="fieldcontain">
					<span id="agregaValor-label" class="property-label"><g:message code="actividad.agregaValor.label" default="Agrega Valor" /></span>
					
						<span class="property-value" aria-labelledby="agregaValor-label"><g:formatBoolean boolean="${actividadInstance?.agregaValor}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${actividadInstance?.esNecesaria}">
				<li class="fieldcontain">
					<span id="esNecesaria-label" class="property-label"><g:message code="actividad.esNecesaria.label" default="Es Necesaria" /></span>
					
						<span class="property-value" aria-labelledby="esNecesaria-label"><g:formatBoolean boolean="${actividadInstance?.esNecesaria}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${actividadInstance?.salidaGenerada}">
				<li class="fieldcontain">
					<span id="salidaGenerada-label" class="property-label"><g:message code="actividad.salidaGenerada.label" default="Salida Generada" /></span>
					
						<span class="property-value" aria-labelledby="salidaGenerada-label"><g:link controller="salida" action="show" id="${actividadInstance?.salidaGenerada?.id}">${actividadInstance?.salidaGenerada?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${actividadInstance?.id}" />
					<g:link class="edit" action="edit" id="${actividadInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
