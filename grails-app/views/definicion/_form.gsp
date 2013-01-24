<%@ page import="herramientas_procesos.Definicion" %>



<div class="fieldcontain ${hasErrors(bean: definicionInstance, field: 'actividades', 'error')} ">
	<label for="actividades">
		<g:message code="definicion.actividades.label" default="Actividades" />
		
	</label>
	<g:select name="actividades" from="${herramientas_procesos.Actividad.list()}" multiple="multiple" optionKey="id" size="5" value="${definicionInstance?.actividades*.id}" class="many-to-many"/>
</div>

<div class="fieldcontain ${hasErrors(bean: definicionInstance, field: 'proveedores', 'error')} ">
	<label for="proveedores">
		<g:message code="definicion.proveedores.label" default="Proveedores" />
		
	</label>
	<g:select name="proveedores" from="${herramientas_procesos.Proveedor.list()}" multiple="multiple" optionKey="id" size="5" value="${definicionInstance?.proveedores*.id}" class="many-to-many"/>
</div>

<div class="fieldcontain ${hasErrors(bean: definicionInstance, field: 'subprocesos', 'error')} ">
	<label for="subprocesos">
		<g:message code="definicion.subprocesos.label" default="Subprocesos" />
		
	</label>
	<g:select name="subprocesos" from="${herramientas_procesos.Subproceso.list()}" multiple="multiple" optionKey="id" size="5" value="${definicionInstance?.subprocesos*.id}" class="many-to-many"/>
</div>

<div class="fieldcontain ${hasErrors(bean: definicionInstance, field: 'usuarios', 'error')} ">
	<label for="usuarios">
		<g:message code="definicion.usuarios.label" default="Usuarios" />
		
	</label>
	<g:select name="usuarios" from="${herramientas_procesos.Usuario.list()}" multiple="multiple" optionKey="id" size="5" value="${definicionInstance?.usuarios*.id}" class="many-to-many"/>
</div>

