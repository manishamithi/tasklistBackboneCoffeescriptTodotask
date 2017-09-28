class Tasklist.Views.TasksIndex extends Backbone.View

  template: JST['tasks/index']


  events:
   'submit #new_task': 'createTask'
   

  initialize: ->
    @collection.on('reset', @render, @)
    @collection.on('add', @appendNewTask, @)
   

  render: ->
    $(@el).html(@template())
    @appendForm()
    @collection.each(@appendTask)
    @  
 
  appendTask: (task) ->
    view = new Tasklist.Views.Task(model: task)
    $('#tasks').append(view.render().el)

  appendForm: ->
    $(@el).find('#new_task').html(JST['tasks/form']())

  
  appendNewTask: (task) ->
    @appendForm()
    @appendTask(task)


  createTask: (event) ->
    event.preventDefault()
    if $('#new_entry_name').val()
      @collection.create (listname: $('#new_entry_name').val(), startdate: $('#new_entry_startdate').val(), enddate: $('#new_entry_enddate').val())
    else
      alert "please enter task...!"
  

