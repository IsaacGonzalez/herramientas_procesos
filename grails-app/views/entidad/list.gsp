
<%@ page import="herramientas_procesos.Entidad" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'entidad.label', default: 'Entidad')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-entidad" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-entidad" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="apellido" title="${message(code: 'entidad.apellido.label', default: 'Apellido')}" />
					
						<g:sortableColumn property="correo" title="${message(code: 'entidad.correo.label', default: 'Correo')}" />
					
						<g:sortableColumn property="nombre" title="${message(code: 'entidad.nombre.label', default: 'Nombre')}" />
					
						<g:sortableColumn property="telefono" title="${message(code: 'entidad.telefono.label', default: 'Telefono')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${entidadInstanceList}" status="i" var="entidadInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${entidadInstance.id}">${fieldValue(bean: entidadInstance, field: "apellido")}</g:link></td>
					
						<td>${fieldValue(bean: entidadInstance, field: "correo")}</td>
					
						<td>${fieldValue(bean: entidadInstance, field: "nombre")}</td>
					
						<td>${fieldValue(bean: entidadInstance, field: "telefono")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${entidadInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
