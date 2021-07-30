Extension: InstructionForDispense
Id: jp-ePrescription-InstructionForDispense
Title: "調剤指示"
Description: """MedicatonRequest リソースの
拡張「InstructionForDispense」を表すextension 要素は、
Extension 型の要素であり、調剤者への指示を表す。

薬剤単位の調剤指⽰を表現するための拡張"""
* ^meta.versionId = "1"
* ^meta.lastUpdated = "2021-06-04T04:17:06.131+00:00"
* ^meta.source = "#kFcHfm4nXZ5D9Cnv"
* ^url = "http://jpfhir.jp/fhir/ePrescription/StructureDefinition/InstructionForDispense"
* ^kind = #resource
* ^context.type = #fhirpath
* ^context.expression = "MedicationRequest"
* . ..1 MS
* . ^short = "拡張「InstructionForDispense」。"
* extension ^slicing.discriminator.type = #value
* extension ^slicing.discriminator.path = "url"
* extension ^slicing.rules = #open
* extension contains
    1 ..1 MS and
    2 ..1 MS
* extension[1] ^short = "⽂字型の指⽰内容を表す拡張「TextContent」"
* extension[=].url = "TextContent" (exactly)
* extension[=].url MS
* extension[=].url ^short = "拡張を識別するURL。固定値。"
* extension[=].value[x] 1.. MS
* extension[=].value[x] only string
* extension[=].value[x] ^short = "テキストによる指⽰内容。値は例⽰。"
* extension[=].value[x] ^example.label = "Example for string"
* extension[=].value[x] ^example.valueString = "嚥下障害のため、上記粉砕指⽰"
* extension[+] ^short = "コード型の指⽰内容を表す拡張「CodedContent」。"
* extension[=].url = "CodedContent" (exactly)
* extension[=].url MS
* extension[=].value[x] only CodeableConcept
* extension[=].value[x] MS
* extension[=].value[x] ^fixedCodeableConcept.coding.system = "urn:oid:1.2.392.200250.2.2.30.10"
* extension[=].value[x] ^example.label = "Example for CodeableConcept"
* extension[=].value[x] ^example.valueCodeableConcept = urn:oid:1.2.392.200250.2.2.30.10#C "粉砕指⽰"
* url = "http://jpfhir.jp/fhir/ePrescription/StructureDefinition/InstructionForDispense" (exactly)
* url MS
* url ^short = "拡張を識別するURL。固定値。"