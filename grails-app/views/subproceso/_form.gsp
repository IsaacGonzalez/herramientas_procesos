<%@ page import="herramientas_procesos.Subproceso" %>



<div class="fieldcontain ${hasErrors(bean: subprocesoInstance, field: 'nombre', 'error')} required">
	<label for="nombre">
		<g:message code="subproceso.nombre.label" default="Nombre" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nombre" required="" value="${subprocesoInstance?.nombre}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: subprocesoInstance, field: 'descripcion', 'error')} required">
	<label for="descripcion">
		<g:message code="subproceso.descripcion.label" default="Descripcion" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="descripcion" required="" value="${subprocesoInstance?.descripcion}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: subprocesoInstance, field: 'actividades', 'error')} ">
	<label for="actividades">
		<g:message code="subproceso.actividades.label" default="Actividades" />
		
	</label>
	<g:select name="actividades" from="${herramientas_procesos.Actividad.list()}" multiple="multiple" optionKey="id" size="5" value="${subprocesoInstance?.actividades*.id}" class="many-to-many"/>
</div>

<div class="fieldcontain ${hasErrors(bean: subprocesoInstance, field: 'entradas', 'error')} ">
	<label for="entradas">
		<g:message code="subproceso.entradas.label" default="Entradas" />
		
	</label>
	<g:select name="entradas" from="${herramientas_procesos.Entrada.list()}" multiple="multiple" optionKey="id" size="5" value="${subprocesoInstance?.entradas*.id}" class="many-to-many"/>
</div>

<div class="fieldcontain ${hasErrors(bean: subprocesoInstance, field: 'salidaGenerada', 'error')} required">
	<label for="salidaGenerada">
		<g:message code="subproceso.salidaGenerada.label" default="Salida Generada" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="salidaGenerada" name="salidaGenerada.id" from="${herramientas_procesos.Salida.list()}" optionKey="id" required="" value="${subprocesoInstance?.salidaGenerada?.id}" class="many-to-one"/>
</div>

