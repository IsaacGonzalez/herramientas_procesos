package herramientas_procesos



import org.junit.*
import grails.test.mixin.*

@TestFor(SubprocesoController)
@Mock(Subproceso)
class SubprocesoControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/subproceso/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.subprocesoInstanceList.size() == 0
        assert model.subprocesoInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.subprocesoInstance != null
    }

    void testSave() {
        controller.save()

        assert model.subprocesoInstance != null
        assert view == '/subproceso/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/subproceso/show/1'
        assert controller.flash.message != null
        assert Subproceso.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/subproceso/list'

        populateValidParams(params)
        def subproceso = new Subproceso(params)

        assert subproceso.save() != null

        params.id = subproceso.id

        def model = controller.show()

        assert model.subprocesoInstance == subproceso
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/subproceso/list'

        populateValidParams(params)
        def subproceso = new Subproceso(params)

        assert subproceso.save() != null

        params.id = subproceso.id

        def model = controller.edit()

        assert model.subprocesoInstance == subproceso
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/subproceso/list'

        response.reset()

        populateValidParams(params)
        def subproceso = new Subproceso(params)

        assert subproceso.save() != null

        // test invalid parameters in update
        params.id = subproceso.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/subproceso/edit"
        assert model.subprocesoInstance != null

        subproceso.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/subproceso/show/$subproceso.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        subproceso.clearErrors()

        populateValidParams(params)
        params.id = subproceso.id
        params.version = -1
        controller.update()

        assert view == "/subproceso/edit"
        assert model.subprocesoInstance != null
        assert model.subprocesoInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/subproceso/list'

        response.reset()

        populateValidParams(params)
        def subproceso = new Subproceso(params)

        assert subproceso.save() != null
        assert Subproceso.count() == 1

        params.id = subproceso.id

        controller.delete()

        assert Subproceso.count() == 0
        assert Subproceso.get(subproceso.id) == null
        assert response.redirectedUrl == '/subproceso/list'
    }
}
