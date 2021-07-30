Instance: jp-ePrescription-CoverageSS
InstanceOf: Coverage
Title: "Coverage リソース（保険・⾃費情報）の記述例"
Usage: #example
* meta.versionId = "1"
* meta.lastUpdated = "2021-06-04T05:41:15.282+00:00"
* meta.source = "#WK5bcZq6Tjsj5ohK"
* extension[0].url = "http://jpfhir.jp/fhir/ePrescription/StructureDefinition/InsuredPersonSymbol"
* extension[=].valueString = "１２３４５"
* extension[+].url = "http://jpfhir.jp/fhir/ePrescription/StructureDefinition/InsuredPersonNumber"
* extension[=].valueString = "６７８９０"
* status = #active
* type = urn:oid:1.2.392.100495.20.2.61#1
* beneficiary = Reference(jp-ePrescription-PatientSS)
* dependent = "01"
* relationship = urn:oid:1.2.392.100495.20.2.62#1 "被保険者"
* period.start = "2018-04-01"
* payor = Reference(jp-ePrescription-OrganizationSS)
* costToBeneficiary.type = $coveragecopay-type#copaypct "負担率"
* costToBeneficiary.valueQuantity = 30 '%' "%"