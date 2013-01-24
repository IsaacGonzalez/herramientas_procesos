<%@ page import="herramientas_procesos.Salida" %>



<div class="fieldcontain ${hasErrors(bean: salidaInstance, field: 'nombre', 'error')} required">
	<label for="nombre">
		<g:message code="salida.nombre.label" default="Nombre" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nombre" required="" value="${salidaInstance?.nombre}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: salidaInstance, field: 'descripcion', 'error')} required">
	<label for="descripcion">
		<g:message code="salida.descripcion.label" default="Descripcion" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="descripcion" required="" value="${salidaInstance?.descripcion}"/>
</div>

