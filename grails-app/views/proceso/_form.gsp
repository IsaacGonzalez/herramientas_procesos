<%@ page import="herramientas_procesos.Proceso" %>



<div class="fieldcontain ${hasErrors(bean: procesoInstance, field: 'nombre', 'error')} required">
	<label for="nombre">
		<g:message code="proceso.nombre.label" default="Nombre" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nombre" required="" value="${procesoInstance?.nombre}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: procesoInstance, field: 'cincoW', 'error')} required">
	<label for="cincoW">
		<g:message code="proceso.cincoW.label" default="Cinco W" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="cincoW" name="cincoW.id" from="${herramientas_procesos.Cuestionario.list()}" optionKey="id" required="" value="${procesoInstance?.cincoW?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: procesoInstance, field: 'definicion', 'error')} required">
	<label for="definicion">
		<g:message code="proceso.definicion.label" default="Definicion" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="definicion" name="definicion.id" from="${herramientas_procesos.Definicion.list()}" optionKey="id" required="" value="${procesoInstance?.definicion?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: procesoInstance, field: 'diagnostico', 'error')} required">
	<label for="diagnostico">
		<g:message code="proceso.diagnostico.label" default="Diagnostico" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="diagnostico" name="diagnostico.id" from="${herramientas_procesos.Cuestionario.list()}" optionKey="id" required="" value="${procesoInstance?.diagnostico?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: procesoInstance, field: 'fechaInicio', 'error')} required">
	<label for="fechaInicio">
		<g:message code="proceso.fechaInicio.label" default="Fecha Inicio" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="fechaInicio" precision="day"  value="${procesoInstance?.fechaInicio}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: procesoInstance, field: 'fechaTerminacion', 'error')} required">
	<label for="fechaTerminacion">
		<g:message code="proceso.fechaTerminacion.label" default="Fecha Terminacion" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="fechaTerminacion" precision="day"  value="${procesoInstance?.fechaTerminacion}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: procesoInstance, field: 'objetivos', 'error')} ">
	<label for="objetivos">
		<g:message code="proceso.objetivos.label" default="Objetivos" />
		
	</label>
	<g:select name="objetivos" from="${herramientas_procesos.Objetivo.list()}" multiple="multiple" optionKey="id" size="5" value="${procesoInstance?.objetivos*.id}" class="many-to-many"/>
</div>

