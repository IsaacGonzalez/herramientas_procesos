package herramientas_procesos

class Subproceso {

	String nombre
	String descripcion
	Salida salidaGenerada
	static hasMany = [
						entradas	: Entrada,
						actividades	: Actividad
					]

	static constraints = {
		nombre		blank: false
		descripcion	blank: false
	}
}
