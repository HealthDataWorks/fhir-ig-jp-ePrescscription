Profile: Bundlle_DocumentContents
Parent: Bundle
Id: jp-ePrescription-Bundle
Title: "Bundleリソース　文書情報（処方箋・分割処方でないもの）"
Description: """電子処方箋Documentの基本構造を示す。

document タイプのBundle リソースでは、管理的な情
報を格納する要素としてtimestamp、 signature などがあり、文書自体の内容
情報を格納する要素として、ひとつのentry 要素（エントリリスト）がある。
このentry 要素の値には、複数のresource 要素を含むブロックが繰り返され
る。"""
* ^meta.versionId = "3"
* ^meta.lastUpdated = "2021-06-04T08:37:28.920+00:00"
* ^meta.source = "#E0DyvjOHUq3CQsnX"
* ^url = "https://healthdataworks.net/JP-ePrescription/StructureDefinition/Bundle_DocumentContents"
* . ^short = "Bundle リソースであることを示す"
* meta 1.. MS
* meta.profile 1..1 MS
* meta.profile ^short = "本文書のプロファイルを識別するURL を指定する。"
* meta.profile ^example.label = "Example for canonical"
* meta.profile ^example.valueString = "http://jpfhir.jp/fhir/ePrescription/StructureDefinition/ePrescription-Bundle/1.0"
* type = #document (exactly)
* type MS
* type ^short = "Bundle リソースがDocument タイプであることを示す"
* timestamp 1.. MS
* timestamp ^short = "このリソースを生成した日時。時刻の精度はミリ秒とし、タイムゾーンを含めること。"
* timestamp ^example.label = "Example for instant"
* timestamp ^example.valueInstant = "2021-02-01T13:28:17.239+09:00"
* entry MS
* entry ^slicing.discriminator.type = #profile
* entry ^slicing.discriminator.path = "resource"
* entry ^slicing.rules = #open
* entry contains
    1 1..1 MS and
    2 1..1 MS and
    3 1..1 MS and
    4 1..1 MS and
    5 0..* MS and
    6 1.. MS and
    7 1..1 MS and
    8 ..1 MS and
    9 1..1 MS and
    10 1..1 MS and
    11 1.. MS and
    12 0..* MS
* entry[1] ^short = "Bundle に含まれる全リソースエントリのリスト。"
* entry[=].fullUrl 1..1 MS
* entry[=].fullUrl ^short = "エントリリスト内のリソースを一意に識別するためのUUID。"
* entry[=].fullUrl ^example.label = "Example for uri"
* entry[=].fullUrl ^example.valueUri = "urn:uuid:180f219f-97a8-486d-99d9-ed631fe4fc57"
* entry[=].resource 1.. MS
* entry[=].resource only Composition_DocumentContents
* entry[=].resource ^short = "構成リソース一覧目次に相当。Composition リソース"
* entry[+] ^short = "患者情報エントリ"
* entry[=].fullUrl 1.. MS
* entry[=].fullUrl ^short = "エントリリスト内のリソースを一意に識別するためのUUID。"
* entry[=].fullUrl ^example.label = "Example for uri"
* entry[=].fullUrl ^example.valueUri = "urn:uuid:11f0a9a6-a91d-3aeffc4e-069995b89c4f"
* entry[=].resource 1.. MS
* entry[=].resource only PatientResource
* entry[=].resource ^short = "患者情報（4.4）Patient リソース"
* entry[+] ^short = "受診時状況情報エントリ"
* entry[=].fullUrl 1.. MS
* entry[=].fullUrl ^short = "エントリリスト内のリソースを一意に識別するためのUUID。"
* entry[=].fullUrl ^example.label = "Example for uri"
* entry[=].fullUrl ^example.valueUri = "urn:uuid:12f0a9a6-a91d-8aefd14e-069795b89c9f"
* entry[=].resource 1.. MS
* entry[=].resource only Encounter
* entry[=].resource ^short = "受診時状況情報（4.5）Encounter リソース"
* entry[+] ^short = "保険情報エントリ"
* entry[=].fullUrl 1.. MS
* entry[=].fullUrl ^short = "エントリリスト内のリソースを一意に識別するためのUUID。"
* entry[=].fullUrl ^example.label = "Example for uri"
* entry[=].fullUrl ^example.valueUri = "urn:uuid:38f45298-ea42-9f15-7fb2-82ed899d3ec7"
* entry[=].resource 1.. MS
* entry[=].resource only Coverage
* entry[=].resource ^short = "保険情報（4.6.1）Coverage リソース"
* entry[+] ^short = "公費情報エントリ"
* entry[=].fullUrl 1.. MS
* entry[=].fullUrl ^short = "エントリリスト内のリソースを一意に識別するためのUUID。"
* entry[=].fullUrl ^example.label = "Example for uri"
* entry[=].fullUrl ^example.valueUri = "urn:uuid:48f452a8-ea42-9f15-7fb2-82ed899d3ec8"
* entry[=].resource 1.. MS
* entry[=].resource only Coverage2
* entry[=].resource ^short = "公費情報（4.6.2）Coverage リソース"
* entry[+] ^short = "費用負担者情報エントリ　保険情報エントリ、及び、公費情報エントリに対応した費用負担者情報を記録する。"
* entry[=].fullUrl 1.. MS
* entry[=].fullUrl ^short = "エントリリスト内のリソースを一意に識別するためのUUID。"
* entry[=].fullUrl ^example.label = "Example for uri"
* entry[=].fullUrl ^example.valueUri = "urn:uuid:7c9f9f7f-e546-0ac2-6828-a9e0b24e5750"
* entry[=].resource 1.. MS
* entry[=].resource only Organization
* entry[=].resource ^short = "費用負担者（保険者等）情報（4.6.3）Organization リソース"
* entry[+] ^short = "処方医療機関情報エントリ"
* entry[=].fullUrl 1.. MS
* entry[=].fullUrl ^short = "エントリリスト内のリソースを一意に識別するためのUUID。"
* entry[=].fullUrl ^example.label = "Example for uri"
* entry[=].fullUrl ^example.valueUri = "urn:uuid:179f9f7f-e546-04c2-6888-a9e0b24e5720"
* entry[=].resource 1.. MS
* entry[=].resource only Organization2
* entry[=].resource ^short = "処方医療機関情報（4.7.1）Organization リソース"
* entry[+] ^short = "診療科情報エントリ"
* entry[=].fullUrl 1.. MS
* entry[=].fullUrl ^short = "エントリリスト内のリソースを一意に識別するためのUUID。"
* entry[=].fullUrl ^example.label = "Example for uri"
* entry[=].fullUrl ^example.valueUri = "urn:uuid:92834f52-7e62-1840-5c10-771084179379"
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
* entry[+] ^short = "処方情報エントリ"
* entry[=].fullUrl 1.. MS
* entry[=].fullUrl ^short = "エントリリスト内のリソースを一意に識別するためのUUID。"
* entry[=].fullUrl ^example.label = "Example for uri"
* entry[=].fullUrl ^example.valueUri = "urn:uuid:ef7892cc-fb3a-b951-9ac7-f8cd6c746f0a"
* entry[=].resource 1.. MS
* entry[=].resource only MedicationRequest
* entry[=].resource ^short = "ひとつの医薬品処方に関する指示（4.9）MedicationRequest リソース"
* entry[+] ^short = "備考情報エントリ"
* entry[=].fullUrl 1.. MS
* entry[=].fullUrl ^short = "エントリリスト内のリソースを一意に識別するためのUUID。"
* entry[=].fullUrl ^example.label = "Example for uri"
* entry[=].fullUrl ^example.valueUri = "urn:uuid:cbe31279-302b-f0c7-813b-d221c9171a08"
* entry[=].resource 1.. MS
* entry[=].resource ^short = "備考情報など薬局への指示情報 (5.3、5.4)Communication リソース"
* signature 1.. MS
* signature ^short = "処方箋全体に対する署名情報"
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
* signature.who ^short = "署名者の処方医を表すPractitioner リソースへの参照。"
* signature.who.reference 1.. MS
* signature.who.reference ^short = "Practitioner リソースのfullUrl 要素に指定されたUUID を指定。"
* signature.who.reference ^example.label = "Example for string"
* signature.who.reference ^example.valueString = "urn:uuid:195a292d-169a-5cc4-0e10-7a1c0d3fcb2b"
* signature.data 1.. MS
* signature.data ^short = "署名データ。"