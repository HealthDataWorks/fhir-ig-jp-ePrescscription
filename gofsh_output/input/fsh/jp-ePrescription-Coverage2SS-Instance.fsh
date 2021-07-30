Instance: jp-ePrescription-Coverage2SS
InstanceOf: Coverage
Title: "Coverage リソース（公費情報）の記述例"
Usage: #example
* meta.versionId = "1"
* meta.lastUpdated = "2021-06-04T05:41:15.283+00:00"
* meta.source = "#FGnTlFoK1pcWERgh"
* status = #active
* type = urn:oid:1.2.392.100495.20.2.61#8
* subscriberId = "12345678"
* beneficiary = Reference(jp-ePrescription-PatientSS)
* period.start = "2020-01-01"
* period.end = "2020-12-31"
* payor = Reference(jp-ePrescription-OrganizationSS)
* order = 1
* costToBeneficiary.type = $coveragecopay-type#copaypct "負担率"
* costToBeneficiary.valueQuantity = 10 '%' "%"