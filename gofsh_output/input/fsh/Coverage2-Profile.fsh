Profile: Coverage2
Parent: $Coverage
Id: jp-ePrescription-Coverage2
Title: "Coverageリソース　公費情報"
Description: "公費医療をうける場合のみ必要。複数の公費の場合には、その数だけCoverage リソースを繰り返す。公費医療でない場合には記述は不要。"
* ^meta.versionId = "2"
* ^meta.lastUpdated = "2021-06-04T04:36:13.677+00:00"
* ^meta.source = "#9Nbo2c45mnnsxtkf"
* ^url = "https://healthdataworks.net/JP-ePrescription/StructureDefinition/Coverage2"
* ^status = #active
* . ^short = "Coverage リソースであることを示す"
* text MS
* text ^short = "本リソースをテキストで表現したものを入れてもよい。"
* text.status = #generated (exactly)
* text.status MS
* text.status ^short = "テキスト内容の全てがリソースのコンテンツから生成されたことを示す。"
* text.div MS
* text.div ^example.label = "Example for xhtml"
* text.div ^example.valueString = "<div\n\r\n                        xmlns=\"http://www.w3.org/1999/xhtml\">xxx</div>"
* status = #active (exactly)
* status MS
* status ^short = "処方箋発行時に真に有効な公費かどうかは意味しない。"
* type 1.. MS
* type ^short = "保険種別コード。"
* type.coding 1..1 MS
* type.coding.system 1.. MS
* type.coding.system = "urn:oid:1.2.392.100495.20.2.61" (exactly)
* type.coding.system ^short = "保険種別コードのコード体系を識別するURI。"
* type.coding.code 1.. MS
* type.coding.code = #8 (exactly)
* type.coding.code ^short = "「8：公費」固定。"
* subscriberId 1.. MS
* subscriberId ^short = "公費受給者番号。"
* subscriberId ^example.label = "Example for string"
* subscriberId ^example.valueString = "12345678"
* beneficiary MS
* beneficiary ^short = "この公費で給付される患者情報（Patientリソース）へのリテラル参照。"
* beneficiary.reference 1.. MS
* beneficiary.reference ^short = "PatientリソースのfullUrl要素に指定されるUUID を指定。"
* beneficiary.reference ^example.label = "Example for string"
* beneficiary.reference ^example.valueString = "urn:uuid:11f0a9a6-a91d-3aef-fc4e-069995b89c4f"
* period MS
* period ^short = "公費受給者証の有効期間。公費受給者証に明示的に記載がある場合、かつ、医療機関がその情報を把握している場合のみ記録する。"
* period.start MS
* period.start ^short = "公費受給者証の有効期間の開始日。資格取得日。ISO8601 に準拠してyyyy-mm-dd 形式で指定する。"
* period.start ^example.label = "Example for dateTime"
* period.start ^example.valueDateTime = "2021-04-01T00:00:00+09:00"
* period.end MS
* period.end ^short = "公費受給者証の有効期間の終了日。資格喪失日。ISO8601 に準拠してyyyy-mm-dd 形式で指定する。"
* period.end ^example.label = "Example for dateTime"
* period.end ^example.valueDateTime = "2021-04-30T00:00:00+09:00"
* payor ..1 MS
* payor ^short = "公費負担者を表すOrganization リソースへの参照。"
* payor.reference 1.. MS
* payor.reference ^short = "Organization リソースのfullUrl要素に指定されるUUID を指定。"
* payor.reference ^example.label = "Example for string"
* payor.reference ^example.valueString = "urn:uuid:7c9f9f7f-e546-0ac2-6828-a9e0b24e5750"
* order 1.. MS
* order ^short = "複数の公費負担情報がある場合の適用順序番号（１，２，３・・・）に相当し、第一公費、第二公費、第三公費、特殊 公費の区分を表す。"
* costToBeneficiary MS
* costToBeneficiary ^short = "公費の自己負担率。記録が可能な場合にのみ記録する。"
* costToBeneficiary.type 1.. MS
* costToBeneficiary.type.coding 1..1 MS
* costToBeneficiary.type.coding.system 1.. MS
* costToBeneficiary.type.coding.system = "http://terminology./CodeSystem/coveragecopay-type" (exactly)
* costToBeneficiary.type.coding.system ^short = "公費における自己負担の種別を識別するコードのコード体系を識別するURI。"
* costToBeneficiary.type.coding.code 1.. MS
* costToBeneficiary.type.coding.code = #copaypct (exactly)
* costToBeneficiary.type.coding.code ^short = "自己負担率を表すコード。"
* costToBeneficiary.type.coding.display MS
* costToBeneficiary.type.coding.display ^short = "コードの表示名。"
* costToBeneficiary.type.coding.display ^example.label = "Example for string"
* costToBeneficiary.type.coding.display ^example.valueString = "負担率"
* costToBeneficiary.value[x] only Quantity
* costToBeneficiary.value[x] MS
* costToBeneficiary.value[x] ^short = "自己負担割合"
* costToBeneficiary.value[x] ^example.label = "Example for Quantity"
* costToBeneficiary.value[x] ^example.valueQuantity.value = "10"
* costToBeneficiary.value[x] ^example.valueQuantity.unit = "%"