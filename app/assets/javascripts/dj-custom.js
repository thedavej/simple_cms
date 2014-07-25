// Auto-closing dismissable alerts
$(document).ready (function(){
  		$(".alert-dismissable").fadeTo(4000, 500).slideUp(1000, function(){
    			$(".alert-dismissable").alert('close');
		})});

// Text auto-focus on login modals
$(document).ready (function(){
$('#loginModal').on('shown.bs.modal', function () {
	    $('#username').focus();
			})
$('#sectionLoginModal').on('shown.bs.modal', function () {
	    $('#s-username').focus();
			})
});



// Text aut3o-focus on new_modal
$(document).ready (function(){
$('#new').on('shown.bs.modal', function () {
	    $('#new_name').focus();
			})});

	// Display correct tab in edit modal
$(document).ready (function(){
$('#edit').on('shown.bs.modal', function () {
	   	if($('#radio-image').is(':checked')) { 
	   		$('#radio-image').tab('show'); }
	   	if($('#radio-specifications').is(':checked')) { 
	   		$('#radio-specifications').tab('show'); }
			})});




// Specifications Table Data Creation
function addField(tableid)
{
	var row = document.createElement("tr");
	var col1 = document.createElement("td");
 	var col2 = document.createElement("td");
	var inputa = document.createElement("input");
	var inputb = document.createElement("input");

	inputa.setAttribute("type","text");
	inputb.setAttribute("type","text");
	inputa.setAttribute("class","ilabel");
	inputb.setAttribute("class","icontent");


	col1.appendChild(inputa);
	col2.appendChild(inputb);


 row.appendChild(col1);
 row.appendChild(col2);


 var tbox = document.getElementById("section_content");

	var able = $(".ilabel").last().val();
	var baker = $(".icontent").last().val();
	tbox.value += "<tr><th>"+able+"</th><td>"+baker+"</td></tr>";	


 var table = document.getElementById(tableid);
 table.appendChild(row);
 
}
