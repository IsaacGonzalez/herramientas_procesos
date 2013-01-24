<%@ page import="herramientas_procesos.Entrada" %>



<div class="fieldcontain ${hasErrors(bean: entradaInstance, field: 'descripcion', 'error')} ">
	<label for="descripcion">
		<g:message code="entrada.descripcion.label" default="Descripcion" />
		
	</label>
	<g:textField name="descripcion" value="${entradaInstance?.descripcion}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: entradaInstance, field: 'nombre', 'error')} ">
	<label for="nombre">
		<g:message code="entrada.nombre.label" default="Nombre" />
		
	</label>
	<g:textField name="nombre" value="${entradaInstance?.nombre}"/>
</div>

