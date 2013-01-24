<%@ page import="herramientas_procesos.Objetivo" %>



<div class="fieldcontain ${hasErrors(bean: objetivoInstance, field: 'descripcion', 'error')} required">
	<label for="descripcion">
		<g:message code="objetivo.descripcion.label" default="Descripcion" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="descripcion" required="" value="${objetivoInstance?.descripcion}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: objetivoInstance, field: 'seCumple', 'error')} ">
	<label for="seCumple">
		<g:message code="objetivo.seCumple.label" default="Se Cumple" />
		
	</label>
	<g:checkBox name="seCumple" value="${objetivoInstance?.seCumple}" />
</div>

