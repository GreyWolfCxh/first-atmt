$(function(){
	$.ajaxSetup({
		cache:false
	});
});

window.onresize=function(){ 
	$.parser.parse();
} 

function closeLoading()
{
	window.parent.document.getElementById('loading').style.visibility='hidden';
}
function openLoading()
{
	window.parent.document.getElementById('loading').style.visibility='visible';	
}