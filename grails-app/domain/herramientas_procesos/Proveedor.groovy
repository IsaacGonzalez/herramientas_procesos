package herramientas_procesos

class Proveedor extends Entidad{

	String	estado
	String	municipio
	String	colonia
	String	calleYNumero	
	Boolean	interno

	static constraints = {
		estado			blank: false
		municipio		blank: false
		colonia			blank: false
		calleYNumero	blank: false
		correo			blank: false, email: true
		interno
	}

	static mapping = {
		tablePerHierarchy false
	}
}
