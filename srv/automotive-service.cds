using my.automotive as my from '../db/schema'; 
@path: 'service/automotive'
service AutomotiveService { 
    entity Cars as projection on my.Cars;
        annotate Cars with @odata.draft.enabled;
    entity Manufacturers as projection on my.Manufacturers; 
        annotate Manufacturers with @odata.draft.enabled;
}
