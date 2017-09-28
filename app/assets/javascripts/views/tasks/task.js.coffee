class Tasklist.Views.Task extends Backbone.View
  template: JST['tasks/task']
  tagName: 'tr'

  events:
    'click [type="checkbox"]': 'clicked'
    "click .destroy" : "delete"
    'click .edit' : 'edittask'
    
  initialize: ->
    @model.on('remove',@renderremove, @)
    @model.on('change', @render, @)
  
  clear: ->
    @model.destroy();
    

  render: ->
    $(@el).html(@template(task: @model))
    @

  renderremove: ->
    $(@el).remove()

  delete: ->
    @model.destroy(
      wait: true
    ) if confirm "Are you sure?"
    @  

  close: ->
    if  @model.get('complete')== true
      @model.save complete: false
    else
      @model.save complete: true

  clicked: (e)->
    @close() 

  edittask: ->
    newName = prompt("Please enter the new name", @model.get('listname'))
    if (!newName)
      return;
    else  
      @model.save(listname: newName)



