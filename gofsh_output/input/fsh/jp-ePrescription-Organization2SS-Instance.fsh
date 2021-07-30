Instance: jp-ePrescription-Organization2SS
InstanceOf: Organization
Title: "Organization リソース（処⽅医療機関情報）の記述例"
Usage: #example
* meta.versionId = "1"
* meta.lastUpdated = "2021-06-04T05:42:54.361+00:00"
* meta.source = "#J54De3QCu53mtc7n"
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
* telecom.system = #phone
* telecom.value = "0123-456-7890"
* address.text = "〒100-0001 東京都千代田区千代田９－９－９"