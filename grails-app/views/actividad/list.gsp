
<%@ page import="herramientas_procesos.Actividad" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'actividad.label', default: 'Actividad')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-actividad" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-actividad" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="nombre" title="${message(code: 'actividad.nombre.label', default: 'Nombre')}" />
					
						<g:sortableColumn property="descripcion" title="${message(code: 'actividad.descripcion.label', default: 'Descripcion')}" />
					
						<g:sortableColumn property="tipo" title="${message(code: 'actividad.tipo.label', default: 'Tipo')}" />
					
						<g:sortableColumn property="duracionMinutos" title="${message(code: 'actividad.duracionMinutos.label', default: 'Duracion Minutos')}" />
					
						<g:sortableColumn property="agregaValor" title="${message(code: 'actividad.agregaValor.label', default: 'Agrega Valor')}" />
					
						<g:sortableColumn property="esNecesaria" title="${message(code: 'actividad.esNecesaria.label', default: 'Es Necesaria')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${actividadInstanceList}" status="i" var="actividadInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${actividadInstance.id}">${fieldValue(bean: actividadInstance, field: "nombre")}</g:link></td>
					
						<td>${fieldValue(bean: actividadInstance, field: "descripcion")}</td>
					
						<td>${fieldValue(bean: actividadInstance, field: "tipo")}</td>
					
						<td>${fieldValue(bean: actividadInstance, field: "duracionMinutos")}</td>
					
						<td><g:formatBoolean boolean="${actividadInstance.agregaValor}" /></td>
					
						<td><g:formatBoolean boolean="${actividadInstance.esNecesaria}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${actividadInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
