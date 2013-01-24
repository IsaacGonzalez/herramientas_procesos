package herramientas_procesos

import org.springframework.dao.DataIntegrityViolationException

class SubprocesoController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [subprocesoInstanceList: Subproceso.list(params), subprocesoInstanceTotal: Subproceso.count()]
    }

    def create() {
        [subprocesoInstance: new Subproceso(params)]
    }

    def save() {
        def subprocesoInstance = new Subproceso(params)
        if (!subprocesoInstance.save(flush: true)) {
            render(view: "create", model: [subprocesoInstance: subprocesoInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'subproceso.label', default: 'Subproceso'), subprocesoInstance.id])
        redirect(action: "show", id: subprocesoInstance.id)
    }

    def show(Long id) {
        def subprocesoInstance = Subproceso.get(id)
        if (!subprocesoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'subproceso.label', default: 'Subproceso'), id])
            redirect(action: "list")
            return
        }

        [subprocesoInstance: subprocesoInstance]
    }

    def edit(Long id) {
        def subprocesoInstance = Subproceso.get(id)
        if (!subprocesoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'subproceso.label', default: 'Subproceso'), id])
            redirect(action: "list")
            return
        }

        [subprocesoInstance: subprocesoInstance]
    }

    def update(Long id, Long version) {
        def subprocesoInstance = Subproceso.get(id)
        if (!subprocesoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'subproceso.label', default: 'Subproceso'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (subprocesoInstance.version > version) {
                subprocesoInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'subproceso.label', default: 'Subproceso')] as Object[],
                          "Another user has updated this Subproceso while you were editing")
                render(view: "edit", model: [subprocesoInstance: subprocesoInstance])
                return
            }
        }

        subprocesoInstance.properties = params

        if (!subprocesoInstance.save(flush: true)) {
            render(view: "edit", model: [subprocesoInstance: subprocesoInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'subproceso.label', default: 'Subproceso'), subprocesoInstance.id])
        redirect(action: "show", id: subprocesoInstance.id)
    }

    def delete(Long id) {
        def subprocesoInstance = Subproceso.get(id)
        if (!subprocesoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'subproceso.label', default: 'Subproceso'), id])
            redirect(action: "list")
            return
        }

        try {
            subprocesoInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'subproceso.label', default: 'Subproceso'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'subproceso.label', default: 'Subproceso'), id])
            redirect(action: "show", id: id)
        }
    }
}
