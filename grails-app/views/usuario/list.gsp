
<%@ page import="herramientas_procesos.Usuario" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'usuario.label', default: 'Usuario')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-usuario" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-usuario" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="rol" title="${message(code: 'usuario.rol.label', default: 'Rol')}" />
					
						<g:sortableColumn property="correo" title="${message(code: 'usuario.correo.label', default: 'Correo')}" />
					
						<g:sortableColumn property="apellido" title="${message(code: 'usuario.apellido.label', default: 'Apellido')}" />
					
						<g:sortableColumn property="nombre" title="${message(code: 'usuario.nombre.label', default: 'Nombre')}" />
					
						<th><g:message code="usuario.salidaRecibida.label" default="Salida Recibida" /></th>
					
						<g:sortableColumn property="telefono" title="${message(code: 'usuario.telefono.label', default: 'Telefono')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${usuarioInstanceList}" status="i" var="usuarioInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${usuarioInstance.id}">${fieldValue(bean: usuarioInstance, field: "rol")}</g:link></td>
					
						<td>${fieldValue(bean: usuarioInstance, field: "correo")}</td>
					
						<td>${fieldValue(bean: usuarioInstance, field: "apellido")}</td>
					
						<td>${fieldValue(bean: usuarioInstance, field: "nombre")}</td>
					
						<td>${fieldValue(bean: usuarioInstance, field: "salidaRecibida")}</td>
					
						<td>${fieldValue(bean: usuarioInstance, field: "telefono")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${usuarioInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
