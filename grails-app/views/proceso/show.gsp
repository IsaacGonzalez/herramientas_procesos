
<%@ page import="herramientas_procesos.Proceso" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'proceso.label', default: 'Proceso')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-proceso" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-proceso" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list proceso">
			
				<g:if test="${procesoInstance?.nombre}">
				<li class="fieldcontain">
					<span id="nombre-label" class="property-label"><g:message code="proceso.nombre.label" default="Nombre" /></span>
					
						<span class="property-value" aria-labelledby="nombre-label"><g:fieldValue bean="${procesoInstance}" field="nombre"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${procesoInstance?.cincoW}">
				<li class="fieldcontain">
					<span id="cincoW-label" class="property-label"><g:message code="proceso.cincoW.label" default="Cinco W" /></span>
					
						<span class="property-value" aria-labelledby="cincoW-label"><g:link controller="cuestionario" action="show" id="${procesoInstance?.cincoW?.id}">${procesoInstance?.cincoW?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${procesoInstance?.definicion}">
				<li class="fieldcontain">
					<span id="definicion-label" class="property-label"><g:message code="proceso.definicion.label" default="Definicion" /></span>
					
						<span class="property-value" aria-labelledby="definicion-label"><g:link controller="definicion" action="show" id="${procesoInstance?.definicion?.id}">${procesoInstance?.definicion?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${procesoInstance?.diagnostico}">
				<li class="fieldcontain">
					<span id="diagnostico-label" class="property-label"><g:message code="proceso.diagnostico.label" default="Diagnostico" /></span>
					
						<span class="property-value" aria-labelledby="diagnostico-label"><g:link controller="cuestionario" action="show" id="${procesoInstance?.diagnostico?.id}">${procesoInstance?.diagnostico?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${procesoInstance?.fechaInicio}">
				<li class="fieldcontain">
					<span id="fechaInicio-label" class="property-label"><g:message code="proceso.fechaInicio.label" default="Fecha Inicio" /></span>
					
						<span class="property-value" aria-labelledby="fechaInicio-label"><g:formatDate date="${procesoInstance?.fechaInicio}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${procesoInstance?.fechaTerminacion}">
				<li class="fieldcontain">
					<span id="fechaTerminacion-label" class="property-label"><g:message code="proceso.fechaTerminacion.label" default="Fecha Terminacion" /></span>
					
						<span class="property-value" aria-labelledby="fechaTerminacion-label"><g:formatDate date="${procesoInstance?.fechaTerminacion}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${procesoInstance?.objetivos}">
				<li class="fieldcontain">
					<span id="objetivos-label" class="property-label"><g:message code="proceso.objetivos.label" default="Objetivos" /></span>
					
						<g:each in="${procesoInstance.objetivos}" var="o">
						<span class="property-value" aria-labelledby="objetivos-label"><g:link controller="objetivo" action="show" id="${o.id}">${o?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${procesoInstance?.id}" />
					<g:link class="edit" action="edit" id="${procesoInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
