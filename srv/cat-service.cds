using { my.migrants} from '../db/data-model';

service CatalogService {
  entity Workers as projection on migrants.Workers;
  entity WorkersALP as projection on migrants.WorkersALP;
  entity NGOsALP as projection on migrants.NGOsALP;
  entity JobsALP as projection on migrants.JobsALP;
  entity CampaignsALP as projection on migrants.CampaignsALP;
  entity NGO as projection on migrants.NGO;
  entity Campaigns as projection on migrants.Campaigns;
  entity Jobs as projection on migrants.Jobs;
  entity Skill_details as projection on migrants.Skill_details;
  entity Skill_types @readonly as projection on migrants.Skill_types;
  entity Genders @readonly as projection on migrants.Genders;
  entity Status @readonly as projection on migrants.Status;
  entity Radius @readonly as projection on migrants.Radius;
  
};

annotate CatalogService.Workers with {
	ID @title: 'Worker ID';
	name @title: 'Name';
	phone @title: 'Phone';
	gender @title: 'Gender';
	locality @title: 'Locality';
	city @title: 'City';
	country @title: 'Country';
	state @title: 'State';
	pin_code @title: 'Pin Code';
	aadhar @title: 'Aadhar';
	birth_date @title: 'Date of Birth';
	status @title: 'Status';
	skill @title: 'Skill';
	lat @title: 'Latitude';
	long @title: 'Longitude';
	radius @title: 'Radius';
};

annotate CatalogService.Workers with @(
  UI: {
    SelectionFields: [ name, gender, locality, city, skill , radius],
    LineItem: [
      {$Type: 'UI.DataField', Value: name , Label:'Name'},
      {$Type: 'UI.DataField', Value: gender, Label:'Gender'},
      {$Type: 'UI.DataField', Value: locality, Label:'Locality'},
      {$Type: 'UI.DataField', Value: city, Label:'City'},
      {$Type: 'UI.DataField', Value: skill, Label:'Skill'},
    ],
    HeaderInfo: {
  		Title: {Value: name},
  		TypeName: '{i18n>Worker}',
  		ImageUrl: imageUrl,
    	TypeNamePlural: '{i18n>Workers}',
  		},
	Facets: [
			{$Type: 'UI.ReferenceFacet', Label: '{i18n>GeneralInformation}', Target: '@UI.FieldGroup#GeneralInformation'},
			{$Type: 'UI.ReferenceFacet', Label: '{i18n>Address}', Target: '@UI.FieldGroup#Address'},
			{$Type: 'UI.ReferenceFacet', Label: '{i18n>ContactInformation}', Target: '@UI.FieldGroup#Contact'},
			{$Type: 'UI.ReferenceFacet', Label: '{i18n>Map}', Target: '@UI.GeoLocation'},
			{$Type: 'UI.ReferenceFacet', Label: '{i18n>WorkExperience}', Target: 'Skill_details/@UI.LineItem'}
		],
		FieldGroup#GeneralInformation: {
			Data: [
				{Value: name},
				{Value: gender},
				{Value: aadhar},
				{Value: birth_date},
				{Value: status},
				{Value: skill},
			]
		},
		FieldGroup#Address: {
			Data: [
				{Value: locality},
				{Value: city},
				{Value: state},
				{Value: pin_code},
			]
		},
		FieldGroup#Contact: {
			Data: [
				{Value: phone},
			]
		},
  }
);

annotate CatalogService.WorkersALP with {
	ID @title: 'Workers';
	count @title: 'Workers';
	locality @title: 'Locality';
	city @title: 'City';
	state @title: 'State';
	skill @title: 'Skill';
};
annotate CatalogService.NGOsALP with {
	ID @title: 'NGOs';
	count @title: 'NGOs';
	locality @title: 'Locality';
	city @title: 'City';
	state @title: 'State';
	category @title: 'Category';
};
annotate CatalogService.JobsALP with {
	ID @title: 'Jobs';
	count @title: 'Jobs';
	locality @title: 'Locality';
	city @title: 'City';
	state @title: 'State';
	skill @title: 'Skill';
};
annotate CatalogService.CampaignsALP with {
	ID @title: 'Campaings';
	count @title: 'Campaings';
	locality @title: 'Locality';
	city @title: 'City';
	state @title: 'State';
	category @title: 'Category';
};

annotate CatalogService.WorkersALP with @(
  UI: {
    LineItem: [
      {$Type: 'UI.DataField', Value: locality, Label:'Locality'},
      {$Type: 'UI.DataField', Value: city, Label:'City'},
      {$Type: 'UI.DataField', Value: skill, Label:'Skill'},
    ],
    Chart: 
      {$Type: 'UI.ChartDefinitionType', ChartType: 'UI.ChartType/ColumnDual',Measures:[count],MeasureAttributes:[{$Type: 'UI.ChartMeasureAttributeType',Role: 'UI.ChartMeasureRoleType/valueAxis',Measure: count}],
                    Dimensions:[skill,locality],DimensionAttributes:[{$Type: 'UI.ChartDimensionAttributeType',Dimension: skill,Role: 'UI.ChartDimensionRoleType/Category'},{$Type: 'UI.ChartDimensionAttributeType',Dimension: locality,Role: 'UI.ChartDimensionRoleType/Category2'}]
      }
  }
);
annotate CatalogService.NGOsALP with @(
  UI: {
    LineItem: [
      {$Type: 'UI.DataField', Value: locality, Label:'Locality'},
      {$Type: 'UI.DataField', Value: city, Label:'City'},
      {$Type: 'UI.DataField', Value: category, Label:'Category'},
    ],
    Chart: 
      {$Type: 'UI.ChartDefinitionType', ChartType: 'UI.ChartType/Pie',Measures:[count],MeasureAttributes:[{$Type: 'UI.ChartMeasureAttributeType',Role: 'UI.ChartMeasureRoleType/valueAxis',Measure: count}],
                    Dimensions:[locality],DimensionAttributes:[{$Type: 'UI.ChartDimensionAttributeType',Dimension: locality,Role: 'UI.ChartDimensionRoleType/Category'}]
      }
  }
);
annotate CatalogService.JobsALP with @(
  UI: {
    LineItem: [
      {$Type: 'UI.DataField', Value: locality, Label:'Locality'},
      {$Type: 'UI.DataField', Value: city, Label:'City'},
      {$Type: 'UI.DataField', Value: skill, Label:'Skill'},
    ],
    Chart: 
      {$Type: 'UI.ChartDefinitionType', ChartType: 'UI.ChartType/ColumnDual',Measures:[count],MeasureAttributes:[{$Type: 'UI.ChartMeasureAttributeType',Role: 'UI.ChartMeasureRoleType/valueAxis',Measure: count}],
                    Dimensions:[skill,locality],DimensionAttributes:[{$Type: 'UI.ChartDimensionAttributeType',Dimension: skill,Role: 'UI.ChartDimensionRoleType/Category'},{$Type: 'UI.ChartDimensionAttributeType',Dimension: locality,Role: 'UI.ChartDimensionRoleType/Category2'}]
      }
  }
);

annotate CatalogService.CampaignsALP with @(
  UI: {
    LineItem: [
      {$Type: 'UI.DataField', Value: locality, Label:'Locality'},
      {$Type: 'UI.DataField', Value: city, Label:'City'},
      {$Type: 'UI.DataField', Value: category, Label:'Category'},
    ],
    Chart: 
      {$Type: 'UI.ChartDefinitionType', ChartType: 'UI.ChartType/Donut',Measures:[count],MeasureAttributes:[{$Type: 'UI.ChartMeasureAttributeType',Role: 'UI.ChartMeasureRoleType/valueAxis',Measure: count}],
                    Dimensions:[locality],DimensionAttributes:[{$Type: 'UI.ChartDimensionAttributeType',Dimension: locality,Role: 'UI.ChartDimensionRoleType/Category'}]
      }
  }
);


annotate CatalogService.Skill_details with @(
  UI: {
    LineItem: [
      {$Type: 'UI.DataField', Value: skill , Label:'Skill'},
      {$Type: 'UI.DataField', Value: experience, Label:'Experience in months'},
    ],
    HeaderInfo: {
    	Title: {Value: skill},
  		TypeName: '{i18n>Skill}',
    	TypeNamePlural: '{i18n>Skills}',
    	ImageUrl: imageUrl,
  		},
  	Facets: [
			{$Type: 'UI.ReferenceFacet', Label: '{i18n>Skills}', Target: '@UI.FieldGroup#Experience'},
		],
		FieldGroup#Experience: {
			Label: '{i18n>Skills}',
			Data: [
				{Value: skill , Label:'Skill'},
				{Value: experience , Label:'Experience in months'},
			]
		},	
  }
);

annotate CatalogService.NGO with {
    ngo_registration_number @title: 'NGO Registration Number';
	name @title: 'Name';
	phone @title: 'Phone';
	category @title: 'Category';
	locality @title: 'Locality';
	city @title: 'City';
	state @title: 'State';
	pin_code @title: 'Pin Code';
	web_id @title: 'Website';
	radius @title: 'Radius';
};

annotate CatalogService.NGO with @(
  UI: {
    SelectionFields: [ name, category,  city, phone ],
    LineItem: [
      {$Type: 'UI.DataField', Value: name , Label:'Name'},
      {$Type: 'UI.DataField', Value: category, Label:'Category'},
      {$Type: 'UI.DataField', Value: city, Label:'City'},
      {$Type: 'UI.DataField', Value: phone, Label:'Phone'},
      {$Type: 'UI.DataField', Value: web_id, Label:'Website'},
    ],
    HeaderInfo: {
  		Title: {Value: name},
  		TypeName: '{i18n>NGO}',
    	TypeNamePlural: '{i18n>NGOs}',
    	ImageUrl: imageUrl,
  		},
		Facets: [
			{$Type: 'UI.ReferenceFacet', Label: '{i18n>GeneralInformation}', Target: '@UI.FieldGroup#GeneralInformationNGO'},
			{$Type: 'UI.ReferenceFacet', Label: '{i18n>Address}', Target: '@UI.FieldGroup#AddressNGO'},
			{$Type: 'UI.ReferenceFacet', Label: '{i18n>ContactInformation}', Target: '@UI.FieldGroup#ContactNGO'},
			{$Type: 'UI.ReferenceFacet', Label: '{i18n>Campaigns}', Target: 'Campaigns/@UI.LineItem'},
		],
		FieldGroup#GeneralInformationNGO: {
			Label: '{i18n>GeneralInformation}', 
			Data: [
				{Value: name},
				{Value: ngo_registration_number},
				{Value: category},
			]
		},
		FieldGroup#AddressNGO: {
			Label: '{i18n>Address}',
			Data: [
				{Value: locality},
				{Value: city},
				{Value: state},
				{Value: pin_code},
			]
		},
		FieldGroup#ContactNGO: {
			Label: '{i18n>ContactInformation}',
			Data: [
				{Value: phone},
				{Value: web_id},
			]
		},
  }
);


annotate CatalogService.Campaigns with {
	title @title: 'Name';
	description @title: 'Description';
	fb_link @title: 'Facebook Link';
	status @title: 'Status';
	category @title: 'Category';
	start_date @title: 'Start Date';
	end_date @title: 'End Date';
	location @title: 'Location';
	person_name @title: 'Name';
	number @title: 'Phone';
	mail_id @title: 'Email';
	campaign_image_url @title: 'Image';
	radius @title: 'Radius';
};

annotate CatalogService.Campaigns with @(
  UI: {
	SelectionFields: [ title, description, status,  start_date, location,radius ],
    LineItem: [
      {$Type: 'UI.DataField', Value: title , Label:'Title'},
      {$Type: 'UI.DataField', Value: description, Label:'Description'},
      {$Type: 'UI.DataField', Value: status, Label:'Status'},
      {$Type: 'UI.DataField', Value: category, Label:'Category'},
      {$Type: 'UI.DataField', Value: start_date, Label:'Start Date'},
      {$Type: 'UI.DataField', Value: location, Label:'Location'},
    ],
    HeaderInfo: {
    	Title: {Value: title},
  		TypeName: '{i18n>Campaign}',
    	TypeNamePlural: '{i18n>Campaigns}',
    	ImageUrl: imageUrl,
  		},
	Facets: [
		{$Type: 'UI.ReferenceFacet', Label: '{i18n>GeneralInformation}', Target: '@UI.FieldGroup#GeneralCamp'},
		{$Type: 'UI.ReferenceFacet', Label: '{i18n>Location}', Target: '@UI.FieldGroup#AddressDetailsCamp'},
		{$Type: 'UI.ReferenceFacet', Label: '{i18n>ContactInformation}', Target: '@UI.FieldGroup#ContactDetailsCamp'}
	],
	FieldGroup#GeneralCamp: {
		Label: '{i18n>GeneralInformation}',
		Data: [
			{Value: title},
			{Value: description},
			{Value: category},
			{Value: status},
			{Value: start_date},
			{Value: end_date},
		]
	},
	FieldGroup#AddressDetailsCamp: {
		Label: '{i18n>Location}',
		Data: [
			{Value: location},
		]
	},
	FieldGroup#ContactDetailsCamp: {
		Label: '{i18n>ContactInformation}',
		Data: [
			{Value: person_name},
			{Value: number},
			{Value: mail_id},
			{Value: fb_link},
		]
	},
  }
);



annotate CatalogService.Jobs with {
	title @title: 'Title';
	description @title: 'Description';
	skill @title: 'Skill';
	status @title: 'Status';
	exper_in_months @title: 'Experience in months';
	locality @title: 'Locality';
	salary_range @title: 'Salary';
	openings @title: 'Openings';
	city @title: 'City';
	state @title: 'State';
	country @title: 'Country';
	phone @title: 'Phone';
	start_date @title: 'Start Date';
	end_date @title: 'End Date';
};

annotate CatalogService.Jobs with @(
  UI: {
	SelectionFields: [ title, skill, exper_in_months,  locality, city ,radius],
    LineItem: [
      {$Type: 'UI.DataField', Value: title,  Label:'Title'},
      {$Type: 'UI.DataField', Value: description, Label:'Description'},
      {$Type: 'UI.DataField', Value: status, Label:'Status'},
      {$Type: 'UI.DataField', Value: skill, Label:'Skill'},
      {$Type: 'UI.DataField', Value: exper_in_months, Label:'Experience in months'},
      {$Type: 'UI.DataField', Value: city, Label:'City'},
      {$Type: 'UI.DataField', Value: start_date},
      {$Type: 'UI.DataField', Value: end_date},
    ],
    HeaderInfo: {
    	Title: {Value: title},
  		TypeName: '{i18n>Job}',
    	TypeNamePlural: '{i18n>Jobs}',
    	ImageUrl: imageUrl,
  		},
	Facets: [
		{$Type: 'UI.ReferenceFacet', Label: '{i18n>GeneralInformation}', Target: '@UI.FieldGroup#GeneralInformation1'},
		{$Type: 'UI.ReferenceFacet', Label: '{i18n>Location}', Target: '@UI.FieldGroup#Address1'},
		{$Type: 'UI.ReferenceFacet', Label: '{i18n>ContactInformation}', Target: '@UI.FieldGroup#Contact1'},
		{$Type: 'UI.ReferenceFacet', Label: '{i18n>Intrested}', Target: 'Interested_workers/@UI.LineItem'}
	],
	FieldGroup#GeneralInformation1: {
		Label: '{i18n>GeneralInformation}',
		Data: [
			{Value: title},
			{Value: description},
			{Value: skill},
			{Value: status},
			{Value: salary_range},
			{Value: openings},
			{Value: exper_in_months},
			{Value: start_date},
			{Value: end_date},
		]
	},
	FieldGroup#Address1: {
		Label: '{i18n>Location}', 
		Data: [
				{Value: locality},
				{Value: city},
				{Value: state},
				{Value: country},
		]
	},
	FieldGroup#Contact1: {
		Label: '{i18n>ContactInformation}',
		Data: [
			{Value: phone},
		]
	},
  }
);


annotate CatalogService.Interested_workers with @(
  UI: {
    LineItem: [
      {$Type: 'UI.DataField', Value: worker_name , Label:'Worker Name'},
      {$Type: 'UI.DataField', Value: skill , Label:'Skill'},
      {$Type: 'UI.DataField', Value: experience, Label:'Experience in months'},
    ],
    HeaderInfo: {
  		TypeName: '{i18n>InterestedWorker}',
    	TypeNamePlural: '{i18n>InterestedWorkers}',
  		},
  	Facets: [
			{$Type: 'UI.ReferenceFacet', Label: '{i18n>Skills}', Target: '@UI.FieldGroup#Experience'},
		],
		FieldGroup#Experience: {
			Label: '{i18n>InterestedWorkers}',
			Data: [
				{Value: worker_name , Label:'Worker Name'},
				{Value: skill , Label:'Skill'},
				{Value: experience , Label:'Experience in months'},
			]
		},	
  }
);


