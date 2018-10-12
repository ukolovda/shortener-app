$(document).on 'click', '[data-form-prepend]', (event) ->
  obj = $($(this).attr('data-form-prepend'))
  id = (new Date).getTime()
  obj.find('input, select, textarea').each ->
    $(this).attr 'name', ->
      $(this).attr('name').replace 'new_record', id
  $place = $(this).closest('table').find('tbody')
  $place.append(obj)
#  obj.insertBefore this
  event.preventDefault()

$(document).on 'click', '.delete_keywork_link', (event)->
  $tr = $(this).closest('tr')
  $input = $tr.find('input[type=hidden]')
  $input.val('1')
  $tr.hide()
  event.preventDefault()
