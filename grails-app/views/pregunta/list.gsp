
<%@ page import="herramientas_procesos.Pregunta" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'pregunta.label', default: 'Pregunta')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-pregunta" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-pregunta" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="interrogante" title="${message(code: 'pregunta.interrogante.label', default: 'Interrogante')}" />
					
						<g:sortableColumn property="respuesta" title="${message(code: 'pregunta.respuesta.label', default: 'Respuesta')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${preguntaInstanceList}" status="i" var="preguntaInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${preguntaInstance.id}">${fieldValue(bean: preguntaInstance, field: "interrogante")}</g:link></td>
					
						<td>${fieldValue(bean: preguntaInstance, field: "respuesta")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${preguntaInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
