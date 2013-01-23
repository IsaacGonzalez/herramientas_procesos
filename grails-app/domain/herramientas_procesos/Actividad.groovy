package herramientas_procesos

class Actividad {

	String	nombre
	String	descripcion
	String	tipo
	Double	duracionMinutos
	Boolean	agregaValor
	Boolean	esNecesaria
	Salida	salidaGenerada


	static constraints = {
		nombre			
		descripcion			
		tipo			inList: [
									"Operacion",
									"Demora",
									"Traslado",
									"Verificacion",
									"Archivo",
									"Correccion"
								]	
		duracionMinutos	min: 0
		agregaValor
		esNecesaria
		salidaGenerada
	}
}
