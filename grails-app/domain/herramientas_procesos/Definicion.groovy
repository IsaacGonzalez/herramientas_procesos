package herramientas_procesos

class Definicion {

	static hasMany = [
						proveedores: 	Proveedor,
						usuarios:		Usuario,
						subprocesos: 	Subproceso,
						actividades: 	Actividad
					]

	static constraints = {
	}
}
