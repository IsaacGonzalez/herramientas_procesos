package herramientas_procesos

import org.springframework.dao.DataIntegrityViolationException

class SalidaController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [salidaInstanceList: Salida.list(params), salidaInstanceTotal: Salida.count()]
    }

    def create() {
        [salidaInstance: new Salida(params)]
    }

    def save() {
        def salidaInstance = new Salida(params)
        if (!salidaInstance.save(flush: true)) {
            render(view: "create", model: [salidaInstance: salidaInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'salida.label', default: 'Salida'), salidaInstance.id])
        redirect(action: "show", id: salidaInstance.id)
    }

    def show(Long id) {
        def salidaInstance = Salida.get(id)
        if (!salidaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'salida.label', default: 'Salida'), id])
            redirect(action: "list")
            return
        }

        [salidaInstance: salidaInstance]
    }

    def edit(Long id) {
        def salidaInstance = Salida.get(id)
        if (!salidaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'salida.label', default: 'Salida'), id])
            redirect(action: "list")
            return
        }

        [salidaInstance: salidaInstance]
    }

    def update(Long id, Long version) {
        def salidaInstance = Salida.get(id)
        if (!salidaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'salida.label', default: 'Salida'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (salidaInstance.version > version) {
                salidaInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'salida.label', default: 'Salida')] as Object[],
                          "Another user has updated this Salida while you were editing")
                render(view: "edit", model: [salidaInstance: salidaInstance])
                return
            }
        }

        salidaInstance.properties = params

        if (!salidaInstance.save(flush: true)) {
            render(view: "edit", model: [salidaInstance: salidaInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'salida.label', default: 'Salida'), salidaInstance.id])
        redirect(action: "show", id: salidaInstance.id)
    }

    def delete(Long id) {
        def salidaInstance = Salida.get(id)
        if (!salidaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'salida.label', default: 'Salida'), id])
            redirect(action: "list")
            return
        }

        try {
            salidaInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'salida.label', default: 'Salida'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'salida.label', default: 'Salida'), id])
            redirect(action: "show", id: id)
        }
    }
}
