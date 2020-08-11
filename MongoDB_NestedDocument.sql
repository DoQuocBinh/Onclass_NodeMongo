db.inventory.insertMany( [
   { item: "journal", qty: 25, size: { h: 14, w: 21, uom: "cm" }, status: "A" },
   { item: "notebook", qty: 50, size: { h: 8.5, w: 11, uom: "in" }, status: "A" },
   { item: "paper", qty: 100, size: { h: 8.5, w: 11, uom: "in" }, status: "D" },
   { item: "planner", qty: 75, size: { h: 22.85, w: 30, uom: "cm" }, status: "D" },
   { item: "postcard", qty: 45, size: { h: 10, w: 15.25, uom: "cm" }, status: "A" }
]);
//find all document
db.inventory.find({})

//order of the fields is important
db.inventory.find( { size: { h: 14, w: 21, uom: "cm" } } )
db.inventory.find(  { size: { w: 21, h: 14, uom: "cm" } } )
//search for the field uom in document size
db.inventory.find( { "size.uom": "in" } )
// <15
db.inventory.find( { "size.h": { $lt: 15 } })
//test nest document and regular expression search
db.inventory.find( { "size.uom": { $regex: /in/ } } )
//search for AND conditions
db.inventory.find( { "size.h": { $lt: 15 }, "size.uom": "in", status: "D" } )

