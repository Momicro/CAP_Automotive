using AutomotiveService from './automotive-service';

annotate AutomotiveService.Cars with {
	model       @title: 'Model';
	color      	@title: 'Color';
	year       	@title: 'Year';
	manufact  	@title: 'Manufacturer';
	stock		@title : 'Stock'; 
	price      	@title: 'Price';
}

annotate AutomotiveService.Manufacturers with {
	ID @(
		UI.Hidden,
		Common: {
		Text: name 
		}
	);
	name  		@title: 'Name';
	address  	@title: 'Address';
	cars        @title: 'Cars';
}

annotate AutomotiveService.Cars with @(
	UI: {
		HeaderInfo: {
			TypeName: 'Car',
			TypeNamePlural: 'Cars',
			Title          : {
                $Type : 'UI.DataField',
                Value : model
            },
			Description : {
				$Type: 'UI.DataField',
				Value: color
			}
		},
		SelectionFields: [manufact_ID, model],
		LineItem: [
			{Value: manufact_ID},
			{Value: model},
			{Value: color},
			{
				Value: stock,
				Criticality: level
			},
			{Value: price}
		],
		Facets: [
			{$Type: 'UI.ReferenceFacet', Label: 'Main', Target: '@UI.FieldGroup#Main'}
		],
		FieldGroup#Main: {
			Data: [
				{Value: manufact_ID},
				{Value: manufact.address},
				{
					Value: stock,
					Criticality: level
				},
				{Value: price}
			]
		}
	},
) {

};

annotate AutomotiveService.Cars with {
	manufact @(
		Common: {
			//show text, not id for manufacturer in the context of cars
			Text: manufact.name, TextArrangement: #TextOnly,
			
			ValueList: {
				Label: 'Manufacturers',
				CollectionPath: 'Manufacturers',
				Parameters: [
					{ $Type: 'Common.ValueListParameterInOut',
						LocalDataProperty: manufact_ID,
						ValueListProperty: 'ID'
					},
					{ $Type: 'Common.ValueListParameterDisplayOnly',
						ValueListProperty: 'name'
					}
				]
				
			} 
		}
	);
}
