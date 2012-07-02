search = function()
{
  var text=$("#query_field").val();
 

    setInterval(function(){render_results(text)},3000);
  
  
}
