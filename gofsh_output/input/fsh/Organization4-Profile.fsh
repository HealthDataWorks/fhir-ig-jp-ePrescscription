Profile: Organization4
Parent: $Organization
Id: jp-ePrescription-Organization4
Title: "Organizationリソース（分割処方箋における処方医療機関情報）"
Description: "分割処方箋発行医療機関情報は、Organization リソースとして記録する。"
* ^meta.versionId = "2"
* ^meta.lastUpdated = "2021-06-04T04:38:50.270+00:00"
* ^meta.source = "#rEIF0T1wH30KVNg0"
* ^url = "https://healthdataworks.net/JP-ePrescription/StructureDefinition/Organization4"
* ^status = #active
* . ^short = "Organization リソースであることを示す"
* text MS
* text ^short = "本リソースをテキストで表現したものを入れてもよい。"
* text.status MS
* text.status ^short = "テキスト内容の全てがリソースのコンテンツから生成されたことを示す。"
* text.div MS
* extension MS
* extension ^slicing.discriminator.type = #value
* extension ^slicing.discriminator.path = "extension.url"
* extension ^slicing.rules = #open
* extension contains
    PrefectureNo named 1 1..1 MS and
    ScoreCode named 2 1..1 MS and
    OrganizationNo named 3 1..1 MS
* extension[1] ^short = "都道府県番号２桁。Identifier 型の拡張「PrefectureNo」を使用。"
* extension[+] ^short = "点数表コード１桁。Identifier 型の拡張「OrganizationCategory」を使用。"
* extension[+] ^short = "保険医療機関番号７桁。Identifier型の拡張「OrganizationNo」を使用。"
* identifier 1..1 MS
* identifier ^short = "保険医療機関番号10 桁。"
* identifier.system 1.. MS
* identifier.system = "http://jpfhir.jp/fhir/ePrescription/InsuranceMedicalInstitutionNo" (exactly)
* identifier.system ^short = "保険医療機関番号10 桁の名前空間を識別するURL。"
* identifier.value 1.. MS
* identifier.value ^short = "保険医療機関番号10 桁。"
* identifier.value ^example.label = "Example for string"
* identifier.value ^example.valueString = "1311234567"
* type 1..1 MS
* type ^short = "施設種別"
* type.coding 1..1 MS
* type.coding.system 1.. MS
* type.coding.system = "http://terminology.hl7.org/CodeSystem/organization-type" (exactly)
* type.coding.system ^short = "施設種別を表すコード体系を識別するURI。"
* type.coding.code 1.. MS
* type.coding.code = #prov (exactly)
* type.coding.code ^short = "バリューセットOrganizationType(http://hl7.org/fhir/ValueSet/organization-type) から、医療機関を表すコードを指定。"
* name 1..1 MS
* name ^short = "医療機関名称。"
* name ^example.label = "Example for string"
* name ^example.valueString = "厚生労働省第一病院"
* telecom MS
* telecom ^slicing.discriminator.type = #value
* telecom ^slicing.discriminator.path = "telcom.system"
* telecom ^slicing.rules = #open
* telecom contains
    1 1..1 MS and
    2 ..1 MS and
    3 ..1 MS
* telecom[1] ^short = "医療機関電話番号"
* telecom[=].system 1.. MS
* telecom[=].system = #phone (exactly)
* telecom[=].value 1.. MS
* telecom[=].value ^example.label = "Example for string"
* telecom[=].value ^example.valueString = "0123-456-7890"
* telecom[+] ^short = "医療機関FAX番号"
* telecom[=].system 1.. MS
* telecom[=].system = #fax (exactly)
* telecom[=].value 1.. MS
* telecom[=].value ^example.label = "Example for string"
* telecom[=].value ^example.valueString = "0123-456-7891"
* telecom[+] ^short = "その他の連絡先。"
* telecom[=].system 1.. MS
* telecom[=].system = #other (exactly)
* telecom[=].value 1.. MS
* telecom[=].value ^example.label = "Example for string"
* telecom[=].value ^example.valueString = "090-9999-9999"