# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
  $('.select2').each (i, e) =>
    select = $(e)
    options =
      placeholder: 'Select a School'

    if select.hasClass('ajax') # only add ajax functionality if this class is present
      options.ajax =
        url: '/schools/search.json'
        dataType: 'json'
        data: (term, page) ->
          q: term
          page: page
          per: 25
        results: (data, page) ->
          results: data.resources
          more: data.total > (page * 25) # adding the more: option enables infinite scrolling (select2 will load more content if available)

      options.dropdownCssClass = "bigdrop"

    select.select2(options)