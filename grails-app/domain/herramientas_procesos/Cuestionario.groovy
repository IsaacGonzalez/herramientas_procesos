package herramientas_procesos

class Cuestionario {

	String nombre
	static hasMany = [preguntas: Pregunta]

    static constraints = {
    	nombre	blank: false
    }
}
