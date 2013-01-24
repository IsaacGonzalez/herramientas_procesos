
<%@ page import="herramientas_procesos.Subproceso" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'subproceso.label', default: 'Subproceso')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-subproceso" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-subproceso" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list subproceso">
			
				<g:if test="${subprocesoInstance?.nombre}">
				<li class="fieldcontain">
					<span id="nombre-label" class="property-label"><g:message code="subproceso.nombre.label" default="Nombre" /></span>
					
						<span class="property-value" aria-labelledby="nombre-label"><g:fieldValue bean="${subprocesoInstance}" field="nombre"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${subprocesoInstance?.descripcion}">
				<li class="fieldcontain">
					<span id="descripcion-label" class="property-label"><g:message code="subproceso.descripcion.label" default="Descripcion" /></span>
					
						<span class="property-value" aria-labelledby="descripcion-label"><g:fieldValue bean="${subprocesoInstance}" field="descripcion"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${subprocesoInstance?.actividades}">
				<li class="fieldcontain">
					<span id="actividades-label" class="property-label"><g:message code="subproceso.actividades.label" default="Actividades" /></span>
					
						<g:each in="${subprocesoInstance.actividades}" var="a">
						<span class="property-value" aria-labelledby="actividades-label"><g:link controller="actividad" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${subprocesoInstance?.entradas}">
				<li class="fieldcontain">
					<span id="entradas-label" class="property-label"><g:message code="subproceso.entradas.label" default="Entradas" /></span>
					
						<g:each in="${subprocesoInstance.entradas}" var="e">
						<span class="property-value" aria-labelledby="entradas-label"><g:link controller="entrada" action="show" id="${e.id}">${e?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${subprocesoInstance?.salidaGenerada}">
				<li class="fieldcontain">
					<span id="salidaGenerada-label" class="property-label"><g:message code="subproceso.salidaGenerada.label" default="Salida Generada" /></span>
					
						<span class="property-value" aria-labelledby="salidaGenerada-label"><g:link controller="salida" action="show" id="${subprocesoInstance?.salidaGenerada?.id}">${subprocesoInstance?.salidaGenerada?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${subprocesoInstance?.id}" />
					<g:link class="edit" action="edit" id="${subprocesoInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
