Instance: Inline-Instance-for-jp-ePrescription-BundleSS-1
InstanceOf: Composition
Usage: #inline
* extension.url = "http://hl7.org/fhir/StructureDefinition/composition-clinicaldocument-versionNumber"
* extension.valueString = "1.0"
* identifier.system = "urn:oid:1.2.392.100495.20.3.11"
* identifier.value = "1311234567-2020-00123456"
* status = #final
* type = urn:oid:1.2.392.100495.20.2.11#01 "処方箋"
* category = $PrescriptionCategory#03 "分割処方箋"
* subject = Reference(jp-ePrescription-PatientSS)
* encounter = Reference(jp-ePrescription-EncounterSS)
* date = "2020-08-21T12:12:21+09:00"
* author = Reference(jp-ePrescription-Organization3SS)
* title = "分割処方箋"
* custodian = Reference(jp-ePrescription-Organization3SS)
* event.code.text = "処方箋交付"
* event.period.start = "2021-04-10T09:00:00+09:00"
* event.period.end = "2021-04-10T10:00:00+09:00"
* section[0].title = "分割処方箋セクション"
* section[=].code = urn:oid:1.2.392.100495.20.2.12#11 "分割処方箋セクション"
* section[=].text.status = #generated
* section[=].text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\">xxx\r\n                        \r\n                        \r\n                        \r\n                        </div>"
* section[=].entry[0] = Reference(urn:uuid:9495ef34-a77d-4f3e-8dce-5688e169d0fa)
* section[=].entry[+] = Reference(urn:uuid:b0025d4d-3002-4f5e-fb4e-abead28aee35)
* section[=].entry[+] = Reference(urn:uuid:df8b4e6a-5d45-f4ce-a1af-ff0ca94242b8)
* section[+].title = "別紙セクション"
* section[=].code = urn:oid:1.2.392.100495.20.2.12#12 "分割処方箋別紙セクション"
* section[=].text.status = #generated
* section[=].text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\">xxx\r\n                        \r\n                        \r\n                        \r\n                        </div>"
* section[=].entry = Reference(urn:uuid:ef7892cc-fb3a-b951-9ac7-f8cd6c746f0a)