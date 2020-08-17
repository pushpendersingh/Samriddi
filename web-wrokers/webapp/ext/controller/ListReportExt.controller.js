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
	}
});

