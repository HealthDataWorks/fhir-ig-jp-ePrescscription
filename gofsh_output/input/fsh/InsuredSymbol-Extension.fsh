Extension: InsuredSymbol
Id: jp-ePrescription-InsuredSymbol
Title: "被保険者証記号"
Description: "被保険者証記号を格納する拡張"
* ^meta.versionId = "1"
* ^meta.lastUpdated = "2021-06-04T04:17:41.910+00:00"
* ^meta.source = "#o85t50XZZPTpDja5"
* ^url = "http://jpfhir.jp/fhir/ePrescription/StructureDefinition/InsuredPersonSymbol"
* ^kind = #resource
* ^context.type = #fhirpath
* ^context.expression = "Coverage"
* url = "http://jpfhir.jp/fhir/ePrescription/StructureDefinition/InsuredPersonSymbol" (exactly)
* url MS
* url ^short = "拡張を識別するURL。固定値。"
* value[x] 1.. MS
* value[x] only string
* value[x] ^short = "被保険者証記号。記録形式は「オンライン⼜は光ディスク等による請求に係る記録条件仕様（医科⽤）」に従う。値は例⽰。"
* value[x] ^example.label = "Example for string"
* value[x] ^example.valueString = "１２３４５"