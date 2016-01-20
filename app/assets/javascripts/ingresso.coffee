# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
print_ingresso = () ->
  quantidade = $("#quantidade").val()
  tipo_id = $("#tipo_id").val()
  window.open('/print/'+tipo_id+"/"+quantidade,'_blank')
  window.open('/ingresso/new','_self')
window.print_ingresso = print_ingresso
