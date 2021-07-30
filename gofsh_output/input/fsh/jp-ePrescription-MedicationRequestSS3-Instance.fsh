Instance: jp-ePrescription-MedicationRequestSS3
InstanceOf: MedicationRequest
Title: "外⽤薬の記述例2"
Usage: #example
* meta.versionId = "1"
* meta.lastUpdated = "2021-06-04T05:42:08.269+00:00"
* meta.source = "#efzZLIkXrGG8C2Bp"
* identifier[0].system = "urn:oid:1.2.392.100495.20.3.81"
* identifier[=].value = "2"
* identifier[+].system = "urn:oid:1.2.392.100495.20.3.82"
* identifier[=].value = "1"
* status = #active
* intent = #order
* medicationCodeableConcept = urn:oid:1.2.392.200119.4.403.1#106062101 "リンデロンＶＧクリーム ５ｇ"
* subject = Reference(jp-ePrescription-PatientSS)
* authoredOn = "2020-08-21T12:28:17+09:00"
* dosageInstruction[0].text = "１日３回患部に塗布（膝）"
* dosageInstruction[=].timing.code = urn:oid:1.2.392.200250.2.2.20.20#2B73000000000000 "外用・塗布・１日３回"
* dosageInstruction[=].site = urn:oid:1.2.392.200250.2.2.20.32#950 "膝"
* dosageInstruction[=].route = urn:oid:1.2.392.200250.2.2.20.40#2B "塗布"
* dosageInstruction[=].method = urn:oid:1.2.392.200250.2.2.20.30#2 "外用"
* dosageInstruction[+].text = "１日３回患部に塗布（すね）"
* dosageInstruction[=].timing.code = urn:oid:1.2.392.200250.2.2.20.20#2B73000000000000 "外用・塗布・１日３回"
* dosageInstruction[=].site = urn:oid:1.2.392.200250.2.2.20.32#970 "すね"
* dosageInstruction[=].route = urn:oid:1.2.392.200250.2.2.20.40#2B "塗布"
* dosageInstruction[=].method = urn:oid:1.2.392.200250.2.2.20.30#2 "外用"
* dispenseRequest.quantity = 2 urn:oid:1.2.392.100495.20.2.101#HON "本"
* substitution.allowedCodeableConcept = urn:oid:1.2.392.100495.20.2.41#0 "変更可"