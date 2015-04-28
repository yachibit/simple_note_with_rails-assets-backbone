s = @SimpleNote
s.Views.Note ?= {}

s.Views.Notes.IndexView = Backbone.View.extend
  template: JST['notes/index']

  events:
    'click a.new-note-btn' : 'navigateToNewNote'

  initialize: ->
    @listenTo @collection, 'reset', =>
      @render()

  render: ->
    @$el.html @template()
    @collection.each (note) =>
      view = new s.View.Models.IndexItemView(model: note)
      @$('.notes').append(view.render().el)
    @$('#note-manu')
    this

  navigateToNewNote: ->
    Backbone.history.navigate('notes/new', true)
