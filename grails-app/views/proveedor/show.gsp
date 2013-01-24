
<%@ page import="herramientas_procesos.Proveedor" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'proveedor.label', default: 'Proveedor')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-proveedor" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-proveedor" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list proveedor">
			
				<g:if test="${proveedorInstance?.estado}">
				<li class="fieldcontain">
					<span id="estado-label" class="property-label"><g:message code="proveedor.estado.label" default="Estado" /></span>
					
						<span class="property-value" aria-labelledby="estado-label"><g:fieldValue bean="${proveedorInstance}" field="estado"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${proveedorInstance?.municipio}">
				<li class="fieldcontain">
					<span id="municipio-label" class="property-label"><g:message code="proveedor.municipio.label" default="Municipio" /></span>
					
						<span class="property-value" aria-labelledby="municipio-label"><g:fieldValue bean="${proveedorInstance}" field="municipio"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${proveedorInstance?.colonia}">
				<li class="fieldcontain">
					<span id="colonia-label" class="property-label"><g:message code="proveedor.colonia.label" default="Colonia" /></span>
					
						<span class="property-value" aria-labelledby="colonia-label"><g:fieldValue bean="${proveedorInstance}" field="colonia"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${proveedorInstance?.calleYNumero}">
				<li class="fieldcontain">
					<span id="calleYNumero-label" class="property-label"><g:message code="proveedor.calleYNumero.label" default="Calle YN umero" /></span>
					
						<span class="property-value" aria-labelledby="calleYNumero-label"><g:fieldValue bean="${proveedorInstance}" field="calleYNumero"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${proveedorInstance?.correo}">
				<li class="fieldcontain">
					<span id="correo-label" class="property-label"><g:message code="proveedor.correo.label" default="Correo" /></span>
					
						<span class="property-value" aria-labelledby="correo-label"><g:fieldValue bean="${proveedorInstance}" field="correo"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${proveedorInstance?.apellido}">
				<li class="fieldcontain">
					<span id="apellido-label" class="property-label"><g:message code="proveedor.apellido.label" default="Apellido" /></span>
					
						<span class="property-value" aria-labelledby="apellido-label"><g:fieldValue bean="${proveedorInstance}" field="apellido"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${proveedorInstance?.interno}">
				<li class="fieldcontain">
					<span id="interno-label" class="property-label"><g:message code="proveedor.interno.label" default="Interno" /></span>
					
						<span class="property-value" aria-labelledby="interno-label"><g:formatBoolean boolean="${proveedorInstance?.interno}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${proveedorInstance?.nombre}">
				<li class="fieldcontain">
					<span id="nombre-label" class="property-label"><g:message code="proveedor.nombre.label" default="Nombre" /></span>
					
						<span class="property-value" aria-labelledby="nombre-label"><g:fieldValue bean="${proveedorInstance}" field="nombre"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${proveedorInstance?.telefono}">
				<li class="fieldcontain">
					<span id="telefono-label" class="property-label"><g:message code="proveedor.telefono.label" default="Telefono" /></span>
					
						<span class="property-value" aria-labelledby="telefono-label"><g:fieldValue bean="${proveedorInstance}" field="telefono"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${proveedorInstance?.id}" />
					<g:link class="edit" action="edit" id="${proveedorInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
