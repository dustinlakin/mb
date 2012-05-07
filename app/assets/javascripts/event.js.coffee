# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/


@initialized = false
$(document).ready ->
	if $(".chzn-select").length > 0 && !@initialized
		@initialized = true
		$(".chzn-select").chosen() 
		$(".chzn-select-deselect").chosen({allow_single_deselect:true})
		setup_sports()

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
