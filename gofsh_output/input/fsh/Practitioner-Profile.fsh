Profile: Practitioner
Parent: $Practitioner
Id: jp-ePrescription-Practitioner
Title: "Practitionerリソース　処方医情報"
Description: """処方医はPractitioner リソースとして記述し、PractitionerRole リソース（処
方医役割情報）から参照する。麻薬処方の場合のみ、qualification 要素に
、麻薬施用者免許番号を記録する。"""
* ^meta.versionId = "2"
* ^meta.lastUpdated = "2021-06-04T04:39:37.758+00:00"
* ^meta.source = "#2QlgfkHAQ1avePsF"
* ^url = "https://healthdataworks.net/JP-ePrescription/StructureDefinition/Practitioner"
* ^status = #active
* . ^short = "Practitionerリソースであることを示す"
* text MS
* text ^short = "本リソースをテキストで表現したものを入れてもよい。"
* text.status = #generated (exactly)
* text.status MS
* text.status ^short = "テキスト内容の全てがリソースのコンテンツから生成されたことを示す。"
* text.div MS
* text.div ^example.label = "Example for xhtml"
* text.div ^example.valueString = "<div\r\n                        xmlns=\"http://www.w3.org/1999/xhtml\">xxx</div>"
* name MS
* name ^slicing.discriminator.type = #value
* name ^slicing.discriminator.path = "extension.valueCode"
* name ^slicing.rules = #open
* name contains
    1 1..1 MS and
    2 ..1 MS
* name[1] ^short = "処方医氏名"
* name[=].extension 1..1 MS
* name[=].extension ^short = "氏名が漢字表記かカナ表記かを区別するための拡張「iso21090-EN-representation」。"
* name[=].extension.url = "http://hl7.org/fhir/StructureDefinition/iso21090-EN-representation" (exactly)
* name[=].extension.url MS
* name[=].extension.url ^short = "拡張を識別するURL。"
* name[=].extension.value[x] 1.. MS
* name[=].extension.value[x] only code
* name[=].extension.value[x] = #IDE (exactly)
* name[=].extension.value[x] ^short = "漢字表記であることを表す固定値。"
* name[=].text 1.. MS
* name[=].text ^short = "氏名全体の文字列をtext要素に入れる。氏名の姓と名が分離できない場合は本要素のみを使用する。"
* name[=].text ^example.label = "Example for string"
* name[=].text ^example.valueString = "神奈川花子"
* name[=].family MS
* name[=].family ^short = "氏名の姓。"
* name[=].family ^example.label = "Example for string"
* name[=].family ^example.valueString = "神奈川"
* name[=].given MS
* name[=].given ^short = "氏名の名。ミドルネームがある場合には、ミドルネーム、名の順で繰り返す。"
* name[=].given ^example.label = "Example for string"
* name[=].given ^example.valueString = "花子"
* name[+] ^short = "よみ（カタカナ）"
* name[=].extension 1..1 MS
* name[=].extension ^short = "氏名が漢字表記かカナ表記かを区別するための拡張「iso21090-EN-representation」。"
* name[=].extension.url = "http://hl7.org/fhir/StructureDefinition/iso21090-EN-representation" (exactly)
* name[=].extension.url MS
* name[=].extension.url ^short = "拡張を識別するURL。"
* name[=].extension.value[x] 1.. MS
* name[=].extension.value[x] only code
* name[=].extension.value[x] = #SYL (exactly)
* name[=].text 1.. MS
* name[=].text ^short = "カナ氏名全体の文字列をtext要素に入れる。氏名の姓と名が分離できない場合は本要素のみを使用する。カタカナはJIS X 0208 のカタカナ（全角カナ）のみとし、JIS X 0201 のカタカナ（半角カナ）は使?してはならない。"
* name[=].text ^example.label = "Example for string"
* name[=].text ^example.valueString = "カナガワハナコ"
* name[=].family MS
* name[=].family ^short = "カナ氏名の姓。"
* name[=].family ^example.label = "Example for string"
* name[=].family ^example.valueString = "カナガワ"
* name[=].given MS
* name[=].given ^short = "カナ氏名の姓。"
* name[=].given ^example.label = "Example for string"
* name[=].given ^example.valueString = "カナガワ"
* qualification ..1
* qualification ^short = "麻薬試用者免許番号（麻薬処方のみ）"
* qualification.identifier 1..1 MS
* qualification.identifier.system 1.. MS
* qualification.identifier.system = "urn:oid:1.2.392.100495.20.3.32.13" (exactly)
* qualification.identifier.system ^short = "麻薬施用者番号を識別する名前空間のURI。"
* qualification.identifier.value 1.. MS
* qualification.identifier.value ^short = "麻薬施用者番号。"
* qualification.identifier.value ^example.label = "Example for string"
* qualification.identifier.value ^example.valueString = "4-321"
* qualification.code MS
* qualification.code ^short = "麻薬施用者を表すコード。"
* qualification.code.coding 1..1 MS
* qualification.code.coding.system 1.. MS
* qualification.code.coding.system = "http://jpfhir.jp/fhir/ePrescription/CodeSystem/Certificate" (exactly)
* qualification.code.coding.system ^short = "コード体系 Certificate を識別するURI。"
* qualification.code.coding.code 1.. MS
* qualification.code.coding.code = #NarcoticsPractitioner (exactly)
* qualification.code.coding.code ^short = "麻薬薬施用者を表すコード。"