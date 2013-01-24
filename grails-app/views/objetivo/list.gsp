
<%@ page import="herramientas_procesos.Objetivo" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'objetivo.label', default: 'Objetivo')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-objetivo" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-objetivo" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="descripcion" title="${message(code: 'objetivo.descripcion.label', default: 'Descripcion')}" />
					
						<g:sortableColumn property="seCumple" title="${message(code: 'objetivo.seCumple.label', default: 'Se Cumple')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${objetivoInstanceList}" status="i" var="objetivoInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${objetivoInstance.id}">${fieldValue(bean: objetivoInstance, field: "descripcion")}</g:link></td>
					
						<td><g:formatBoolean boolean="${objetivoInstance.seCumple}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${objetivoInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
