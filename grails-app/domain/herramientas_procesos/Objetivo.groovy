package herramientas_procesos

class Objetivo {

	String descripcion
	Boolean seCumple

    static constraints = {
    	descripcion blank: false, minSize: 15
    }
}
