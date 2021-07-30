Profile: Composition_DocumentContents
Parent: Composition
Id: jp-ePrescription-Composition
Title: "Compositionリソース　文書構成情報（処方箋・分割処方でないもの）"
Description: """Composition リソースは、電子処方箋FHIR document にentry として格納され
る複数のリソースのうちの最初に出現するもので、この文書全体の構成目次に
相当する情報や、セクションの構成を記述したものである。"""
* ^meta.versionId = "2"
* ^meta.lastUpdated = "2021-06-04T04:35:24.207+00:00"
* ^meta.source = "#or7joFpBhbBouTFu"
* ^url = "https://healthdataworks.net/JP-ePrescription/StructureDefinition/Composition_DocumentContents"
* ^status = #active
* . ^short = "Composition リソースであることを示す"
* text MS
* text ^short = "本リソースをテキストで表現したものを入れてもよい。内容を省略しても構わない。 このデータは人がこのリソースの内容の概略をひと目で把握するためだけに使われるものであり、データ処理対象としてはならない。 この内容と以降の構造化されたデータとの内容が不一致の場合には、この要素の内容は無視される。（本文書のすべてのリソースで同様とする）"
* text.status = #generated (exactly)
* text.status MS
* text.status ^short = "テキスト内容の全てがリソースのコンテンツから生成されたことを示す。"
* text.div ^example.label = "Example for xhtml"
* text.div ^example.valueString = "<div\r\n                        xmlns=\"http://www.w3.org/1999/xhtml\">xxx</div>"
* extension 1..1 MS
* extension only Extension
* extension ^short = "処方箋の文書バージョンを表す拡張「composition-clinicaldocumentversionNumber」。"
* extension.url = "http://hl7.org/fhir/StructureDefinition/composition-clinicaldocument-versionNumber" (exactly)
* extension.url MS
* extension.value[x] 1.. MS
* extension.value[x] only string
* extension.value[x] ^short = "文書のバージョン番号を表す文字列。"
* extension.value[x] ^example.label = "Example for string"
* extension.value[x] ^example.valueString = "1.0"
* identifier 1.. MS
* identifier ^short = "このリソースの識別ID。処方箋番号（処方箋ID）に相当する。"
* identifier.system 1.. MS
* identifier.system = "固定値" (exactly)
* identifier.system ^short = "処方箋番号の名前空間を表すURI。"
* identifier.value 1.. MS
* identifier.value ^short = "処方箋番号。値は例示。付番方法は本文を参照。"
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
* type.coding.display = "処方箋" (exactly)
* type.coding.display MS
* type.coding.display ^short = "文書区分コードの表示名。"
* category MS
* category ^short = "麻薬処方と一般処方とを区別する処方箋区分コード。"
* category.coding 1..1 MS
* category.coding.system 1.. MS
* category.coding.system = "http://jpfhir.jp/fhir/ePrescription/CodeSystem/PrescriptionCategory" (exactly)
* category.coding.system ^short = "処方箋区分コードのコード体系を識別するURI。"
* category.coding.code 1.. MS
* category.coding.code ^short = "処方箋区分コード。”01：処方箋”、”02：麻薬処方箋”。"
* category.coding.code ^example.label = "Example for code"
* category.coding.code ^example.valueCode = #02
* category.coding.display MS
* category.coding.display ^short = "コードの表示名。"
* category.coding.display ^example.label = "Example for string"
* category.coding.display ^example.valueString = "麻薬処方箋"
* subject 1.. MS
* subject ^short = "患者情報を表すPatientリソースへの参照。"
* subject.reference 1.. MS
* subject.reference ^short = "PatientリソースのfullUrl要素に指定されるUUID を指定。"
* subject.reference ^example.label = "Example for string"
* subject.reference ^example.valueString = "urn:uuid:11f0a9a6-a91d-3aef-fc4e-069995b89c4f"
* encounter MS
* encounter ^short = "処方箋が出された受診時状況情報を表すEncounterリソースへの参照。"
* encounter.reference 1.. MS
* encounter.reference ^short = "EncounterリソースのfullUrl要素に指定されるUUIDを指定。"
* encounter.reference ^example.label = "Example for string"
* encounter.reference ^example.valueString = "urn:uuid:12f0a9a6-a91d-8aef-d14e-069795b89c9f"
* date MS
* date ^short = "このリソースを作成または最後に編集した日時。ISO8601 に準拠し、秒の精度まで記録し、タイムゾーンも付記する。午前0 時を”24:00”と記録することはできないため”00:00”と記録すること。2020-08-21T12:28:21+09:00"
* author ..1 MS
* author ^short = "処方医を表すPractitionerRole リソースへの参照。"
* author.reference 1.. MS
* author.reference ^short = "PractitionerRole リソースのfullUrl要素に指定されるUUIDを指定。"
* author.reference ^example.label = "Example for string"
* author.reference ^example.valueString = "urn:uuid:7f60d206-66c5-4998-931e-86bf2b2d0bdc"
* title = "処方箋" (exactly)
* title MS
* title ^short = "この文書の（人が読める）タイトル。"
* custodian only Reference
* custodian MS
* custodian ^short = "処方箋の作成・修正を行い、処方箋の管理責任を持つ医療機関（Organization リソース）への参照。処方医療機関と同一の組織の場合、custodian要素からは処方医療機関を表すOrganization リソースへの参照となる。処方医療機関とは異なる組織である場合は、処方医療機関とは別のOrganization リソースで表現し、custodian要素からはそのOrganization リソースを参照する。処方医療機関と同一の場合は、本要素を省略してもよい。"
* custodian.reference 1.. MS
* custodian.reference ^short = "custodianに対応するOrganization リソースのfullUrl要素に指定されるUUID を指定。"
* custodian.reference ^example.label = "Example for string"
* custodian.reference ^example.valueString = "urn:uuid:179f9f7f-e546-04c2-6888-a9e0b24e5720"
* event 1..1 MS
* event ^short = "処方箋としての交付日とその有効期限。"
* event.code 1..1 MS
* event.code.text 1.. MS
* event.code.text = "処方箋交付" (exactly)
* event.period 1.. MS
* event.period.start 1.. MS
* event.period.start ^short = "処方箋箋交付日。ISO8601 に準拠yyyy-mm-dd形式で記述する。2020-08-21"
* event.period.end MS
* event.period.end ^short = "処方箋の有効期限。省略された場合は、法律で定められた処方箋の有効期限と解釈する。2020-08-24"
* section 1..1 MS
* section ^short = "処方情報セクション。処方箋に含まれる処方情報に関連するリソースが全て本セクションに含まれる。"
* section.title 1.. MS
* section.title = "処方情報" (exactly)
* section.title ^short = "セクションタイトル。"
* section.code 1.. MS
* section.code.coding 1..1 MS
* section.code.coding.system 1.. MS
* section.code.coding.system = "http://jpfhir.jp/fhir/ePrescription/CodeSystem/PrescriptionSection" (exactly)
* section.code.coding.system ^short = "セクション区分コードのコード体系を識別するURI。"
* section.code.coding.code 1.. MS
* section.code.coding.code = #01 (exactly)
* section.code.coding.code ^short = "処方情報セクションを表すセクション区分のコード値。"
* section.code.coding.display = "処方情報セクション" (exactly)
* section.code.coding.display MS
* section.code.coding.display ^short = "セクション区分コードの表示名。"
* section.text MS
* section.text ^short = "セクションの内容を表す文字列列。"
* section.text.status = #generated (exactly)
* section.text.status MS
* section.text.div MS
* section.text.div ^short = "本セクションの内容をテキストで表現した文字列を入れてもよい。内容を省略しても構わない。 このデータは人がこのセクションの内容の概略をひと目で把握するためだけに使われるものであり、データ処理対象としてはならない。"
* section.entry 1.. MS
* section.entry ^short = "処方情報セクションに含まれるリソースの参照。処方指示を表すMedicationRequestリソース、及び、それに付随するCommunicationリソース。保険・公費情報を表すCoverageリソースが含まれる。"
* section.entry.reference 1.. MS
* section.entry.reference ^short = "参照先のリソースのfullUrl要素に指定されるUUID。"
* section.entry.reference ^example.label = "Example for string"
* section.entry.reference ^example.valueString = "urn:uuid:ef7892cc-fb3ab951-9ac7-f8cd6c746f0a"