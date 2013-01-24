<%@ page import="herramientas_procesos.Entidad" %>



<div class="fieldcontain ${hasErrors(bean: entidadInstance, field: 'apellido', 'error')} ">
	<label for="apellido">
		<g:message code="entidad.apellido.label" default="Apellido" />
		
	</label>
	<g:textField name="apellido" value="${entidadInstance?.apellido}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: entidadInstance, field: 'correo', 'error')} ">
	<label for="correo">
		<g:message code="entidad.correo.label" default="Correo" />
		
	</label>
	<g:textField name="correo" value="${entidadInstance?.correo}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: entidadInstance, field: 'nombre', 'error')} ">
	<label for="nombre">
		<g:message code="entidad.nombre.label" default="Nombre" />
		
	</label>
	<g:textField name="nombre" value="${entidadInstance?.nombre}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: entidadInstance, field: 'telefono', 'error')} ">
	<label for="telefono">
		<g:message code="entidad.telefono.label" default="Telefono" />
		
	</label>
	<g:textField name="telefono" value="${entidadInstance?.telefono}"/>
</div>

