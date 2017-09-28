class Tasklist.Routers.Tasks extends Backbone.Router
  routes:
    '': 'index'

  index: ->
    @collection = new Tasklist.Collections.Tasks()
    @collection.fetch
      wait: true
      reset: true
    view = new Tasklist.Views.TasksIndex(collection: @collection)
    $('#container').html(view.el)

  
