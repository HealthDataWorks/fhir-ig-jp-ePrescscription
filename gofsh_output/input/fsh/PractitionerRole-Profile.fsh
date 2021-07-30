Profile: PractitionerRole
Parent: $PractitionerRole
Id: jp-ePrescription-PractitionerRole
Title: "PractitionerRoleリソース　処方医役割情報"
Description: """処方医を識別するID や番号として、医籍登録番号、もしくは処方医療機関に
おける処方医ID（たとえば端末利用者アカウント、あるいは職員番号など）を
PractitionerRole リソースのidentifier 要素に記録する。"""
* ^meta.versionId = "2"
* ^meta.lastUpdated = "2021-06-04T04:39:54.194+00:00"
* ^meta.source = "#3v4Mvcugbj4ukyJ5"
* ^url = "https://healthdataworks.net/JP-ePrescription/StructureDefinition/PractitionerRole"
* ^status = #active
* . ^short = "PractitionerRole リソースであることを示す"
* text MS
* text ^short = "本リソースをテキストで表現したものを入れてもよい。"
* text.status = #generated (exactly)
* text.status MS
* text.status ^short = "テキスト内容の全てがリソースのコンテンツから生成されたことを示す。"
* text.div MS
* text.div ^example.label = "Example for xhtml"
* text.div ^example.valueString = "<div\r\n                        xmlns=\"http://www.w3.org/1999/xhtml\">xxx</div>"
* identifier MS
* identifier ^slicing.discriminator.type = #value
* identifier ^slicing.discriminator.path = "system"
* identifier ^slicing.rules = #open
* identifier contains
    1 0..* MS and
    2 ..1 MS
* identifier[1] ^short = "医籍登録番号。可能な場合に記録する。"
* identifier[=].system 1.. MS
* identifier[=].system = "urn:oid:1.2.392.100495.20.3.31" (exactly)
* identifier[=].system ^short = "医籍登録番号の名前空間を識別するURI。"
* identifier[=].value 1.. MS
* identifier[=].value ^short = "医籍登録番号。"
* identifier[=].value ^example.label = "Example for string"
* identifier[=].value ^example.valueString = "123456"
* identifier[+] ^short = "処方医ID。付番方法については「7.1識別子名前空間一覧」を参照。"
* identifier[=].system 1.. MS
* identifier[=].system ^example.label = "Example for uri"
* identifier[=].system ^example.valueUri = "urn:oid:1.2.392.100495.20.3.41.11311234567"
* identifier[=].value 1.. MS
* identifier[=].value ^example.label = "Example for string"
* identifier[=].value ^example.valueString = "123"
* practitioner 1.. MS
* practitioner ^short = "処方医を表すPractitionerリソースへの参照"
* practitioner.reference 1.. MS
* practitioner.reference ^short = "PractitionerリソースのfullUrl要素に指定されるUUID を指定。"
* practitioner.reference ^example.label = "Example for string"
* practitioner.reference ^example.valueString = "urn:uuid:195a292d-169a-5cc4-0e10-7a1c0d3fcb2b"
* organization 1.. MS
* organization ^short = "処方医療機関の診療科を記録する場合、診療科を表すOrganization リソースへの参照。診療科を記録しない場合は、処方医療機関を表すOrganization リソースへの参照。"
* organization.reference 1.. MS
* organization.reference ^short = "Organization リソースのfullUrl要素に指定されるUUID を指定。"
* organization.reference ^example.label = "Example for string"
* organization.reference ^example.valueString = "urn:uuid:179f9f7f-e546-04c2-6888-a9e0b24e5720"