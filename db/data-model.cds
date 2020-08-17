namespace my.migrants;
using {Country, managed } from '@sap/cds/common';

entity Workers : managed {
	key ID : UUID;
	name : String;
	phone : String;
	@"sap:value-list": 'fixed-values'
	gender : String(50) @(
      Common: {
      ValueList: {$Type: 'Common.ValueListType', CollectionPath:'Genders', SearchSupported:true,Parameters:[{$Type: 'Common.ValueListParameterInOut', LocalDataProperty:'gender', ValueListProperty: 'gender'}]}
      });
	locality : String;
	city : String;
	state : String;
	country : Country;
	lat: Double;
	long: Double;
	@"sap:value-list": 'fixed-values'
	radius: String(200) @(
      Common: {
      ValueList: {$Type: 'Common.ValueListType', CollectionPath:'Radius', SearchSupported:true,Parameters:[{$Type: 'Common.ValueListParameterInOut', LocalDataProperty:'radius', ValueListProperty: 'radius'}]}
      });
	pin_code : String;
	aadhar : String;
	@"sap:display-format": 'Date'
	birth_date : Date;
	
	@"sap:value-list": 'fixed-values'
	status : String(50) @(
      Common: {
      ValueList: {$Type: 'Common.ValueListType', CollectionPath:'Status', SearchSupported:true,Parameters:[{$Type: 'Common.ValueListParameterInOut', LocalDataProperty:'status', ValueListProperty: 'status'}]}
      });
	@"sap:value-list": 'fixed-values'
	skill : String(200) @(
      Common: {
      ValueList: {$Type: 'Common.ValueListType', CollectionPath:'Skill_types', SearchSupported:true,Parameters:[{$Type: 'Common.ValueListParameterInOut', LocalDataProperty:'skill', ValueListProperty: 'skill'}]}
      });
    imageUrl  : String;
	imageType : String @Core.IsMediaType;
    Skill_details : Association to many Skill_details on Skill_details.worker = $self;
};

@Aggregation.ApplySupported.PropertyRestrictions: true
entity WorkersALP  {
	key ID : Integer;
	@Analytics.Measure: true
    @Aggregation.default: #COUNT 
	count: Integer default 1;
    @Analytics.Dimension: true  
	locality : String;
	@Analytics.Dimension: true
	city : String;
	@Analytics.Dimension: true
	state : String;
	@Analytics.Dimension: true
	skill : String;
};

@Aggregation.ApplySupported.PropertyRestrictions: true
entity NGOsALP  {
	key ID : Integer;
	@Analytics.Measure: true
    @Aggregation.default: #COUNT 
	count: Integer default 1;
	name:String;
    @Analytics.Dimension: true  
	locality : String;
	@Analytics.Dimension: true
	city : String;
	@Analytics.Dimension: true
	state : String;
	@Analytics.Dimension: true
	category : String;
};

@Aggregation.ApplySupported.PropertyRestrictions: true
entity CampaignsALP  {
	key ID : Integer;
	@Analytics.Measure: true
    @Aggregation.default: #COUNT 
	count: Integer default 1;
	name:String;
    @Analytics.Dimension: true  
	locality : String;
	@Analytics.Dimension: true
	city : String;
	@Analytics.Dimension: true
	state : String;
	@Analytics.Dimension: true
	category : String;
};

@Aggregation.ApplySupported.PropertyRestrictions: true
entity JobsALP  {
	key ID : Integer;
	@Analytics.Measure: true
    @Aggregation.default: #COUNT 
	count: Integer default 1;
	name:String;
    @Analytics.Dimension: true  
	locality : String;
	@Analytics.Dimension: true
	city : String;
	@Analytics.Dimension: true
	state : String;
	@Analytics.Dimension: true
	skill : String;
};

entity Skill_details : managed {
	key ID : UUID;
	@"sap:value-list": 'fixed-values'
	skill: String(200) @(
      Common: {
      ValueList: {$Type: 'Common.ValueListType', CollectionPath:'Skill_types', SearchSupported:true,Parameters:[{$Type: 'Common.ValueListParameterInOut', LocalDataProperty:'skill', ValueListProperty: 'skill'}]}
      });
	worker : Association to Workers;
	job: Association to Jobs;
	experience: String;
};

@cds.odata.valuelist
entity Skill_types {
	key skill: String;
};

@cds.odata.valuelist
entity Radius {
	key radius: String;
};

@cds.odata.valuelist
entity Genders {
	key gender : String;
};

@cds.odata.valuelist
entity Status {
	key status : String;
};

entity NGO : managed {
	key ID: UUID;
	ngo_registration_number : String;
	name : String;
	phone : String;
	category: String;
    locality : String;
	city : String;
	state : String;
	country : Country;
	pin_code : String;
    web_id: String;
    Campaigns : Association to many Campaigns on Campaigns.ngo = $self;
    @"sap:value-list": 'fixed-values'
	radius: String(200) @(
      Common: {
      ValueList: {$Type: 'Common.ValueListType', CollectionPath:'Radius', SearchSupported:true,Parameters:[{$Type: 'Common.ValueListParameterInOut', LocalDataProperty:'radius', ValueListProperty: 'radius'}]}
      });
    imageUrl  : String;
	imageType : String @Core.IsMediaType;  
};

entity Campaigns : managed{
	key ID: UUID;
	title : String;
	description: String;
	fb_link: String;
	ngo: Association to NGO;
	category: String;
	start_date: Date;
	end_date: Date;
	location: String;
	person_name: String;
	number: String;
	mail_id: String;
	campaign_image_url: String;
	@"sap:value-list": 'fixed-values'
	radius: String(200) @(
      Common: {
      ValueList: {$Type: 'Common.ValueListType', CollectionPath:'Radius', SearchSupported:true,Parameters:[{$Type: 'Common.ValueListParameterInOut', LocalDataProperty:'radius', ValueListProperty: 'radius'}]}
      });
	
	@"sap:value-list": 'fixed-values'
	status : String(50) @(
      Common: {
      ValueList: {$Type: 'Common.ValueListType', CollectionPath:'Status', SearchSupported:true,Parameters:[{$Type: 'Common.ValueListParameterInOut', LocalDataProperty:'status', ValueListProperty: 'status'}]}
      });
    imageUrl  : String;
	imageType : String @Core.IsMediaType; 
};
entity Jobs : managed {
	key ID:UUID;
	title: String;
	description: String;
	@"sap:value-list": 'fixed-values'
	skill : String(200) @(
      Common: {
      ValueList: {$Type: 'Common.ValueListType', CollectionPath:'Skill_types', SearchSupported:true,Parameters:[{$Type: 'Common.ValueListParameterInOut', LocalDataProperty:'skill', ValueListProperty: 'skill'}]}
      });
	exper_in_months: String;
	locality: String;
	salary_range: String;
	openings: String;
	city: String;
	state: String;
	country: Country;
	@"sap:value-list": 'fixed-values'
	status : String(50) @(
      Common: {
      ValueList: {$Type: 'Common.ValueListType', CollectionPath:'Status', SearchSupported:true,Parameters:[{$Type: 'Common.ValueListParameterInOut', LocalDataProperty:'status', ValueListProperty: 'status'}]}
      });
    phone: String;  
    start_date: Date;
	end_date: Date;
	imageUrl  : String;
	imageType : String @Core.IsMediaType;
	Interested_workers : Association to many Interested_workers on Interested_workers.job = $self;
};

entity Interested_workers : managed {
	key ID : UUID;
	skill: String(200) @(
      Common: {
      ValueList: {$Type: 'Common.ValueListType', CollectionPath:'Skill_types', SearchSupported:true,Parameters:[{$Type: 'Common.ValueListParameterInOut', LocalDataProperty:'skill', ValueListProperty: 'skill'}]}
      });
    worker_name :String;
    worker_id : UUID;
	job: Association to Jobs;
	experience: String;
};

