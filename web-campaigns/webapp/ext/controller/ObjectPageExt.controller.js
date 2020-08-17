sap.ui.controller("com.sap.web-campaigns.ext.controller.ObjectPageExt", {

	onClickActionCampaignsHeader1: function (oEvent) {
		this.handleResponsivePopoverPress(oEvent);

	},
	onExit: function () {
		if (this._oPopover) {
			this._oPopover.destroy();
		}
	},

	handleResponsivePopoverPress: function (oEvent) {
		var oButton = oEvent.getSource();

		if (!this._oPopover) {
			sap.ui.core.Fragment.load({
				name: "com.sap.web-campaigns.ext.view.ResponsivePopover",
				controller: this
			}).then(function (oPopover) {
				this._oPopover = oPopover;
				this.getView().addDependent(this._oPopover);
				this._oPopover.openBy(oButton);
			}.bind(this));
		} else {
			this._oPopover.openBy(oButton);
		}
	},

	handleCloseButton: function (oEvent) {
		this._oPopover.close();
	},

	itemPress: function (oEvent) {
		var key = oEvent.getParameters().item.getKey();
		var LinkTextToShare = "";
		if (key === "wa") {
			LinkTextToShare = 'https://web.whatsapp.com/send?l=en&text=' + encodeURIComponent(window.location.href);
		} else if (key === "fb") {
			LinkTextToShare = 'https://www.facebook.com/sharer/sharer.php?u=' + encodeURIComponent(window.location.href);
		} else if (key === "tt") {
			LinkTextToShare = 'https://twitter.com/home?status=' + encodeURIComponent(window.location.href);
		} else if (key === "li") {
			LinkTextToShare = 'https://www.linkedin.com/shareArticle?mini=true&url=' + encodeURIComponent(window.location.href) +
				'&title=&summary=&source=';
		}
		window.open(LinkTextToShare, "_blank");

	},
	onClickActionCampaignsHeader2: function (oEvent) {
		$.get("/sms_api/", function(data, status){
		    sap.m.MessageToast.show("Message sent successfully");
		});
	}
});