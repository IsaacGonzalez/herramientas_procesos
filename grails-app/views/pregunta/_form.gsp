<%@ page import="herramientas_procesos.Pregunta" %>



<div class="fieldcontain ${hasErrors(bean: preguntaInstance, field: 'interrogante', 'error')} required">
	<label for="interrogante">
		<g:message code="pregunta.interrogante.label" default="Interrogante" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="interrogante" required="" value="${preguntaInstance?.interrogante}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: preguntaInstance, field: 'respuesta', 'error')} required">
	<label for="respuesta">
		<g:message code="pregunta.respuesta.label" default="Respuesta" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="respuesta" required="" value="${preguntaInstance?.respuesta}"/>
</div>

