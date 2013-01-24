package herramientas_procesos



import org.junit.*
import grails.test.mixin.*

@TestFor(ActividadController)
@Mock(Actividad)
class ActividadControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/actividad/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.actividadInstanceList.size() == 0
        assert model.actividadInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.actividadInstance != null
    }

    void testSave() {
        controller.save()

        assert model.actividadInstance != null
        assert view == '/actividad/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/actividad/show/1'
        assert controller.flash.message != null
        assert Actividad.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/actividad/list'

        populateValidParams(params)
        def actividad = new Actividad(params)

        assert actividad.save() != null

        params.id = actividad.id

        def model = controller.show()

        assert model.actividadInstance == actividad
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/actividad/list'

        populateValidParams(params)
        def actividad = new Actividad(params)

        assert actividad.save() != null

        params.id = actividad.id

        def model = controller.edit()

        assert model.actividadInstance == actividad
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/actividad/list'

        response.reset()

        populateValidParams(params)
        def actividad = new Actividad(params)

        assert actividad.save() != null

        // test invalid parameters in update
        params.id = actividad.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/actividad/edit"
        assert model.actividadInstance != null

        actividad.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/actividad/show/$actividad.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        actividad.clearErrors()

        populateValidParams(params)
        params.id = actividad.id
        params.version = -1
        controller.update()

        assert view == "/actividad/edit"
        assert model.actividadInstance != null
        assert model.actividadInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/actividad/list'

        response.reset()

        populateValidParams(params)
        def actividad = new Actividad(params)

        assert actividad.save() != null
        assert Actividad.count() == 1

        params.id = actividad.id

        controller.delete()

        assert Actividad.count() == 0
        assert Actividad.get(actividad.id) == null
        assert response.redirectedUrl == '/actividad/list'
    }
}
