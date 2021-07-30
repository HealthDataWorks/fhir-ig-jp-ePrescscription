Extension: MedicationStartDate
Id: jp-ePrescription-MedicationStartDate
Title: "投与開始日"
Description: "投与開始⽇を格納する拡張"
* ^meta.versionId = "1"
* ^meta.lastUpdated = "2021-06-04T04:18:09.127+00:00"
* ^meta.source = "#iaIlS3Q3djQhoZly"
* ^url = "http://jpfhir.jp/fhir/ePrescription/StructureDefinition/PeriodOfUse"
* ^kind = #resource
* ^context.type = #fhirpath
* ^context.expression = "MedicationRequest"
* url = "http://jpfhir.jp/fhir/ePrescription/StructureDefinition/PeriodOfUse" (exactly)
* url MS
* url ^short = "拡張を識別するURL。固定値。"
* value[x] 1.. MS
* value[x] only Period
* value[x] ^short = "投与期間を表す"
* value[x] ^example.label = "Example for Period"
* value[x] ^example.valuePeriod.start = "2021-04-01T00:00:00+09:00"
* value[x] ^example.valuePeriod.end = "2021-04-30T00:00:00+09:00"