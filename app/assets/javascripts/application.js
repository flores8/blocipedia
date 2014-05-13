// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require bootstrap
//= require_tree .

var sendTrackableEvent = function(web_property_id, type, location){
	var _bm_event = {
	  web_property_id: web_property_id,
	  type: type,
	  location: location
	}

	var _bm_request = $.ajax({
	  url: "http://localhost:4000/events",
	  method: "post",
	  data: {event: _bm_event}
	})
}
$(document).ready(function(){
	sendTrackableEvent("22", "page view", window.location.origin)

	$("a.trackable").click(function(){
			alert( "test" );
			sendTrackableEvent("22", "click", $(this).data("track"));
		}
	)
})
