namespace my.automotive;

using { cuid, managed } from '@sap/cds/common';

  entity Cars : cuid, managed {
    //key ID    : UUID  @(Core.Computed : true);
    model     : String(60);
    color     : String;
    year      : Date;
    manufact  : Association to Manufacturers;
    stock     : Integer;
    price     : Double;
    level     : Integer;
  }

  entity Manufacturers : cuid, managed {
    name      : String;
    address   : String;
    cars      : Association to many Cars on cars.manufact = $self;
  } 
