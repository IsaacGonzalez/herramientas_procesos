package herramientas_procesos

class Entidad {

	String nombre
	String apellido
	String telefono
	String correo

	/**
	No se especificaron constraints por que las clases
	que hereden a esta tienen que sobreescribir los propios
	*/
	static constraints = {
	}

	static mapping = {
		tablePerHierarchy false
	}
}
