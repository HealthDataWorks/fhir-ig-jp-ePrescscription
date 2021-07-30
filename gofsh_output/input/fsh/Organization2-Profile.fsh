Profile: Organization2
Parent: $Organization
Id: jp-ePrescription-Organization2
Title: "Organizationリソース　処方医療機関情報"
Description: "処方箋を発行した医療機関の情報をOrganization リソースに格納する。"
* ^meta.versionId = "2"
* ^meta.lastUpdated = "2021-06-04T04:37:58.153+00:00"
* ^meta.source = "#pD8qEKYFI0QxtrDv"
* ^url = "https://healthdataworks.net/JP-ePrescription/StructureDefinition/Organization2"
* ^status = #active
* . ^short = "Organization リソースであることを示す"
* text MS
* text ^short = "本リソースをテキストで表現したものを入れてもよい。"
* text.status = #generated (exactly)
* text.status MS
* text.status ^short = "テキスト内容の全てがリソースのコンテンツから生成されたことを示す。"
* text.div MS
* text.div ^example.label = "Example for xhtml"
* text.div ^example.valueString = "<div\r\n                        xmlns=\"http://www.w3.org/1999/xhtml\">xxx</div>"
* extension MS
* extension ^slicing.discriminator.type = #value
* extension ^slicing.discriminator.path = "url"
* extension ^slicing.rules = #open
* extension contains
    PrefectureNo named 1 1..1 MS and
    ScoreCode named 2 1..1 MS and
    OrganizationNo named 3 1..1 MS
* extension[1] ^short = "都道府県番号２桁。Identifier 型の拡張「PrefectureNo」を使用。"
* extension[+] ^short = "点数表コード１桁。Identifier 型の拡張「OrganizationCategory」を使用。"
* extension[=] ^binding.strength = #required
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
* name 1.. MS
* name ^short = "医療機関名称。"
* name ^example.label = "Example for string"
* name ^example.valueString = "厚生労働省第⼀病院"
* telecom 1..1 MS
* telecom ^short = "医療機関電話番号"
* telecom.system 1.. MS
* telecom.system = #phone (exactly)
* telecom.value 1.. MS
* telecom.value ^example.label = "Example for string"
* telecom.value ^example.valueString = "0123-456-7890"
* address 1..1 MS
* address ^short = "医療機関住所"
* address.text 1.. MS
* address.text ^example.label = "Example for string"
* address.text ^example.valueString = "〒100-0001 東京都千代田区千代田９−９−９"