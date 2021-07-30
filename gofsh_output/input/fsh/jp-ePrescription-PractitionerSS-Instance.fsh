Instance: jp-ePrescription-PractitionerSS
InstanceOf: Practitioner
Title: "Practitioner リソース（処⽅医情報）の記述例"
Usage: #example
* meta.versionId = "1"
* meta.lastUpdated = "2021-06-04T05:43:12.633+00:00"
* meta.source = "#3jAb7d72k22wotm2"
* name[0].extension.url = "http://hl7.org/fhir/StructureDefinition/iso21090-EN-representation"
* name[=].extension.valueCode = #IDE
* name[=].text = "神奈川花子"
* name[=].family = "神奈川"
* name[=].given = "花子"
* name[+].extension.url = "http://hl7.org/fhir/StructureDefinition/iso21090-EN-representation"
* name[=].extension.valueCode = #SYL
* name[=].text = "カナガワハナコ"
* name[=].family = "カナガワ"
* name[=].given = "ハナコ"
* qualification.identifier.system = "urn:oid:1.2.392.100495.20.3.32.13"
* qualification.identifier.value = "4-321"
* qualification.code = $2.7#BS "Bachelor of Science"
* qualification.code.text = "Bachelor of Science"