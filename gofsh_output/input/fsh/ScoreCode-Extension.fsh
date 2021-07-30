Extension: ScoreCode
Id: jp-ePrescription-ScoreCode
Title: "点数表コード"
Description: "保険医療機関番号に含まれる点数表コード1桁を表す拡張"
* ^meta.versionId = "1"
* ^meta.lastUpdated = "2021-06-04T04:20:12.983+00:00"
* ^meta.source = "#9P2P0UDecBOvF2xa"
* ^url = "http://jpfhir.jp/fhir/ePrescription/StructureDefinition/OrganizationCategory"
* ^kind = #resource
* ^context.type = #fhirpath
* ^context.expression = "Organization"
* url = "http://jpfhir.jp/fhir/ePrescription/StructureDefinition/OrganizationCategory" (exactly)
* url MS
* url ^short = "拡張を識別するURL。固定値。"
* value[x] 1.. MS
* value[x] only Identifier
* value[x] ^example.label = "Example for Identifier"
* value[x] ^example.valueIdentifier.system = "urn:oid:1.2.392.100495.20.3.22"
* value[x] ^example.valueIdentifier.value = "1"