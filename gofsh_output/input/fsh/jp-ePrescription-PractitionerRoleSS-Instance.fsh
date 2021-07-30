Instance: jp-ePrescription-PractitionerRoleSS
InstanceOf: PractitionerRole
Title: "PractitionerRole リソース（処⽅医役割情報）の記述例"
Usage: #example
* meta.versionId = "1"
* meta.lastUpdated = "2021-06-04T05:43:19.540+00:00"
* meta.source = "#d4GJELHIrJhWi9xy"
* identifier[0].system = "urn:oid:1.2.392.100495.20.3.31"
* identifier[=].value = "123456"
* identifier[+].system = "urn:oid:1.2.392.100495.20.3.41.11311234567"
* identifier[=].value = "123"
* practitioner = Reference(jp-ePrescription-PractitionerSS)
* organization = Reference(jp-ePrescription-Organization3SS)