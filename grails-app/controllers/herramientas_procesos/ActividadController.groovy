package herramientas_procesos

import org.springframework.dao.DataIntegrityViolationException

class ActividadController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [actividadInstanceList: Actividad.list(params), actividadInstanceTotal: Actividad.count()]
    }

    def create() {
        [actividadInstance: new Actividad(params)]
    }

    def save() {
        def actividadInstance = new Actividad(params)
        if (!actividadInstance.save(flush: true)) {
            render(view: "create", model: [actividadInstance: actividadInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'actividad.label', default: 'Actividad'), actividadInstance.id])
        redirect(action: "show", id: actividadInstance.id)
    }

    def show(Long id) {
        def actividadInstance = Actividad.get(id)
        if (!actividadInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'actividad.label', default: 'Actividad'), id])
            redirect(action: "list")
            return
        }

        [actividadInstance: actividadInstance]
    }

    def edit(Long id) {
        def actividadInstance = Actividad.get(id)
        if (!actividadInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'actividad.label', default: 'Actividad'), id])
            redirect(action: "list")
            return
        }

        [actividadInstance: actividadInstance]
    }

    def update(Long id, Long version) {
        def actividadInstance = Actividad.get(id)
        if (!actividadInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'actividad.label', default: 'Actividad'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (actividadInstance.version > version) {
                actividadInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'actividad.label', default: 'Actividad')] as Object[],
                          "Another user has updated this Actividad while you were editing")
                render(view: "edit", model: [actividadInstance: actividadInstance])
                return
            }
        }

        actividadInstance.properties = params

        if (!actividadInstance.save(flush: true)) {
            render(view: "edit", model: [actividadInstance: actividadInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'actividad.label', default: 'Actividad'), actividadInstance.id])
        redirect(action: "show", id: actividadInstance.id)
    }

    def delete(Long id) {
        def actividadInstance = Actividad.get(id)
        if (!actividadInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'actividad.label', default: 'Actividad'), id])
            redirect(action: "list")
            return
        }

        try {
            actividadInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'actividad.label', default: 'Actividad'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'actividad.label', default: 'Actividad'), id])
            redirect(action: "show", id: id)
        }
    }
}
