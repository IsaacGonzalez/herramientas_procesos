package herramientas_procesos



import org.junit.*
import grails.test.mixin.*

@TestFor(CuestionarioController)
@Mock(Cuestionario)
class CuestionarioControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/cuestionario/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.cuestionarioInstanceList.size() == 0
        assert model.cuestionarioInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.cuestionarioInstance != null
    }

    void testSave() {
        controller.save()

        assert model.cuestionarioInstance != null
        assert view == '/cuestionario/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/cuestionario/show/1'
        assert controller.flash.message != null
        assert Cuestionario.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/cuestionario/list'

        populateValidParams(params)
        def cuestionario = new Cuestionario(params)

        assert cuestionario.save() != null

        params.id = cuestionario.id

        def model = controller.show()

        assert model.cuestionarioInstance == cuestionario
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/cuestionario/list'

        populateValidParams(params)
        def cuestionario = new Cuestionario(params)

        assert cuestionario.save() != null

        params.id = cuestionario.id

        def model = controller.edit()

        assert model.cuestionarioInstance == cuestionario
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/cuestionario/list'

        response.reset()

        populateValidParams(params)
        def cuestionario = new Cuestionario(params)

        assert cuestionario.save() != null

        // test invalid parameters in update
        params.id = cuestionario.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/cuestionario/edit"
        assert model.cuestionarioInstance != null

        cuestionario.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/cuestionario/show/$cuestionario.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        cuestionario.clearErrors()

        populateValidParams(params)
        params.id = cuestionario.id
        params.version = -1
        controller.update()

        assert view == "/cuestionario/edit"
        assert model.cuestionarioInstance != null
        assert model.cuestionarioInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/cuestionario/list'

        response.reset()

        populateValidParams(params)
        def cuestionario = new Cuestionario(params)

        assert cuestionario.save() != null
        assert Cuestionario.count() == 1

        params.id = cuestionario.id

        controller.delete()

        assert Cuestionario.count() == 0
        assert Cuestionario.get(cuestionario.id) == null
        assert response.redirectedUrl == '/cuestionario/list'
    }
}
