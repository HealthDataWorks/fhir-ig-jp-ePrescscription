Instance: jp-ePrescription-MedicationRequestSS5
InstanceOf: MedicationRequest
Title: "不均等投与インスタンスの記述例（１⽇⽤法で記述）"
Usage: #example
* meta.versionId = "1"
* meta.lastUpdated = "2021-06-04T05:42:08.260+00:00"
* meta.source = "#H0F7ZVpTcom8DBtU"
* identifier[0].system = "urn:oid:1.2.392.100495.20.3.81"
* identifier[=].value = "9"
* identifier[+].system = "urn:oid:1.2.392.100495.20.3.82"
* identifier[=].value = "1"
* status = #active
* intent = #order
* medicationCodeableConcept = urn:oid:1.2.392.200119.4.403.1#105271807 "プレドニン錠５ｍｇ"
* subject = Reference(jp-ePrescription-PatientSS)
* authoredOn = "2020-08-21T12:28:17+09:00"
* dosageInstruction.text = "１日３回 毎食後 ７錠（４錠－２錠－１錠）"
* dosageInstruction.additionalInstruction[0] = urn:oid:1.2.392.200250.2.2.20.22#V14NNNNN "不均等・１回目・４錠"
* dosageInstruction.additionalInstruction[+] = urn:oid:1.2.392.200250.2.2.20.22#V22NNNNN "不均等・２回目・２錠"
* dosageInstruction.additionalInstruction[+] = urn:oid:1.2.392.200250.2.2.20.22#V31NNNNN "不均等・３回目・１錠"
* dosageInstruction.timing.repeat.boundsDuration = 7 'd' "日"
* dosageInstruction.timing.code = urn:oid:1.2.392.200250.2.2.20.20#1013044400000000 "１日３回毎食後"
* dosageInstruction.route = urn:oid:1.2.392.200250.2.2.20.40#0 "経口"
* dosageInstruction.method = urn:oid:1.2.392.200250.2.2.20.30#1 "内服"
* dosageInstruction.doseAndRate.type = urn:oid:1.2.392.100495.20.2.22#1 "製剤量"
* dosageInstruction.doseAndRate.rateRatio.numerator = 7 urn:oid:1.2.392.100495.20.2.101#TAB "錠"
* dosageInstruction.doseAndRate.rateRatio.denominator = 1 'd' "日"
* dispenseRequest.quantity = 49 urn:oid:1.2.392.100495.20.2.101#TAB "錠"
* dispenseRequest.expectedSupplyDuration = 7 'd' "日"
* substitution.allowedCodeableConcept = urn:oid:1.2.392.100495.20.2.41#0 "変更可"