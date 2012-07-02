construct_result = function(data)
{
	return "<div>"+data+"</div>";
}

render_results = function(data)
{
	var resultsSoFar = $("#results_area").html();
	$("#results_area").html(resultsSoFar + construct_result(data));
}