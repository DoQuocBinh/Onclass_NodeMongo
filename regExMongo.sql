#https://docs.mongodb.com/manual/reference/operator/query/regex/

db.products.insertMany( [
  { "_id" : 100, "sku" : "abc123", "description" : "Single line description." },
{ "_id" : 101, "sku" : "abc789", "description" : "First line\nSecond line" },
{ "_id" : 102, "sku" : "xyz456", "description" : "Many spaces before     line" },
{ "_id" : 103, "sku" : "xyz789", "description" : "Multiple\nline description" }
]);

//find all products which ended with 789
db.products.find( { sku: { $regex: /789$/ } } )
//search with any product start by ABC- insenesitive search
db.products.find( { sku: { $regex: /^ABC/i } } )
//search for starting with S: multiple lines
db.products.find( { description: { $regex: /^S/, $options: 'm' } } )

//description contains 'line'
db.products.find( { description: { $regex: /line/ } } )

//contains  m then any characters(.*) then 'line'
db.products.find( { description: { $regex: /m.*line/, $options: 'si' } } )
