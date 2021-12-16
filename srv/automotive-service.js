const cds = require('@sap/cds')

module.exports = cds.service.impl(async function() { 

    //console.log(`Service.name: ${srv.name} is served at ${srv.path}`)

    this.after('READ', 'Cars', carsData => {
        const cars = Array.isArray(carsData) ? carsData : [carsData]; 
        cars.forEach(car => {
            if (car.stock < 100) {
                car.level = 1; 
            } 
            if (car.stock >= 100 && car.stock < 200) {
                car.price = car.price - 500; 
                car.level = 2;       
            } 
            if (car.stock >= 200) { 
                car.price = car.price - 1000;
                car.level = 3; 
            } 

            cars.push(car); 
        })
        return cars; 
    }) 
} ); 
