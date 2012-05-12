# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/


@initialized = false
@select_data = null

$(document).ready ->
	if $(".chzn-select").length > 0 && !@initialized
		@initialized = true
		$("#sports-category-select").chosen() 
		$("#sports-category-select").chosen({allow_single_deselect:true})
		$("#sports-select").chosen() 
		$("#sports-select").chosen({allow_single_deselect:true})
		$("#team-select").chosen() 
		$("#team-select").chosen({allow_single_deselect:true})
		get_select_data()
		setup_sports()

get_select_data = ->
	$.ajax
		url : "selects"
		success : (data) =>
			@select_data = data
			window.test = data
			setup_selects()

setup_selects = ->
	sc_select = ''
	for sc in @select_data
		sc_select += '<option value="' + sc.id + '">' + sc.name + '</option>'
	console.log(sc_select)
	$("#sports-category-select").html(sc_select).trigger("liszt:updated")

setup_sports = ->
	$(".chzn-select").on "change", (evt)->
		update_events()

status = ->
	category = $("#sports-category-select").val()
	sports = $("#sports-select").val()
	teams = $("#team-select").val()
	{category : category, sports : sports, teams : teams}

build_url = (obj) ->
	url = ""
	if obj.category?.length > 0
		url += "&category=" + obj.category.reduce (x, y) -> x + "," + y 
	if obj.sports?.length > 0
		url += "&sport=" + obj.sports.reduce (x, y) -> x + "," + y 
	if obj.teams?.length > 0
		url += "&team=" + obj.teams.reduce (x, y) -> x + "," + y 
	if url[0] == "&"
		url = url.substr(1,url.length)
	url

update_events = ->
	params = build_url status()
	$.ajax
		url : 'results?' + params
		dataType : 'HTML'
		success : (data) ->
			$("#results").html data
