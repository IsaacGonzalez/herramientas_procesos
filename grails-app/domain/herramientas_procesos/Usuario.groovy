package herramientas_procesos

class Usuario extends Entidad{

	Salida		salidaRecibida
	String		rol

	static constraints = {
		rol		blank: false
		correo	blank: false, email: true
	}
}
