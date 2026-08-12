Instance: LocationExample
InstanceOf: LocationEuCore
Title: "Location Example"
Description: "Example of a Location resource conforming to the Location (EU) profile."
* id = "example-location"
// to be added => * physicalType ^short = "Location type"
* name = "Best Location"
* address.line = "123 Example Street"
* address.city = "Example City"
* address.state = "EX"
* address.postalCode = "12345"
* address.country = "EX"
* contact.telecom
  * system = #phone
  * value = "555-1234"
  * use = #work
