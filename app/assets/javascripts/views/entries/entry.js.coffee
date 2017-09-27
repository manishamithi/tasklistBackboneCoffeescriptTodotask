class Tasklist.Views.Entry extends Backbone.View
  template: JST['entries/entry']
  tagName: 'tr'

  #events:
   # 'click [type="checkbox"]': 'clicked'

  events:
    #"click .toggle"   : "toggleDone",
    #"dblclick .view"  : "edit",
   # "click .destroy" : "clear",
    #"keypress .edit"  : "updateOnEnter",
    #"blur .edit"      : "close"
    'click [type="checkbox"]': 'clicked'
    "click .destroy" : "delete"
    'click .edit' : 'edittodo'
    
  initialize: ->
    this.model.on('remove',@renderremove, this);
    this.model.on('change', this.render, this);
  
  clear: ->
    this.model.destroy();
    

  render: ->
    $(@el).html(@template(entry: @model))
    this

  renderremove: ->
    $(@el).remove()
 # clicked: (e)=>
    #e.stopPropagation();
   # console.log("events handler for " + this.el.outerHTML);
  ## element = $(e.currentTarget)
   # selected = $target .is(':checked');
    #console.log('value: ', element.val());
  delete: ->
    @model.destroy(
      wait: true
    ) if confirm "Are you sure?"
    this
   

  close: ->
    console.log("ghvhvhvhvhvb")
    #console.log($(@el).find(@model.id).is("checked"))
    console.log($('.add').prop('checked'));
    #console.log(@model.get('complete'))
    #console.log(@model.id)
    #console.log(@model.get('ename'))
    #if $('.add').prop('checked')
    if  this.model.get('complete')== true
      this.model.save complete: false
    else
      this.model.save complete: true
  clicked: (e)->
    console.log("hgyyvyvyvy")
    #if e.which == ENTER_KEY
    this.close() 
  edittodo: ->
    newName = prompt("Please enter the new name", this.model.get('ename'));
    this.model.set('ename', newName);
    @model.save(ename: newName)

  renderedit: ->
    $(@el).set()
    @
  

