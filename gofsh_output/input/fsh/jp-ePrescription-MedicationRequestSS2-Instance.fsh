Instance: jp-ePrescription-MedicationRequestSS2
InstanceOf: MedicationRequest
Title: "外⽤薬の記述例1"
Usage: #example
* meta.versionId = "1"
* meta.lastUpdated = "2021-06-04T05:42:08.287+00:00"
* meta.source = "#YRNJvXjNHOQc2apN"
* identifier[0].system = "urn:oid:1.2.392.100495.20.3.81"
* identifier[=].value = "1"
* identifier[+].system = "urn:oid:1.2.392.100495.20.3.82"
* identifier[=].value = "1"
* status = #active
* intent = #order
* medicationCodeableConcept = urn:oid:1.2.392.200119.4.403.1#102094601 "チモプトール点眼薬０．２５％ ５ｍＬ"
* subject = Reference(jp-ePrescription-PatientSS)
* authoredOn = "2020-08-21T12:28:17+09:00"
* dosageInstruction[0].text = "外用・点眼・１日３回 １回１滴（右眼）"
* dosageInstruction[=].timing.code = urn:oid:1.2.392.200250.2.2.20.20#2H73000000000000 "外用・点眼・１日３回"
* dosageInstruction[=].site = urn:oid:1.2.392.200250.2.2.20.32#26R "右眼"
* dosageInstruction[=].doseAndRate.type = urn:oid:1.2.392.100495.20.2.22#1 "製剤量"
* dosageInstruction[=].doseAndRate.doseQuantity = 1 urn:oid:1.2.392.100495.20.2.101#DROP "滴"
* dosageInstruction[+].text = "外用・点眼・１日３回 １回２滴（左眼）"
* dosageInstruction[=].timing.code = urn:oid:1.2.392.200250.2.2.20.20#2H73000000000000 "外用・点眼・１日３回"
* dosageInstruction[=].site = urn:oid:1.2.392.200250.2.2.20.32#26L "左眼"
* dispenseRequest.quantity = 2 urn:oid:1.2.392.100495.20.2.101#HON "本"