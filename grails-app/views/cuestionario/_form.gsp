<%@ page import="herramientas_procesos.Cuestionario" %>



<div class="fieldcontain ${hasErrors(bean: cuestionarioInstance, field: 'nombre', 'error')} required">
	<label for="nombre">
		<g:message code="cuestionario.nombre.label" default="Nombre" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nombre" required="" value="${cuestionarioInstance?.nombre}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: cuestionarioInstance, field: 'preguntas', 'error')} ">
	<label for="preguntas">
		<g:message code="cuestionario.preguntas.label" default="Preguntas" />
		
	</label>
	<g:select name="preguntas" from="${herramientas_procesos.Pregunta.list()}" multiple="multiple" optionKey="id" size="5" value="${cuestionarioInstance?.preguntas*.id}" class="many-to-many"/>
</div>

