package herramientas_procesos

class Pregunta {

	String interrogante
	String respuesta

    static constraints = {
    	interrogante	blank: false
    	respuesta		blank: false
    }
}
