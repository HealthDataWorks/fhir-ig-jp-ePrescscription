Extension: PrefectureNo
Id: jp-ePrescription-PrefectureNo
Title: "都道府県番号"
Description: "保険医療機関番号に含まれる都道府県番号2桁を表す拡張"
* ^meta.versionId = "1"
* ^meta.lastUpdated = "2021-06-04T04:20:00.643+00:00"
* ^meta.source = "#iIzLkdYA8SB8wPnx"
* ^url = "http://jpfhir.jp/fhir/ePrescription/StructureDefinition/PrefectureNo"
* ^kind = #resource
* ^context.type = #fhirpath
* ^context.expression = "Organization"
* url = "http://jpfhir.jp/fhir/ePrescription/StructureDefinition/PrefectureNo" (exactly)
* url MS
* url ^short = "拡張を識別するURL。固定値。"
* value[x] only Identifier
* value[x] MS
* value[x] ^example.label = "Example for Identifier"
* value[x] ^example.valueIdentifier.system = "urn:oid:1.2.392.100495.20.3.21"
* value[x] ^example.valueIdentifier.value = "13"