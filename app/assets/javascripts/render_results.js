construct_result = function(data)
{
	return "<div class='result'>"+data+"</div>";
}

render_results = function(data)
{
	var resultsSoFar = $("#results_area").html();
	$("#results_area").html(construct_result(data) + resultsSoFar);
	$(".result:first").effect("highlight", {}, 1000);
}
