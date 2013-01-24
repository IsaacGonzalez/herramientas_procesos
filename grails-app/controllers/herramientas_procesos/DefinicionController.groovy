package herramientas_procesos

import org.springframework.dao.DataIntegrityViolationException

class DefinicionController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [definicionInstanceList: Definicion.list(params), definicionInstanceTotal: Definicion.count()]
    }

    def create() {
        [definicionInstance: new Definicion(params)]
    }

    def save() {
        def definicionInstance = new Definicion(params)
        if (!definicionInstance.save(flush: true)) {
            render(view: "create", model: [definicionInstance: definicionInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'definicion.label', default: 'Definicion'), definicionInstance.id])
        redirect(action: "show", id: definicionInstance.id)
    }

    def show(Long id) {
        def definicionInstance = Definicion.get(id)
        if (!definicionInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'definicion.label', default: 'Definicion'), id])
            redirect(action: "list")
            return
        }

        [definicionInstance: definicionInstance]
    }

    def edit(Long id) {
        def definicionInstance = Definicion.get(id)
        if (!definicionInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'definicion.label', default: 'Definicion'), id])
            redirect(action: "list")
            return
        }

        [definicionInstance: definicionInstance]
    }

    def update(Long id, Long version) {
        def definicionInstance = Definicion.get(id)
        if (!definicionInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'definicion.label', default: 'Definicion'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (definicionInstance.version > version) {
                definicionInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'definicion.label', default: 'Definicion')] as Object[],
                          "Another user has updated this Definicion while you were editing")
                render(view: "edit", model: [definicionInstance: definicionInstance])
                return
            }
        }

        definicionInstance.properties = params

        if (!definicionInstance.save(flush: true)) {
            render(view: "edit", model: [definicionInstance: definicionInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'definicion.label', default: 'Definicion'), definicionInstance.id])
        redirect(action: "show", id: definicionInstance.id)
    }

    def delete(Long id) {
        def definicionInstance = Definicion.get(id)
        if (!definicionInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'definicion.label', default: 'Definicion'), id])
            redirect(action: "list")
            return
        }

        try {
            definicionInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'definicion.label', default: 'Definicion'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'definicion.label', default: 'Definicion'), id])
            redirect(action: "show", id: id)
        }
    }
}
