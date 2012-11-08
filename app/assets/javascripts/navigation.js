function dropDown(dropDownLink, dropDownList) {
  dropDownLink.hover( function() {
	  dropDownList.slideDown();
  });
}

$(document).ready( function() {
  var $dropDownLink = $('#lnk_WebShare');
  var $dropDownList = $('#subnav_WebShare');
  $dropDownList.hide();
  // dropDown($dropDownLink, $dropDownList);
  
  var $dropDownLinks = $('#subnav_WebShare li');
});