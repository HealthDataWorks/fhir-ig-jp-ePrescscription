Extension: MedicationDays
Id: jp-ePrescription-MedicationDays
Title: "実投与日数"
Description: "実投与⽇数を格納する拡張"
* ^meta.versionId = "1"
* ^meta.lastUpdated = "2021-06-04T04:17:51.514+00:00"
* ^meta.source = "#fhWi1C2lJasvT9kx"
* ^url = "http://jpfhir.jp/fhir/ePrescription/StructureDefinition/UsageDuration"
* ^kind = #resource
* ^context.type = #fhirpath
* ^context.expression = "MedicationRequest"
* url = "http://jpfhir.jp/fhir/ePrescription/StructureDefinition/UsageDuration" (exactly)
* url MS
* url ^short = "拡張を識別するためのURL。固定値。"
* value[x] 1.. MS
* value[x] only Duration
* value[x] ^example.label = "Example for Duration"
* value[x] ^example.valueDuration.value = "7"
* value[x] ^example.valueDuration.unit = "⽇"