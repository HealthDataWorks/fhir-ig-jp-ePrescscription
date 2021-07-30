Profile: PatientResource
Parent: Patient
Id: jp-ePrescription-Patient
Title: "Patientリソース　患者情報"
Description: "Patient リソースでは、患者の氏名（漢字等）、性別、生年月日、を必須情報として記述する。"
* ^meta.versionId = "2"
* ^meta.lastUpdated = "2021-06-04T04:39:13.316+00:00"
* ^meta.source = "#KT8vymvoCGJFhwQc"
* ^url = "https://healthdataworks.net/JP-ePrescription/StructureDefinition/Patient"
* . ^short = "Patientリソースであることを示す"
* text MS
* text ^short = "本リソースをテキストで表現したものを入れてもよい。"
* text.status = #generated (exactly)
* text.status MS
* text.status ^short = "テキスト内容の全てがリソースのコンテンツから生成されたことを示す。"
* text.div MS
* text.div ^example.label = "Example for xhtml"
* text.div ^example.valueString = "<div\r\n                        xmlns=\"http://www.w3.org/1999/xhtml\">xxx</div>"
* identifier ..1 MS
* identifier ^short = "医療機関における患者番号。"
* identifier.system 1.. MS
* identifier.system ^short = "付番方法については「7.1識別子名前空間一覧」を参照。"
* identifier.system ^example.label = "Example for uri"
* identifier.system ^example.valueUri = "urn:oid:1.2.392.100495.20.3.51.11311234567"
* identifier.value 1.. MS
* identifier.value ^short = "患者番号の文字列。"
* identifier.value ^example.label = "Example for string"
* identifier.value ^example.valueString = "00000010"
* name ^slicing.discriminator.type = #value
* name ^slicing.discriminator.path = "extention.value[x]"
* name ^slicing.rules = #open
* name contains
    1 1..1 MS and
    2 ..1 MS
* name[1] ^short = "患者氏名　漢字表記"
* name[=].extension 1..1 MS
* name[=].extension ^short = "氏名が漢字表記かカナ表記かを区別するための拡張「iso21090-EN-representation」。"
* name[=].extension.url = "http://hl7.org/fhir/StructureDefinition/iso21090-EN-representation" (exactly)
* name[=].extension.url MS
* name[=].extension.url ^short = "拡張を識別するURL。"
* name[=].extension.value[x] 1.. MS
* name[=].extension.value[x] only code
* name[=].extension.value[x] = #IDE (exactly)
* name[=].extension.value[x] ^short = "漢字表記であることを示す固定値。"
* name[=].use 1.. MS
* name[=].use = #official (exactly)
* name[=].use ^short = "氏名が正式名称であることを明示するために、NameUseバリューセット（http://hl7.org/fhir/ValueSet/name-use）より「official」を必須で設定する。"
* name[=].text 1.. MS
* name[=].text ^short = "氏名全体の文字列をtext要素に入れる。氏名の姓と名が分離できない場合は本要素のみを使用する。姓と名の間には原則として全角空白を1個挿入する。"
* name[=].text ^example.label = "Example for string"
* name[=].text ^example.valueString = "東京　太郎"
* name[=].family MS
* name[=].family ^short = "氏名の姓"
* name[=].family ^example.label = "Example for string"
* name[=].family ^example.valueString = "東京"
* name[=].given MS
* name[=].given ^short = "氏名の名。ミドルネームがある場合には、ミドルネーム、名の順で原則として全角空白をいれて連結する文字列とする。"
* name[=].given ^example.label = "Example for string"
* name[=].given ^example.valueString = "太郎"
* name[+] ^short = "よみ（カタカナ）"
* name[=].extension 1..1 MS
* name[=].extension ^short = "氏名が漢字表記かカナ表記かを区別するための拡張「iso21090-EN-representation」。"
* name[=].extension.url = "http://hl7.org/fhir/StructureDefinition/iso21090-EN-representation" (exactly)
* name[=].extension.url MS
* name[=].extension.url ^short = "拡張を識別するURL。"
* name[=].extension.value[x] 1.. MS
* name[=].extension.value[x] only code
* name[=].extension.value[x] = #SYL (exactly)
* name[=].extension.value[x] ^short = "カナ表記であることを示す固定値。"
* name[=].use 1.. MS
* name[=].use = #official (exactly)
* name[=].use ^short = "氏名が正式名称であることを明示するために、NameUseバリューセット（http://hl7.org/fhir/ValueSet/name-use）より「official」を必須で設定する。"
* name[=].text 1.. MS
* name[=].text ^short = "カナ氏名全体の文字列をtext要素に入れる。氏名の姓と名が分離できない場合は本要素のみを使用する。カタカナはJIS X 0208 のカタカナ（全角カナ）みとし、JIS X 0201 のカタカナ（半角カナ）は使用してはならない。姓と名の間には原則として全角空白を1個挿入する。"
* name[=].text ^example.label = "Example for string"
* name[=].text ^example.valueString = "トウキョウタロウ"
* name[=].family 1.. MS
* name[=].family ^short = "カナ氏名の姓。"
* name[=].family ^example.label = "Example for string"
* name[=].family ^example.valueString = "トウキョウ"
* name[=].given 1..1 MS
* name[=].given ^short = "カナ氏名の名。ミミドルネームがある場合には、ミドルネーム、名の順で原則として全角空白をいれて連結する文字列とする。"
* name[=].given ^example.label = "Example for string"
* name[=].given ^example.valueString = "タロウ"
* gender 1.. MS
* gender ^short = "患者の性別。\"male\"または\"female\"。"
* gender ^example.label = "Example for code"
* gender ^example.valueCode = #male
* birthDate 1.. MS
* birthDate ^short = "患者の生年月日。ISO8601 に準拠して\"yyyy-mm-dd\"形式。"
* birthDate ^example.label = "Example for date"
* birthDate ^example.valueDate = "1920-02-11"
* address ..1 MS
* address ^short = "患者の住所。麻薬処方箋のとき必須。"
* address.text 1.. MS
* address.text ^short = "住所文字列。郵便番号は含めない。"
* address.text ^example.label = "Example for string"
* address.text ^example.valueString = "神奈川県横浜市港区１−２−３"
* address.postalCode 1.. MS
* address.postalCode ^short = "郵便番号。"
* address.postalCode ^example.label = "Example for string"
* address.postalCode ^example.valueString = "123-4567"
* address.country 1.. MS
* address.country ^short = "居住地が国内の場合「JP」固定。"
* address.country ^example.label = "Example for string"
* address.country ^example.valueString = "JP"