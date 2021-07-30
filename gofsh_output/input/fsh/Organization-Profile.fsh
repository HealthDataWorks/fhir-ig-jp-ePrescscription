Profile: Organization
Parent: $Organization
Id: jp-ePrescription-Organization
Title: "Organizationリソース　保険者情報"
Description: """保険種別が「6:自費」以外の場合、費用負担者情報を、Coverage リソースの
payor から参照されるOrganization リソースとして記録する。保険種別が「1:
医保」、「2:国保」、「7:後期高齢者」の場合は保険者を意味し、
Organization.identifier 要素に保険者番号を記録する。その他の保険種別の場合
は、identifier 要素は出現しない。費用負担者の名称を可能な範囲で
Organization.name 要素に記録する。"""
* ^meta.versionId = "2"
* ^meta.lastUpdated = "2021-06-04T04:37:18.492+00:00"
* ^meta.source = "#swwpBGGoSij8EiHl"
* ^url = "https://healthdataworks.net/JP-ePrescription/StructureDefinition/Organization"
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
* identifier ^slicing.discriminator.type = #value
* identifier ^slicing.discriminator.path = "system"
* identifier ^slicing.rules = #open
* identifier contains
    1 ..1 MS and
    2 ..1 MS
* identifier[1] ^short = "保険種別が「1：医保」、「2：国保」、「7：後期高齢者」の場合は、保険者番号を記録する。それ以外の場合は、本要素は出現しない。"
* identifier[=].system 1.. MS
* identifier[=].system = "urn:oid:1.2.392.100495.20.3.61" (exactly)
* identifier[=].system ^short = "保険者番号の名前空間を示すURI を指定。"
* identifier[=].value 1.. MS
* identifier[=].value ^short = "保険者番号。"
* identifier[=].value ^example.label = "Example for string"
* identifier[=].value ^example.valueString = "06123456"
* identifier[+] ^short = "保険種別が「8：公費」の場合は、公費負担者番号を記録する。それ以外の場合は、本要素は出現しない。"
* identifier[=].system 1.. MS
* identifier[=].system = "urn:oid:1.2.392.100495.20.3.71" (exactly)
* identifier[=].system ^short = "公費負担者番号の名前空間を示すURI。"
* identifier[=].value 1.. MS
* identifier[=].value ^short = "公費負担者番号。"
* identifier[=].value ^example.label = "Example for string"
* identifier[=].value ^example.valueString = "01234567"
* type 1..1 MS
* type ^short = "施設種別コード。"
* type.coding 1..1 MS
* type.coding.system 1.. MS
* type.coding.system = "http://terminology.hl7.org/CodeSystem/organization-type" (exactly)
* type.coding.system ^short = "施設種別コードのコード体系を識別するURI。"
* type.coding.code 1.. MS
* type.coding.code ^short = "費用負担者が保険者の場合は”ins”。それ以外の場合は、その他を意味する “other”を指定"
* type.coding.code ^example.label = "Example for code"
* type.coding.code ^example.valueCode = #ins
* name MS
* name ^short = "費用負担者の名称。"
* name ^example.label = "Example for string"
* name ^example.valueString = "サンプル保険組合"