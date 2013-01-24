package herramientas_procesos

import org.springframework.dao.DataIntegrityViolationException

class EntidadController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [entidadInstanceList: Entidad.list(params), entidadInstanceTotal: Entidad.count()]
    }

    def create() {
        [entidadInstance: new Entidad(params)]
    }

    def save() {
        def entidadInstance = new Entidad(params)
        if (!entidadInstance.save(flush: true)) {
            render(view: "create", model: [entidadInstance: entidadInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'entidad.label', default: 'Entidad'), entidadInstance.id])
        redirect(action: "show", id: entidadInstance.id)
    }

    def show(Long id) {
        def entidadInstance = Entidad.get(id)
        if (!entidadInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'entidad.label', default: 'Entidad'), id])
            redirect(action: "list")
            return
        }

        [entidadInstance: entidadInstance]
    }

    def edit(Long id) {
        def entidadInstance = Entidad.get(id)
        if (!entidadInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'entidad.label', default: 'Entidad'), id])
            redirect(action: "list")
            return
        }

        [entidadInstance: entidadInstance]
    }

    def update(Long id, Long version) {
        def entidadInstance = Entidad.get(id)
        if (!entidadInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'entidad.label', default: 'Entidad'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (entidadInstance.version > version) {
                entidadInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'entidad.label', default: 'Entidad')] as Object[],
                          "Another user has updated this Entidad while you were editing")
                render(view: "edit", model: [entidadInstance: entidadInstance])
                return
            }
        }

        entidadInstance.properties = params

        if (!entidadInstance.save(flush: true)) {
            render(view: "edit", model: [entidadInstance: entidadInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'entidad.label', default: 'Entidad'), entidadInstance.id])
        redirect(action: "show", id: entidadInstance.id)
    }

    def delete(Long id) {
        def entidadInstance = Entidad.get(id)
        if (!entidadInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'entidad.label', default: 'Entidad'), id])
            redirect(action: "list")
            return
        }

        try {
            entidadInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'entidad.label', default: 'Entidad'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'entidad.label', default: 'Entidad'), id])
            redirect(action: "show", id: id)
        }
    }
}
