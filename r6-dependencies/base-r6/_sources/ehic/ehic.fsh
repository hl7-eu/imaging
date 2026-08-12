Logical: EHIC
Id: EHIC
Description: "A free card that gives access to medically necessary, state-provided healthcare during a temporary stay in any of the 27 EU countries, Iceland, Liechtenstein, Norway and Switzerland under the same conditions and at the same cost (free in some countries) as people insured in that country. The benefits covered include, for example, benefits provided in conjunction with chronic or existing illnesses as well as in conjunction with pregnancy and childbirth.
Cards are issued by your national health insurance provider.
Important – the European Health Insurance Card:
* is not an alternative to travel insurance. It does not cover any private healthcare or costs such as a return flight to your home country or lost/stolen property,
* does not cover your costs if you are travelling for the express purpose of obtaining medical treatment,
* does not guarantee free services. As each country’s healthcare system is different services that cost nothing at home might not be free in another country."
Title: "European Health Insurance Card"
* country 1..1 code "Country Code" "Code of the Member State issuing the card"
* name 1..1 string  "3 - Name" "Forename of the card holder"
* givenName 1..1 string  "4 - Given names" "Surname of the card holder"
* birthDate  1..1 dateTime  "5 - Date of birth" "Date of birth of the card holder"
* personalId  1..1 string "6 - Personal identification number" "Personal identification number of the card holder or, when no such number exists, the number of the insured person from whom the rights of the card holder derive,"
* istitutionId 1..1 string  "7 - Identification number of the institution" "Identification number and acronym of the competent institution"
* cardNumber 1..1 string  "8 - Identification number of the card" "Logical number of the card."
* expiryDate 1..1 dateTime "9 - expiry date" "Expiry date of the card"
