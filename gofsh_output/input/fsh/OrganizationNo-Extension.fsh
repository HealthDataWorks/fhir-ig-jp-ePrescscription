Extension: OrganizationNo
Id: jp-ePrescription-OrganizationNo
Title: "保険医療機関番号（7 桁）"
Description: "保険医療機関番号7桁を表す拡張"
* ^meta.versionId = "1"
* ^meta.lastUpdated = "2021-06-04T04:19:21.234+00:00"
* ^meta.source = "#TntlKwZzFktqPd1f"
* ^url = "http://jpfhir.jp/fhir/ePrescription/StructureDefinition/OrganizationNo"
* ^kind = #resource
* ^context.type = #fhirpath
* ^context.expression = "Organization"
* url = "http://jpfhir.jp/fhir/ePrescription/StructureDefinition/OrganizationNo" (exactly)
* url MS
* url ^short = "拡張を識別するURL。固定値。"
* value[x] 1.. MS
* value[x] only Identifier
* value[x] ^example.label = "Example for Identifier"
* value[x] ^example.valueIdentifier.system = "urn:oid:1.2.392.100495.20.3.23"
* value[x] ^example.valueIdentifier.value = "1234567"