Instance: jp-ePrescription-MedicationRequestSS8-3
InstanceOf: MedicationRequest
Title: "不均等投与インスタンスの記述例（１回ごと記述）剤グループ3"
Usage: #example
* meta.versionId = "1"
* meta.lastUpdated = "2021-06-04T05:42:34.201+00:00"
* meta.source = "#E5V15hXhUbcC4iEM"
* extension.url = "http://jpfhir.jp/fhir/ePrescription/StructureDefinition/UsageDuration"
* extension.valueDuration = 7 'd' "日"
* identifier[0].system = "urn:oid:1.2.392.100495.20.3.81"
* identifier[=].value = "8"
* identifier[+].system = "urn:oid:1.2.392.100495.20.3.82"
* identifier[=].value = "1"
* status = #active
* intent = #order
* medicationCodeableConcept = urn:oid:1.2.392.200119.4.403.1#105271807 "プレドニン錠５ｍｇ"
* subject = Reference(jp-ePrescription-PatientSS)
* authoredOn = "2020-08-21T12:28:17+09:00"
* dosageInstruction.text = "内服・経口・１日１回夕食後 １回１錠 ７日分"
* dosageInstruction.timing.repeat.boundsDuration = 7 'd' "日"
* dosageInstruction.timing.code = urn:oid:1.2.392.200250.2.2.20.20#1011040000000000 "内服・経口・１日１回夕食後"
* dosageInstruction.route = urn:oid:1.2.392.200250.2.2.20.40#10 "経口"
* dosageInstruction.method = urn:oid:1.2.392.200250.2.2.20.30#1 "内服"
* dosageInstruction.doseAndRate.type = urn:oid:1.2.392.100495.20.2.22#1 "製剤量"
* dosageInstruction.doseAndRate.doseQuantity = 1 urn:oid:1.2.392.100495.20.2.101#TAB "錠"
* dispenseRequest.quantity = 7 urn:oid:1.2.392.100495.20.2.101#TAB "錠"
* dispenseRequest.expectedSupplyDuration = 7 'd' "日"
* substitution.allowedCodeableConcept = urn:oid:1.2.392.100495.20.2.41#0 "変更可"