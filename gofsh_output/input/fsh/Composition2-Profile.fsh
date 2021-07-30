Profile: Composition2
Parent: Composition
Id: jp-ePrescription-Composition2
Title: "Compositionリソース　文書構成情報（分割処方箋）"
Description: """分割処方箋に対応するBundle リソースの最初のentry となる
Composition リソースの構造を示す。"""
* ^meta.versionId = "2"
* ^meta.lastUpdated = "2021-06-04T04:35:06.110+00:00"
* ^meta.source = "#L9rwq7guodENcY9U"
* ^url = "https://healthdataworks.net/JP-ePrescription/StructureDefinition/Composition2"
* ^status = #active
* . ^short = "Composition リソースであることを示す"
* text MS
* text ^short = "本リソースをテキストで表現したものを入れてもよい。内容を省略しても構わない。このデータは人がこのリソースの内容の概略をひと目で把握するためだけに使われるものであり、データ処理対象としてはならない。 この内容と以降の構造化されたデータとの内容が不一致の場合には、この要素の内容は無視される。（本文書のすべてのリソースで同様とする）"
* text.status = #generated (exactly)
* text.status MS
* text.status ^short = "テキスト内容の全てがリソースのコンテンツから生成されたことを示す。"
* text.div MS
* text.div ^example.label = "Example for xhtml"
* text.div ^example.valueString = "<div\r\n                        xmlns=\"http://www.w3.org/1999/xhtml\">xxx</div>"
* extension 1..1 MS
* extension only Extension
* extension ^short = "処方箋の文書バージョンを表す拡張「composition-clinicaldocumentversionNumber」。"
* extension.url = "http://hl7.org/fhir/StructureDefinition/composition-clinicaldocument-versionNumber" (exactly)
* extension.url MS
* extension.url ^short = "拡張を識別するURL。"
* extension.value[x] only string
* extension.value[x] MS
* extension.value[x] ^short = "文書のバージョン番号を表す文字列。"
* extension.value[x] ^example.label = "Example for string"
* extension.value[x] ^example.valueString = "1.0"
* identifier 1.. MS
* identifier ^short = "このリソースの識別ID。処方箋番号（処方箋ID）に相当する。"
* identifier.system 1.. MS
* identifier.system = "urn:oid:1.2.392.100495.20.3.11" (exactly)
* identifier.system ^short = "処方箋番号の名前空間を表すURI。"
* identifier.value 1.. MS
* identifier.value ^short = "処方箋番号。"
* identifier.value ^example.label = "Example for string"
* identifier.value ^example.valueString = "1311234567-2020-00123456"
* status = #final (exactly)
* status MS
* status ^short = "この文書のステータス。医療機関から登録される段階では、\"final\" でなければならない。"
* type MS
* type ^short = "文書区分コード"
* type.coding 1..1 MS
* type.coding.system 1.. MS
* type.coding.system = "urn:oid:1.2.392.100495.20.2.11" (exactly)
* type.coding.system ^short = "文書区分コードのコード体系を識別するURI。"
* type.coding.code 1.. MS
* type.coding.code = #01 (exactly)
* type.coding.code ^short = "処方箋を表す文書区分コード。”01：処方箋”を指定。"
* type.coding.display MS
* type.coding.display ^short = "文書区分コードの表示名。"
* type.coding.display ^example.label = "Example for string"
* type.coding.display ^example.valueString = "処方箋"
* category 1..1 MS
* category ^short = "処方箋区分コード。"
* category.coding 1..1 MS
* category.coding.system 1.. MS
* category.coding.system = "http://jpfhir.jp/fhir/ePrescription/CodeSystem/PrescriptionCategory" (exactly)
* category.coding.system ^short = "処方箋区分コードのコード体系を識別するURL。"
* category.coding.code 1.. MS
* category.coding.code = #03 (exactly)
* category.coding.code ^short = "分割処方箋を意味する処方箋区分コード。"
* category.coding.display MS
* category.coding.display ^short = "コードの表示名。"
* category.coding.display ^example.label = "Example for string"
* category.coding.display ^example.valueString = "分割処方箋"
* subject 1.. MS
* subject ^short = "患者情報を表すPatientリソースへの参照。"
* subject.reference 1.. MS
* subject.reference ^short = "PatientリソースのfullUrl要素に指定されるUUID を指定。"
* subject.reference ^example.label = "Example for string"
* subject.reference ^example.valueString = "urn:uuid:11f0a9a6-a91d-3aef-fc4e-069995b89c4f"
* date MS
* date ^short = "このリソースを作成または最後に編集した日時。ISO8601 に準拠し、秒の精度まで記録し、タイムゾーンも付記する。午前0 時を”24:00”と記録することはできないため”00:00”と記録すること。"
* author ..1 MS
* author ^short = "処方医を表すPractitionerRole リソースへの参照。"
* author.reference 1.. MS
* author.reference ^short = "PractitionerリソースのfullUrl要素に指定されるUUID を指定。"
* author.reference ^example.label = "Example for string"
* author.reference ^example.valueString = "urn:uuid:7f60d206-66c5-4998-931e-86bf2b2d0bdc"
* title = "分割処方箋" (exactly)
* title MS
* title ^short = "この文書の（人が読める）タイトル。"
* custodian MS
* custodian ^short = "処方箋の作成・修正を行い、処方箋の管理責任を持つ医療機関（Organization リソース）への参照。処方医療機関と同一の組織の場合、custodian要素からは処方医療機関を表すOrganization リソースへの参照となる。処方医療機関とは異なる組織である場合は、処方医療機関とは別のOrganization リソースで表現し、custodian要素からはそのOrganization リソースを参照する。処方医療機関と同一の場合は、本要素を省略してもよい。"
* custodian.reference 1.. MS
* custodian.reference ^short = "custodianに対応するOrganization リソースのfullUrl要素に指定されるUUIDを指定。"
* custodian.reference ^example.label = "Example for string"
* custodian.reference ^example.valueString = "urn:uuid:179f9f7f-e546-04c2-6888-a9e0b24e5720"
* event 1..1 MS
* event ^short = "処方箋としての交付日とその有効期限。"
* event.code 1..1 MS
* event.code.text 1.. MS
* event.code.text = "処方箋交付" (exactly)
* event.period 1.. MS
* event.period.start 1.. MS
* event.period.start ^short = "処方箋交付日。ISO8601 に準拠yyyy-mmdd形式で記述する。"
* event.period.end MS
* event.period.end ^short = "処方箋の有効期限。省略された場合は、法律で定められた処方箋の有効期限と解釈する。"
* section MS
* section ^slicing.discriminator.type = #value
* section ^slicing.discriminator.path = "code.coding.code"
* section ^slicing.rules = #open
* section contains
    1 1..1 MS and
    2 1..1 MS
* section[1] ^short = "分割処方箋情報セクション。分割処方箋に含まれる個々の処方箋に対応したBundle リソースが本セクションに含まれる。"
* section[=].title 1.. MS
* section[=].title = "分割処方箋セクション" (exactly)
* section[=].title ^short = "セクションタイトル。"
* section[=].code 1.. MS
* section[=].code.coding 1..1 MS
* section[=].code.coding.system 1.. MS
* section[=].code.coding.system = "urn:oid:1.2.392.100495.20.2.12" (exactly)
* section[=].code.coding.system ^short = "セクション区分コードのコード体系を識別するURI。"
* section[=].code.coding.code 1.. MS
* section[=].code.coding.code = #11 (exactly)
* section[=].code.coding.code ^short = "分割処方箋セクションを表すセクション区分のコード値。"
* section[=].code.coding.display MS
* section[=].code.coding.display ^short = "セクション区分コードの表示名。"
* section[=].code.coding.display ^example.label = "Example for string"
* section[=].code.coding.display ^example.valueString = "分割処方箋セクション"
* section[=].text MS
* section[=].text ^short = "セクションの内容を表す文字列。"
* section[=].text.status = #generated (exactly)
* section[=].text.status MS
* section[=].text.div MS
* section[=].text.div ^short = "本セクションの内容をテキストで表現した文字列を入れてもよい。内容を省略しても構わない。 このデータは人がこのセクションの内容の概略をひと目で把握するためだけに使われるものであり、データ処理対象としてはならない。"
* section[=].entry 1.. MS
* section[=].entry ^short = "分割処方箋に含まれる個々の処方箋に対応するBundle リソースへの参照。"
* section[=].entry.reference 1.. MS
* section[=].entry.reference ^short = "参照先のリソースのfullUrl要素に指定されるUUID。"
* section[=].entry.reference ^example.label = "Example for string"
* section[=].entry.reference ^example.valueString = "urn:uuid:ef7892cc-fb3a-b951-9ac7-f8cd6c746f0a"
* section[+] ^short = "別紙セクション。分割処方箋に含まれる別紙に対応したOrganization リソースが本セクションに含まれる。"
* section[=].title 1.. MS
* section[=].title = "別紙セクション" (exactly)
* section[=].title ^short = "セクションタイトル。"
* section[=].code 1.. MS
* section[=].code.coding 1..1 MS
* section[=].code.coding.system 1.. MS
* section[=].code.coding.system = "urn:oid:1.2.392.100495.20.2.12" (exactly)
* section[=].code.coding.system ^short = "セクション区分コードのコード体系を識別するURI。"
* section[=].code.coding.code 1.. MS
* section[=].code.coding.code = #12 (exactly)
* section[=].code.coding.code ^short = "別紙セクションを表すセクション区分のコード値。"
* section[=].code.coding.display MS
* section[=].code.coding.display ^short = "セクション区分コードの表示名。"
* section[=].code.coding.display ^example.label = "Example for string"
* section[=].code.coding.display ^example.valueString = "別紙セクション"
* section[=].text MS
* section[=].text ^short = "セクションの内容を表す文字列。"
* section[=].text.status 1.. MS
* section[=].text.status = #generated (exactly)
* section[=].text.div MS
* section[=].text.div ^short = "本セクションの内容をテキストで表現した文字列を入れてもよい。内容を省略しても構わない。 このデータは人がこのセクションの内容の概略をひと目で把握するためだけに使われるものであり、データ処理対象としてはならない。"
* section[=].entry 1.. MS
* section[=].entry ^short = "別紙に含まれるに処方医療機関情報に対応するOrganization リソースへの参照。"
* section[=].entry.reference 1.. MS
* section[=].entry.reference ^short = "参照先のリソースのfullUrl要素に指定されるUUID。"
* section[=].entry.reference ^example.label = "Example for string"
* section[=].entry.reference ^example.valueString = "urn:uuid:ef7892cc-fb3a-b951-9ac7-f8cd6c746f0a"