Instance: jp-ePrescription-MedicationRequestSS9-1
InstanceOf: MedicationRequest
Title: "漸増処⽅の記述例(1)"
Usage: #example
* meta.versionId = "1"
* meta.lastUpdated = "2021-06-04T05:42:34.201+00:00"
* meta.source = "#IqfzY9p4pUeXCG52"
* extension[0].url = "http://jpfhir.jp/fhir/ePrescription/StructureDefinition/PeriodOfUse"
* extension[=].valuePeriod.start = "2020-04-01"
* extension[+].url = "http://jpfhir.jp/fhir/ePrescription/StructureDefinition/UsageDuration"
* extension[=].valueDuration = 2 'd' "日"
* identifier[0].system = "urn:oid:1.2.392.100495.20.3.81"
* identifier[=].value = "13"
* identifier[+].system = "urn:oid:1.2.392.100495.20.3.82"
* identifier[=].value = "1"
* status = #active
* intent = #order
* medicationCodeableConcept = urn:oid:1.2.392.200119.4.403.1#1012309020 "ペルマックス錠 ５０μｇ"
* subject = Reference(jp-ePrescription-PatientSS)
* authoredOn = "2020-08-21T12:28:17+09:00"
* dosageInstruction.text = "１日１回 夕食後 １回１錠 ２日分"
* dosageInstruction.timing.repeat.boundsDuration = 2 'd' "日"
* dosageInstruction.timing.code = urn:oid:1.2.392.200250.2.2.20.20#1011040000000000 "内服・経口・１日１回夕食後"
* dosageInstruction.route = urn:oid:1.2.392.200250.2.2.20.40#10 "経口"
* dosageInstruction.method = urn:oid:1.2.392.200250.2.2.20.30#1 "内服"
* dosageInstruction.doseAndRate.type = urn:oid:1.2.392.100495.20.2.22#1 "製剤量"
* dosageInstruction.doseAndRate.doseQuantity = 1 urn:oid:1.2.392.100495.20.2.101#TAB "錠"
* dosageInstruction.doseAndRate.rateRatio.numerator = 1 urn:oid:1.2.392.100495.20.2.101#TAB "錠"
* dosageInstruction.doseAndRate.rateRatio.denominator = 1 'd' "日"
* dispenseRequest.quantity = 2 urn:oid:1.2.392.100495.20.2.101#TAB "錠"
* dispenseRequest.expectedSupplyDuration = 2 'd' "日"
* substitution.allowedCodeableConcept = urn:oid:1.2.392.100495.20.2.41#0 "変更可"