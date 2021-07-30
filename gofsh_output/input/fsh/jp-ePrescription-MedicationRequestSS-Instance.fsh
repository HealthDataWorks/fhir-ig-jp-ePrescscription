Instance: jp-ePrescription-MedicationRequestSS
InstanceOf: MedicationRequest
Title: "内服薬の記述例"
Usage: #example
* meta.versionId = "1"
* meta.lastUpdated = "2021-06-04T05:42:08.221+00:00"
* meta.source = "#W6yaiGtwWI8JA7qX"
* extension.url = "http://jpfhir.jp/fhir/ePrescription/StructureDefinition/UsageDuration"
* extension.valueDuration = 7 'd' "日"
* identifier[0].system = "urn:oid:1.2.392.100495.20.3.81"
* identifier[=].value = "1"
* identifier[+].system = "urn:oid:1.2.392.100495.20.3.82"
* identifier[=].value = "1"
* status = #active
* intent = #order
* medicationCodeableConcept.coding[0] = urn:oid:1.2.392.200119.4.403.1#103831601 "カルボシステイン錠２５０ｍｇ"
* medicationCodeableConcept.coding[+] = urn:oid:1.2.392.100495.20.2.73#2233002F1280 "カルボシステイン錠２５０ｍｇ"
* subject = Reference(jp-ePrescription-PatientSS)
* authoredOn = "2020-08-21T12:28:17+09:00"
* note.text = "薬剤単位の備考"
* dosageInstruction.text = "内服・経口・１日３回朝昼夕食後 １回１錠 ７日分"
* dosageInstruction.timing.repeat.boundsDuration = 7 'd' "日"
* dosageInstruction.timing.code = urn:oid:1.2.392.200250.2.2.20.20#1013044400000000 "内服・経口・１日３回朝昼夕食後"
* dosageInstruction.route = urn:oid:1.2.392.200250.2.2.20.40#10 "経口"
* dosageInstruction.method = urn:oid:1.2.392.200250.2.2.20.30#1 "内服"
* dosageInstruction.doseAndRate.type = urn:oid:1.2.392.100495.20.2.22#1 "製剤量"
* dosageInstruction.doseAndRate.doseQuantity = 1 urn:oid:1.2.392.100495.20.2.101#TAB "錠"
* dosageInstruction.doseAndRate.rateRatio.numerator = 3 urn:oid:1.2.392.100495.20.2.101#TAB "錠"
* dosageInstruction.doseAndRate.rateRatio.denominator = 1 'd' "日"
* dispenseRequest.quantity = 21 urn:oid:1.2.392.100495.20.2.101#TAB "錠"
* dispenseRequest.expectedSupplyDuration = 7 'd' "日"
* substitution.allowedCodeableConcept = urn:oid:1.2.392.100495.20.2.41#1 "変更不可"
* substitution.reason.text = "患者からの強い要望により"