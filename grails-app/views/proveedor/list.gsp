
<%@ page import="herramientas_procesos.Proveedor" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'proveedor.label', default: 'Proveedor')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-proveedor" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-proveedor" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="estado" title="${message(code: 'proveedor.estado.label', default: 'Estado')}" />
					
						<g:sortableColumn property="municipio" title="${message(code: 'proveedor.municipio.label', default: 'Municipio')}" />
					
						<g:sortableColumn property="colonia" title="${message(code: 'proveedor.colonia.label', default: 'Colonia')}" />
					
						<g:sortableColumn property="calleYNumero" title="${message(code: 'proveedor.calleYNumero.label', default: 'Calle YN umero')}" />
					
						<g:sortableColumn property="correo" title="${message(code: 'proveedor.correo.label', default: 'Correo')}" />
					
						<g:sortableColumn property="apellido" title="${message(code: 'proveedor.apellido.label', default: 'Apellido')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${proveedorInstanceList}" status="i" var="proveedorInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${proveedorInstance.id}">${fieldValue(bean: proveedorInstance, field: "estado")}</g:link></td>
					
						<td>${fieldValue(bean: proveedorInstance, field: "municipio")}</td>
					
						<td>${fieldValue(bean: proveedorInstance, field: "colonia")}</td>
					
						<td>${fieldValue(bean: proveedorInstance, field: "calleYNumero")}</td>
					
						<td>${fieldValue(bean: proveedorInstance, field: "correo")}</td>
					
						<td>${fieldValue(bean: proveedorInstance, field: "apellido")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${proveedorInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
