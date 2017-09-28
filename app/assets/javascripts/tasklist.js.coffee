#console.log('this');

window.Tasklist =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  init: -> 
    new Tasklist.Routers.Tasks()
    Backbone.history.start()

$(document).ready ->
  Tasklist.init()

