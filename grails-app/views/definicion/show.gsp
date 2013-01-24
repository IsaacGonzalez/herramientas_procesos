
<%@ page import="herramientas_procesos.Definicion" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'definicion.label', default: 'Definicion')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-definicion" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-definicion" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list definicion">
			
				<g:if test="${definicionInstance?.actividades}">
				<li class="fieldcontain">
					<span id="actividades-label" class="property-label"><g:message code="definicion.actividades.label" default="Actividades" /></span>
					
						<g:each in="${definicionInstance.actividades}" var="a">
						<span class="property-value" aria-labelledby="actividades-label"><g:link controller="actividad" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${definicionInstance?.proveedores}">
				<li class="fieldcontain">
					<span id="proveedores-label" class="property-label"><g:message code="definicion.proveedores.label" default="Proveedores" /></span>
					
						<g:each in="${definicionInstance.proveedores}" var="p">
						<span class="property-value" aria-labelledby="proveedores-label"><g:link controller="proveedor" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${definicionInstance?.subprocesos}">
				<li class="fieldcontain">
					<span id="subprocesos-label" class="property-label"><g:message code="definicion.subprocesos.label" default="Subprocesos" /></span>
					
						<g:each in="${definicionInstance.subprocesos}" var="s">
						<span class="property-value" aria-labelledby="subprocesos-label"><g:link controller="subproceso" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${definicionInstance?.usuarios}">
				<li class="fieldcontain">
					<span id="usuarios-label" class="property-label"><g:message code="definicion.usuarios.label" default="Usuarios" /></span>
					
						<g:each in="${definicionInstance.usuarios}" var="u">
						<span class="property-value" aria-labelledby="usuarios-label"><g:link controller="usuario" action="show" id="${u.id}">${u?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${definicionInstance?.id}" />
					<g:link class="edit" action="edit" id="${definicionInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
