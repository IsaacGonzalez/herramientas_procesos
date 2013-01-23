package herramientas_procesos

class Usuario extends Entidad{

	Salida		salidaRecibida
	String		rol

    static constraints = {
    	correo blank: false, email: true
    }
}
