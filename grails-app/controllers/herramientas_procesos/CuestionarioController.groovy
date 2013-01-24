package herramientas_procesos

import org.springframework.dao.DataIntegrityViolationException

class CuestionarioController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [cuestionarioInstanceList: Cuestionario.list(params), cuestionarioInstanceTotal: Cuestionario.count()]
    }

    def create() {
        [cuestionarioInstance: new Cuestionario(params)]
    }

    def save() {
        def cuestionarioInstance = new Cuestionario(params)
        if (!cuestionarioInstance.save(flush: true)) {
            render(view: "create", model: [cuestionarioInstance: cuestionarioInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'cuestionario.label', default: 'Cuestionario'), cuestionarioInstance.id])
        redirect(action: "show", id: cuestionarioInstance.id)
    }

    def show(Long id) {
        def cuestionarioInstance = Cuestionario.get(id)
        if (!cuestionarioInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'cuestionario.label', default: 'Cuestionario'), id])
            redirect(action: "list")
            return
        }

        [cuestionarioInstance: cuestionarioInstance]
    }

    def edit(Long id) {
        def cuestionarioInstance = Cuestionario.get(id)
        if (!cuestionarioInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'cuestionario.label', default: 'Cuestionario'), id])
            redirect(action: "list")
            return
        }

        [cuestionarioInstance: cuestionarioInstance]
    }

    def update(Long id, Long version) {
        def cuestionarioInstance = Cuestionario.get(id)
        if (!cuestionarioInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'cuestionario.label', default: 'Cuestionario'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (cuestionarioInstance.version > version) {
                cuestionarioInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'cuestionario.label', default: 'Cuestionario')] as Object[],
                          "Another user has updated this Cuestionario while you were editing")
                render(view: "edit", model: [cuestionarioInstance: cuestionarioInstance])
                return
            }
        }

        cuestionarioInstance.properties = params

        if (!cuestionarioInstance.save(flush: true)) {
            render(view: "edit", model: [cuestionarioInstance: cuestionarioInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'cuestionario.label', default: 'Cuestionario'), cuestionarioInstance.id])
        redirect(action: "show", id: cuestionarioInstance.id)
    }

    def delete(Long id) {
        def cuestionarioInstance = Cuestionario.get(id)
        if (!cuestionarioInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'cuestionario.label', default: 'Cuestionario'), id])
            redirect(action: "list")
            return
        }

        try {
            cuestionarioInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'cuestionario.label', default: 'Cuestionario'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'cuestionario.label', default: 'Cuestionario'), id])
            redirect(action: "show", id: id)
        }
    }
}
