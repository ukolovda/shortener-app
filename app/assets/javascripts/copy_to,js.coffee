$(document).on 'click', '.copy_value_link', (event)->
  event.preventDefault()
  data = $(this).closest('td').find('.data_for_copy')
  console.log data
  data.CopyToClipboard()