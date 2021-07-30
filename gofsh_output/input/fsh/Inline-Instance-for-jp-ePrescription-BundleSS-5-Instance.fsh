Instance: Inline-Instance-for-jp-ePrescription-BundleSS-5
InstanceOf: Organization
Usage: #inline
* extension[0].url = "http://jpfhir.jp/fhir/ePrescription/StructureDefinition/PrefectureNo"
* extension[=].valueIdentifier.system = "urn:oid:1.2.392.100495.20.3.21"
* extension[=].valueIdentifier.value = "13"
* extension[+].url = "http://jpfhir.jp/fhir/ePrescription/StructureDefinition/OrganizationCategory"
* extension[=].valueIdentifier.system = "urn:oid:1.2.392.100495.20.3.22"
* extension[=].valueIdentifier.value = "1"
* extension[+].url = "http://jpfhir.jp/fhir/ePrescription/StructureDefinition/OrganizationNo"
* extension[=].valueIdentifier.system = "urn:oid:1.2.392.100495.20.3.23"
* extension[=].valueIdentifier.value = "1234567"
* identifier.system = "http://jpfhir.jp/fhir/ePrescription/InsuranceMedicalInstitutionNo"
* identifier.value = "1311234567"
* type = $organization-type#prov
* name = "厚生労働省第一病院"
* telecom[0].system = #phone
* telecom[=].value = "0123-456-7890"
* telecom[+].system = #fax
* telecom[=].value = "0123-456-7891"
* telecom[+].system = #other
* telecom[=].value = "090-9999-9999"