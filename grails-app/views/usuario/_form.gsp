<%@ page import="herramientas_procesos.Usuario" %>



<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'rol', 'error')} required">
	<label for="rol">
		<g:message code="usuario.rol.label" default="Rol" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="rol" required="" value="${usuarioInstance?.rol}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'correo', 'error')} required">
	<label for="correo">
		<g:message code="usuario.correo.label" default="Correo" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="email" name="correo" required="" value="${usuarioInstance?.correo}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'apellido', 'error')} ">
	<label for="apellido">
		<g:message code="usuario.apellido.label" default="Apellido" />
		
	</label>
	<g:textField name="apellido" value="${usuarioInstance?.apellido}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'nombre', 'error')} ">
	<label for="nombre">
		<g:message code="usuario.nombre.label" default="Nombre" />
		
	</label>
	<g:textField name="nombre" value="${usuarioInstance?.nombre}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'salidaRecibida', 'error')} required">
	<label for="salidaRecibida">
		<g:message code="usuario.salidaRecibida.label" default="Salida Recibida" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="salidaRecibida" name="salidaRecibida.id" from="${herramientas_procesos.Salida.list()}" optionKey="id" required="" value="${usuarioInstance?.salidaRecibida?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'telefono', 'error')} ">
	<label for="telefono">
		<g:message code="usuario.telefono.label" default="Telefono" />
		
	</label>
	<g:textField name="telefono" value="${usuarioInstance?.telefono}"/>
</div>

