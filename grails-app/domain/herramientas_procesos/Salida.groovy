package herramientas_procesos

class Salida {

	String nombre
	String descripcion

	static constraints = {
		nombre 		blank: false
		descripcion	blank: false
	}
}
