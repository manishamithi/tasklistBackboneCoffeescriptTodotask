#console.log('this');

window.Tasklist =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  init: -> 
    new Tasklist.Routers.Entries()
    Backbone.history.start()

$(document).ready ->
  Tasklist.init()

