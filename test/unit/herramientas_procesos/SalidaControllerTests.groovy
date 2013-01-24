package herramientas_procesos



import org.junit.*
import grails.test.mixin.*

@TestFor(SalidaController)
@Mock(Salida)
class SalidaControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/salida/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.salidaInstanceList.size() == 0
        assert model.salidaInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.salidaInstance != null
    }

    void testSave() {
        controller.save()

        assert model.salidaInstance != null
        assert view == '/salida/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/salida/show/1'
        assert controller.flash.message != null
        assert Salida.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/salida/list'

        populateValidParams(params)
        def salida = new Salida(params)

        assert salida.save() != null

        params.id = salida.id

        def model = controller.show()

        assert model.salidaInstance == salida
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/salida/list'

        populateValidParams(params)
        def salida = new Salida(params)

        assert salida.save() != null

        params.id = salida.id

        def model = controller.edit()

        assert model.salidaInstance == salida
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/salida/list'

        response.reset()

        populateValidParams(params)
        def salida = new Salida(params)

        assert salida.save() != null

        // test invalid parameters in update
        params.id = salida.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/salida/edit"
        assert model.salidaInstance != null

        salida.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/salida/show/$salida.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        salida.clearErrors()

        populateValidParams(params)
        params.id = salida.id
        params.version = -1
        controller.update()

        assert view == "/salida/edit"
        assert model.salidaInstance != null
        assert model.salidaInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/salida/list'

        response.reset()

        populateValidParams(params)
        def salida = new Salida(params)

        assert salida.save() != null
        assert Salida.count() == 1

        params.id = salida.id

        controller.delete()

        assert Salida.count() == 0
        assert Salida.get(salida.id) == null
        assert response.redirectedUrl == '/salida/list'
    }
}
