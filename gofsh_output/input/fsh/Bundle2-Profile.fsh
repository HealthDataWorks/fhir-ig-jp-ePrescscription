Profile: Bundle2
Parent: Bundle
Id: jp-ePrescription-Bundle2
Title: "Bundleリソース　文書情報（処方箋・分割処方）"
Description: "分割処方箋を表すBundle リソースの構造を示す。"
* ^meta.versionId = "3"
* ^meta.lastUpdated = "2021-06-04T06:49:12.039+00:00"
* ^meta.source = "#bTYaBvmB82ZgVxil"
* ^url = "https://healthdataworks.net/JP-ePrescription/StructureDefinition/Bundle2"
* . ^short = "Bundle リソースであることを示す"
* meta 1.. MS
* meta.profile 1..1 MS
* meta.profile ^short = "本文書のプロファイルを識別するURLを指定する。値は例示である。今後決定されるURLを指定すること。"
* meta.profile ^example.label = "Example for canonical"
* meta.profile ^example.valueString = "http://jpfhir.jp/fhir/ePrescription/StructureDefinition/ePrescription-Bundle/1.0"
* type = #document (exactly)
* type MS
* type ^short = "Bundle リソースがDocumentタイプであることを示す"
* timestamp 1.. MS
* timestamp ^short = "このリソースを生成した日時。時刻の精度はミリ秒とし、タイムゾーンを含めること。"
* timestamp ^example.label = "Example for instant"
* timestamp ^example.valueInstant = "2021-02-01T13:28:17.239+09:00"
* entry only BackboneElement
* entry MS
* entry ^slicing.discriminator.type = #profile
* entry ^slicing.discriminator.path = "resource"
* entry ^slicing.rules = #open
* entry contains
    1 1..1 MS and
    2 1..3 MS and
    3 1..1 MS and
    4 1..1 MS and
    5 ..1 MS and
    6 1..1 MS and
    7 1..1 MS
* entry[1] ^short = "Bundle に含まれる全リソースエントリのリスト。"
* entry[=].fullUrl 1.. MS
* entry[=].fullUrl ^short = "エントリリスト内のリソースを一意に識別するためのUUID。"
* entry[=].fullUrl ^example.label = "Example for uri"
* entry[=].fullUrl ^example.valueUri = "urn:uuid:180f219f-97a8-486d-99d9-ed631fe4fc57"
* entry[=].resource 1.. MS
* entry[=].resource only Composition2
* entry[=].resource ^short = "構成リソース一覧目次に相当。Composition リソース"
* entry[+] ^short = "分割処方箋に含まれる１つの処方箋に対応するBundle エントリ。処方箋の数だけ繰り返す。分割処方箋は最大3 分割処方まで認められている。"
* entry[=].fullUrl 1.. MS
* entry[=].fullUrl ^short = "エントリリスト内のリソースを一意に識別するためのUUID。"
* entry[=].fullUrl ^example.label = "Example for uri"
* entry[=].fullUrl ^example.valueUri = "urn:uuid:9495ef34-a77d-4f3e-8dce-5688e169d0fa"
* entry[=].resource 1.. MS
* entry[=].resource only Bundlle_DocumentContents
* entry[=].resource ^short = "１つの処方箋箋を表すBundle リソース。"
* entry[+] ^short = "患者情報エントリ"
* entry[=].fullUrl 1.. MS
* entry[=].fullUrl ^short = "エントリリスト内のリソースを一意に識別するためのUUID。"
* entry[=].fullUrl ^example.label = "Example for uri"
* entry[=].fullUrl ^example.valueUri = "urn:uuid:11f0a9a6-a91d-3aeffc4e-069995b89c4f"
* entry[=].resource 1.. MS
* entry[=].resource only PatientResource
* entry[=].resource ^short = "患者情報（4.4）Patient リソース"
* entry[+] ^short = "処方医療機関情報エントリ"
* entry[=].fullUrl 1.. MS
* entry[=].fullUrl ^short = "エントリリスト内のリソースを一意に識別するためのUUID。"
* entry[=].fullUrl ^example.label = "Example for uri"
* entry[=].fullUrl ^example.valueUri = "urn:uuid:ef7892cc-fb3a-b951-9ac7-f8cd6c746f0a"
* entry[=].resource 1.. MS
* entry[=].resource only Organization2
* entry[=].resource ^short = "処方医療機関情報（4.7.1）Organization リソース"
* entry[+] ^short = "診療科情報エントリ"
* entry[=].fullUrl 1.. MS
* entry[=].fullUrl ^short = "エントリリスト内のリソースを一意に識別するためのUUID。"
* entry[=].fullUrl ^example.label = "Example for uri"
* entry[=].fullUrl ^example.valueUri = "urn:uuid:7f60d206-66c5-4998-931e-86bf2b2d0bdc"
* entry[=].resource 1.. MS
* entry[=].resource only Organization3
* entry[=].resource ^short = "診療科情報（4.7.2）Organization リソース"
* entry[+] ^short = "処方医役割情報エントリ"
* entry[=].fullUrl 1.. MS
* entry[=].fullUrl ^short = "エントリリスト内のリソースを一意に識別するためのUUID。"
* entry[=].fullUrl ^example.label = "Example for uri"
* entry[=].fullUrl ^example.valueUri = "urn:uuid:7f60d206-66c5-4998-931e-86bf2b2d0bdc"
* entry[=].resource 1.. MS
* entry[=].resource only PractitionerRole
* entry[=].resource ^short = "処方医役割情報（4.8.1）PractitionerRole リソース"
* entry[+] ^short = "処方医師情報エントリ"
* entry[=].fullUrl 1.. MS
* entry[=].fullUrl ^short = "エントリリスト内のリソースを一意に識別するためのUUID。"
* entry[=].fullUrl ^example.label = "Example for uri"
* entry[=].fullUrl ^example.valueUri = "urn:uuid:195a292d-169a-5cc4-0e10-7a1c0d3fcb2b"
* entry[=].resource 1.. MS
* entry[=].resource only Practitioner
* entry[=].resource ^short = "処方医師情報（4.8.2）Practitioner リソース"
* signature 1.. MS
* signature ^short = "分割処方箋全体に対する署名情報"
* signature.type ..1 MS
* signature.type ^short = "バリューセット SignatureTypeCodes（http://hl7.org/fhir/ValueSet/signaturetype）から、文書の作成者の署名であることを意味する“1.2.840.10065.1.12.1.1” を指定。"
* signature.type.system 1.. MS
* signature.type.system = "urn:iso-astm:E1762-95:2013" (exactly)
* signature.type.code 1.. MS
* signature.type.code = #1.2.840.10065.1.12.1.1 (exactly)
* signature.when MS
* signature.when ^short = "署名が生成された時刻。精度はミリ秒とし、タイムゾーンを含めること。"
* signature.when ^example.label = "Example for instant"
* signature.when ^example.valueInstant = "2021-08-21T12:28:18.345+09:00"
* signature.who MS
* signature.who ^short = "署名者の処方医を表すPractitionerリソースへの参照。"
* signature.who.reference 1.. MS
* signature.who.reference ^short = "PractitionerリソースのfullUrl要素に指定されたUUID を指定。"
* signature.who.reference ^example.label = "Example for string"
* signature.who.reference ^example.valueString = "urn:uuid:195a292d-169a-5cc4-0e10-7a1c0d3fcb2b"
* signature.data 1.. MS
* signature.data ^short = "署名データ。"