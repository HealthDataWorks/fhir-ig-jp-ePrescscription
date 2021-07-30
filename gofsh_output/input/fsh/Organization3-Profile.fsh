Profile: Organization3
Parent: $Organization
Id: jp-ePrescription-Organization3
Title: "Organizationリソース　処方診療科情報"
Description: """処方診療科情報は、以下のOrganization リソースにより記述し、partOf 要素
から処方医療機関情報を表すOrganization リソースを参照する。処方診療科
情報を出力しない場合には不要である。"""
* ^meta.versionId = "2"
* ^meta.lastUpdated = "2021-06-04T04:38:28.982+00:00"
* ^meta.source = "#xckmfiYoaRFMr3Al"
* ^url = "https://healthdataworks.net/JP-ePrescription/StructureDefinition/Organization3"
* ^status = #active
* . ^short = "Organization リソースであることを示す"
* text MS
* text ^short = "本リソースをテキストで表現したものを入れてもよい。"
* text.status MS
* text.status ^short = "テキスト内容の全てがリソースのコンテンツから生成されたことを示す。"
* text.div MS
* type MS
* type ^slicing.discriminator.type = #value
* type ^slicing.discriminator.path = "type.coding.system"
* type ^slicing.rules = #open
* type contains
    1 1..1 MS and
    2 ..1 MS
* type[1] ^short = "施設種別"
* type[=].coding 1..1 MS
* type[=].coding.system 1.. MS
* type[=].coding.system = "http://terminology.hl7.org/CodeSystem/organization-type" (exactly)
* type[=].coding.system ^short = "施設種別を表すコード体系を識別するURI。"
* type[=].coding.code 1.. MS
* type[=].coding.code = #dept (exactly)
* type[=].coding.code ^short = "バリューセットOrganizationType(http://hl7.org/fhir/ValueSet/organization-type) から、診療科を表すコードを指定。"
* type[+] ^short = "診療科コード。コードで記述できる場合に記録してもよい。利用可能なコード体系の一例として、電子処方箋CDA記述仕様第1 版の別表10 診療科コード（urn:oid:1.2.392.100495.20.2.51）の例を示す。"
* type[=].coding 1..1 MS
* type[=].coding.system 1.. MS
* type[=].coding.system ^short = "診療科コードのコード体系を識別するURI。"
* type[=].coding.system ^example.label = "Example for uri"
* type[=].coding.system ^example.valueUri = "urn:oid:1.2.392.100495.20.2.51"
* type[=].coding.code 1.. MS
* type[=].coding.code ^example.label = "Example for code"
* type[=].coding.code ^example.valueCode = #01
* name 1.. MS
* name ^short = "診療科名称。"
* name ^example.label = "Example for string"
* name ^example.valueString = "内科"
* partOf 1.. MS
* partOf ^short = "処方医療機関を表すOrganization リソースへの参照。"
* partOf.reference 1.. MS
* partOf.reference ^short = "処方医療機関を表すOrganization リソースのfullUrl要素に指定されるUUID を指定。"
* partOf.reference ^example.label = "Example for string"
* partOf.reference ^example.valueString = "urn:uuid:179f9f7f-e546-04c2-6888-a9e0b24e5720"