package herramientas_procesos



import org.junit.*
import grails.test.mixin.*

@TestFor(DefinicionController)
@Mock(Definicion)
class DefinicionControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/definicion/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.definicionInstanceList.size() == 0
        assert model.definicionInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.definicionInstance != null
    }

    void testSave() {
        controller.save()

        assert model.definicionInstance != null
        assert view == '/definicion/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/definicion/show/1'
        assert controller.flash.message != null
        assert Definicion.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/definicion/list'

        populateValidParams(params)
        def definicion = new Definicion(params)

        assert definicion.save() != null

        params.id = definicion.id

        def model = controller.show()

        assert model.definicionInstance == definicion
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/definicion/list'

        populateValidParams(params)
        def definicion = new Definicion(params)

        assert definicion.save() != null

        params.id = definicion.id

        def model = controller.edit()

        assert model.definicionInstance == definicion
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/definicion/list'

        response.reset()

        populateValidParams(params)
        def definicion = new Definicion(params)

        assert definicion.save() != null

        // test invalid parameters in update
        params.id = definicion.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/definicion/edit"
        assert model.definicionInstance != null

        definicion.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/definicion/show/$definicion.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        definicion.clearErrors()

        populateValidParams(params)
        params.id = definicion.id
        params.version = -1
        controller.update()

        assert view == "/definicion/edit"
        assert model.definicionInstance != null
        assert model.definicionInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/definicion/list'

        response.reset()

        populateValidParams(params)
        def definicion = new Definicion(params)

        assert definicion.save() != null
        assert Definicion.count() == 1

        params.id = definicion.id

        controller.delete()

        assert Definicion.count() == 0
        assert Definicion.get(definicion.id) == null
        assert response.redirectedUrl == '/definicion/list'
    }
}
