package herramientas_procesos



import org.junit.*
import grails.test.mixin.*

@TestFor(EntidadController)
@Mock(Entidad)
class EntidadControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/entidad/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.entidadInstanceList.size() == 0
        assert model.entidadInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.entidadInstance != null
    }

    void testSave() {
        controller.save()

        assert model.entidadInstance != null
        assert view == '/entidad/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/entidad/show/1'
        assert controller.flash.message != null
        assert Entidad.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/entidad/list'

        populateValidParams(params)
        def entidad = new Entidad(params)

        assert entidad.save() != null

        params.id = entidad.id

        def model = controller.show()

        assert model.entidadInstance == entidad
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/entidad/list'

        populateValidParams(params)
        def entidad = new Entidad(params)

        assert entidad.save() != null

        params.id = entidad.id

        def model = controller.edit()

        assert model.entidadInstance == entidad
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/entidad/list'

        response.reset()

        populateValidParams(params)
        def entidad = new Entidad(params)

        assert entidad.save() != null

        // test invalid parameters in update
        params.id = entidad.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/entidad/edit"
        assert model.entidadInstance != null

        entidad.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/entidad/show/$entidad.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        entidad.clearErrors()

        populateValidParams(params)
        params.id = entidad.id
        params.version = -1
        controller.update()

        assert view == "/entidad/edit"
        assert model.entidadInstance != null
        assert model.entidadInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/entidad/list'

        response.reset()

        populateValidParams(params)
        def entidad = new Entidad(params)

        assert entidad.save() != null
        assert Entidad.count() == 1

        params.id = entidad.id

        controller.delete()

        assert Entidad.count() == 0
        assert Entidad.get(entidad.id) == null
        assert response.redirectedUrl == '/entidad/list'
    }
}
