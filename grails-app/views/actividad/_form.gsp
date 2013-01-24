<%@ page import="herramientas_procesos.Actividad" %>



<div class="fieldcontain ${hasErrors(bean: actividadInstance, field: 'nombre', 'error')} required">
	<label for="nombre">
		<g:message code="actividad.nombre.label" default="Nombre" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nombre" required="" value="${actividadInstance?.nombre}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: actividadInstance, field: 'descripcion', 'error')} required">
	<label for="descripcion">
		<g:message code="actividad.descripcion.label" default="Descripcion" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="descripcion" required="" value="${actividadInstance?.descripcion}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: actividadInstance, field: 'tipo', 'error')} ">
	<label for="tipo">
		<g:message code="actividad.tipo.label" default="Tipo" />
		
	</label>
	<g:select name="tipo" from="${actividadInstance.constraints.tipo.inList}" value="${actividadInstance?.tipo}" valueMessagePrefix="actividad.tipo" noSelection="['': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: actividadInstance, field: 'duracionMinutos', 'error')} required">
	<label for="duracionMinutos">
		<g:message code="actividad.duracionMinutos.label" default="Duracion Minutos" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="duracionMinutos" value="${fieldValue(bean: actividadInstance, field: 'duracionMinutos')}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: actividadInstance, field: 'agregaValor', 'error')} ">
	<label for="agregaValor">
		<g:message code="actividad.agregaValor.label" default="Agrega Valor" />
		
	</label>
	<g:checkBox name="agregaValor" value="${actividadInstance?.agregaValor}" />
</div>

<div class="fieldcontain ${hasErrors(bean: actividadInstance, field: 'esNecesaria', 'error')} ">
	<label for="esNecesaria">
		<g:message code="actividad.esNecesaria.label" default="Es Necesaria" />
		
	</label>
	<g:checkBox name="esNecesaria" value="${actividadInstance?.esNecesaria}" />
</div>

<div class="fieldcontain ${hasErrors(bean: actividadInstance, field: 'salidaGenerada', 'error')} required">
	<label for="salidaGenerada">
		<g:message code="actividad.salidaGenerada.label" default="Salida Generada" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="salidaGenerada" name="salidaGenerada.id" from="${herramientas_procesos.Salida.list()}" optionKey="id" required="" value="${actividadInstance?.salidaGenerada?.id}" class="many-to-one"/>
</div>

