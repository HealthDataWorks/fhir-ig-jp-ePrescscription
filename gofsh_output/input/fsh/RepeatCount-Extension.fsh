Extension: RepeatCount
Id: jp-ePrescription-RepeatCount
Title: "頓⽤回数"
Description: "頓⽤の場合など調剤量を錠数ではなく回数で表現したい場合の回数を格納する拡張。"
* ^meta.versionId = "1"
* ^meta.lastUpdated = "2021-06-04T04:20:06.322+00:00"
* ^meta.source = "#o3Vah3y2EeEiTzbQ"
* ^url = "http://jpfhir.jp/fhir/ePrescription/StructureDefinition/ExpectedRepeatCount"
* ^kind = #resource
* ^context.type = #fhirpath
* ^context.expression = "MedicationRequest.dispenseRequest"
* url = "http://jpfhir.jp/fhir/ePrescription/StructureDefinition/ExpectedRepeatCount" (exactly)
* url MS
* url ^short = "拡張を識別するURL。固定値。"
* value[x] 1.. MS
* value[x] only integer
* value[x] ^short = "頓⽤回数。値は例⽰。"
* value[x] ^example.label = "Example for integer"
* value[x] ^example.valueInteger = 5