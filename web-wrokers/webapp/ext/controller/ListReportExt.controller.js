sap.ui.controller("com.sap.web-wrokers.ext.controller.ListReportExt", {

	onClickActionWorkers1: function (oEvent) {
		var oView = this.getView();
		// create dialog lazily
		if (!this.oDialog) {
			// create dialog via fragment factory
			this.oDialog = sap.ui.xmlfragment("com.sap.web-wrokers.ext.fragment.dialog",this);
			// connect dialog to view (models, lifecycle)
			oView.addDependent(this.oDialog);
		}
		this.oDialog.open();
		this.openMap();
	},
	handleCancelPress: function(oEvent){
		this.oDialog.close();
	},
	openMap: function(){
		// Create the script tag, set the appropriate attributes
		var script = document.createElement('script');
		script.src = 'https://maps.googleapis.com/maps/api/js?key=AIzaSyCoYcmjRdkBuc-hjvGQovxhN_PyRf1IiJg&callback=initMap';
		script.defer = true;
		script.async = true;
		
		// Attach your callback function to the `window` object
		window.initMap = function(){
			// The location of Uluru
			  var whitefield = {lat: 12.9645669, lng: 77.7190231};
			  // The map, centered at Uluru
			  var arr=[[12.972303,77.7212443],[12.9545669,77.7390231] ,[12.984567,77.7490235],[12.954567,77.7090235],[12.944567,77.6990235],[12.924567,77.6890235],[12.934567,77.7190235],[12.964567,77.7590235]];
			  var map = new google.maps.Map(
			      document.getElementById('map'), {zoom: 14, center: whitefield});
			  // The marker, positioned at Uluru
			  var marker = new google.maps.Marker({position: whitefield, map: map});	
			  	
	        for (var i = 0; i < arr.length; i++) {
	          var latLng = new google.maps.LatLng(arr[i][0],arr[i][1]);
	          var marker = new google.maps.Marker({
	            position: latLng,
	            map: map
	          });
	        }
			  
		};
		
		// Append the 'script' element to 'head'
		document.head.appendChild(script);
	}
});

