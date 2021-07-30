Extension: Signature
Id: jp-ePrescription-Signature
Title: "後発品変更不可時の電子署名"
Description: "後発品変更不可時の処⽅医の電⼦署名データを格納する拡張"
* ^meta.versionId = "1"
* ^meta.lastUpdated = "2021-06-04T04:20:19.572+00:00"
* ^meta.source = "#3flfq0jEXKIdsZdI"
* ^url = "http://jpfhir.jp/fhir/ePrescription/StructureDefinition/Signature"
* ^kind = #resource
* ^context.type = #fhirpath
* ^context.expression = "MedicationRequest"
* url = "http://jpfhir.jp/fhir/ePrescription/StructureDefinition/Signature" (exactly)
* url MS
* url ^short = "拡張を識別するURL。固定値。"
* value[x] 1.. MS
* value[x] only Signature
* value[x] ^short = "電⼦署名情報"
* value[x] ^comment = " \"valueSignature\": { \n \"type\": [ \n 記載例\n{ \n \"system\": \"urn:iso-astm:E1762-95:2013\", \n \"code\": \"1.2.840.10065.1.12.1.1\", \n \"display\": \"Author's Signature\"\n } \n ],\n \"when\": \"2021-02-01T13:28:18.345+09:00\", \n \"who\": { \n \"reference\": \"urn:uuid:195a292d-169a-5cc4-0e10-7a1c0d3fcb2b\"\n },\n \"data\": \"ZjliNmNkOWI4YTFlYWRjZTY1NzMxYzQyOTQ3NTQ3ZjZkMzM1NTljN2Y5NjAwNWFkZWFiZDI5MTlhO\nWVmNmI5NQ==\"\n } \n"