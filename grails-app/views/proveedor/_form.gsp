<%@ page import="herramientas_procesos.Proveedor" %>



<div class="fieldcontain ${hasErrors(bean: proveedorInstance, field: 'estado', 'error')} required">
	<label for="estado">
		<g:message code="proveedor.estado.label" default="Estado" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="estado" required="" value="${proveedorInstance?.estado}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: proveedorInstance, field: 'municipio', 'error')} required">
	<label for="municipio">
		<g:message code="proveedor.municipio.label" default="Municipio" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="municipio" required="" value="${proveedorInstance?.municipio}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: proveedorInstance, field: 'colonia', 'error')} required">
	<label for="colonia">
		<g:message code="proveedor.colonia.label" default="Colonia" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="colonia" required="" value="${proveedorInstance?.colonia}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: proveedorInstance, field: 'calleYNumero', 'error')} required">
	<label for="calleYNumero">
		<g:message code="proveedor.calleYNumero.label" default="Calle YN umero" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="calleYNumero" required="" value="${proveedorInstance?.calleYNumero}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: proveedorInstance, field: 'correo', 'error')} required">
	<label for="correo">
		<g:message code="proveedor.correo.label" default="Correo" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="email" name="correo" required="" value="${proveedorInstance?.correo}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: proveedorInstance, field: 'apellido', 'error')} ">
	<label for="apellido">
		<g:message code="proveedor.apellido.label" default="Apellido" />
		
	</label>
	<g:textField name="apellido" value="${proveedorInstance?.apellido}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: proveedorInstance, field: 'interno', 'error')} ">
	<label for="interno">
		<g:message code="proveedor.interno.label" default="Interno" />
		
	</label>
	<g:checkBox name="interno" value="${proveedorInstance?.interno}" />
</div>

<div class="fieldcontain ${hasErrors(bean: proveedorInstance, field: 'nombre', 'error')} ">
	<label for="nombre">
		<g:message code="proveedor.nombre.label" default="Nombre" />
		
	</label>
	<g:textField name="nombre" value="${proveedorInstance?.nombre}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: proveedorInstance, field: 'telefono', 'error')} ">
	<label for="telefono">
		<g:message code="proveedor.telefono.label" default="Telefono" />
		
	</label>
	<g:textField name="telefono" value="${proveedorInstance?.telefono}"/>
</div>

