$ ->
  $("#category_ctype").change ->
    value = $(this).val()
    if value == 'page'
      $("#category_page_content").show()
    else
      $("#category_page_content").hide()