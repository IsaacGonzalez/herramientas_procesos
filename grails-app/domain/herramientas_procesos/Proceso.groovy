package herramientas_procesos

class Proceso {

	String			nombre
	Date			fechaInicio
	Date			fechaTerminacion
	Definicion		definicion
	static			hasMany = [objetivos: Objetivo]
	Cuestionario	diagnostico
	Cuestionario	cincoW

	static constraints = {
		nombre		blank: false		
	}
}
