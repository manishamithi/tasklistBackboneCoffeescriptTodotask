class Tasklist.Views.EntriesIndex extends Backbone.View

  template: JST['entries/index']


  events:
   'submit #new_entry': 'createEntry'
   #"click .destroy" : "delete"
    #'click  td :checkbox': 'clicked',
    #'click [type="checkbox"]': 'clicked'



  initialize: ->
    @collection.on('reset', @render, @)
    console.log(@collection)
    @collection.on('add', @appendNewEntry, this)
   # @collection.on('remove',@render,this)


  render: ->
    console.log("vhgvv")
    $(@el).html(@template())
    #$(@el).find('#new_entry').html(JST['entries/form']())
    @appendForm()
    @collection.each(@appendEntry)
    @  
 
  appendEntry: (entry) ->
    view = new Tasklist.Views.Entry(model: entry)
    $('#entries').append(view.render().el)

  appendForm: ->
    $(@el).find('#new_entry').html(JST['entries/form']())

  
  appendNewEntry: (entry) ->
    @appendForm()
    @appendEntry(entry)


  createEntry: (event) ->
    event.preventDefault()
    @collection.create (ename: $('#new_entry_name').val(), starttime: $('#new_entry_starttime').val(), endtime: $('#new_entry_endtime').val())
  
  

