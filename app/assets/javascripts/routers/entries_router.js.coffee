class Tasklist.Routers.Entries extends Backbone.Router
  routes:
    '': 'index'
    'entries/:id': 'show'  

  initialize: ->

  index: ->
    @collection = new Tasklist.Collections.Entries()
    @collection.fetch
      wait: true
      reset: true
    view = new Tasklist.Views.EntriesIndex(collection: @collection)
    $('#container').html(view.el)

  show: (id) ->
    alert "Entry #{id}"
