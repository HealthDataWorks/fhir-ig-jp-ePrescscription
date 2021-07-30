Profile: Coverage
Parent: $Coverage
Id: jp-ePrescription-Coverage
Title: "Coverageリソース　保険・自費情報"
Description: "自費など保険のない診療における処方であってもこのCoverage リソースは必須とし、適切な保険種別を指定する。"
* ^meta.versionId = "2"
* ^meta.lastUpdated = "2021-06-04T04:35:44.631+00:00"
* ^meta.source = "#nsxpvMWbCwqRpuuV"
* ^url = "https://healthdataworks.net/JP-ePrescription/StructureDefinition/Coverage"
* ^status = #active
* . ^short = "Coverage リソースであることを⽰す"
* text MS
* text ^short = "本リソースをテキストで表現したものを⼊れてもよい。"
* text.status = #generated (exactly)
* text.status MS
* text.status ^short = "テキスト内容の全てがリソースのコンテンツから生成されたことを示す。"
* text.div MS
* text.div ^example.label = "Example for xhtml"
* text.div ^example.valueString = "<div\n\r\n                        xmlns=\"http://www.w3.org/1999/xhtml\">xxx</div>"
* extension MS
* extension ^slicing.discriminator.type = #value
* extension ^slicing.discriminator.path = "extension.url"
* extension ^slicing.rules = #open
* extension contains
    1 ..1 MS and
    InsuredNumber named 2 ..1 MS
* extension[1] ^short = "被保険者証記号を表す拡張「InsuredPersonSymbol」。保険種別が「1：医保」、「2：国保」の場合に記録する。被保険者証記号がない場合は、本拡張要素自体出現しない。"
* extension[=].url = "http://jpfhir.jp/fhir/ePrescription/StructureDefinition/InsuredPersonSymbol" (exactly)
* extension[=].url MS
* extension[=].url ^short = "拡張を識別するURL"
* extension[=].value[x] 1.. MS
* extension[=].value[x] only string
* extension[=].value[x] ^short = "被保険者証記号。記録形式は「オンライン又は光ディスク等による請求に係る記録条件仕様（医科用）」に従う。"
* extension[=].value[x] ^example.label = "Example for string"
* extension[=].value[x] ^example.valueString = "１２３４５"
* extension[+] ^short = "被保険者証番号を表す拡張「InsuredPersonNumber」。保険種別が「1：医保」、「2：国保」、「7：後期高齢者」の場合に記録する。それ以外の場合は、本拡張要素自体出現しない。"
* status = #active (exactly)
* status MS
* status ^short = "処方箋発行時に真に有効な保険かどうかは意味しない。"
* type 1.. MS
* type ^short = "保険種別コード。"
* type.coding 1..1 MS
* type.coding.system 1.. MS
* type.coding.system = "urn:oid:1.2.392.100495.20.2.61" (exactly)
* type.coding.system ^short = "保険種別コード体系を識別するURI。"
* type.coding.code 1.. MS
* type.coding.code ^short = "保険種別コード。"
* type.coding.code ^example.label = "Example for code"
* type.coding.code ^example.valueCode = #1
* beneficiary MS
* beneficiary ^short = "この保険で給付される患者情報（Patient リソース）へのリテラル参照。"
* beneficiary.reference 1.. MS
* beneficiary.reference ^short = "PatientリソースのfullUrl要素に指定されるUUID を指定。"
* beneficiary.reference ^example.label = "Example for string"
* beneficiary.reference ^example.valueString = "urn:uuid:11f0a9a6-a91d-3aef-fc4e-069995b89c4f"
* dependent MS
* dependent ^short = "被保険者証記号・番号に対する個人単位被保険者番号（枝番）。「オンライン又は光ディスク等による請求に係る記録条件仕様（医科用）」に従い、桁数が2 桁に満たない場合は、先頭に\"0\"を記録し2桁で記録する。"
* dependent ^example.label = "Example for string"
* dependent ^example.valueString = "01"
* relationship 1.. MS
* relationship ^short = "給付される患者と被保険者との関係（本人、または被扶養者）。被保険者区分コード表より「1：被保険者」、または、「2：被扶養者」を指定する。"
* relationship.coding 1..1 MS
* relationship.coding.system 1.. MS
* relationship.coding.system = "urn:oid:1.2.392.100495.20.2.62" (exactly)
* relationship.coding.system ^short = "被保険者区分コードのコード体系を識別するURI。"
* relationship.coding.code 1.. MS
* relationship.coding.code ^short = "被保険者区分コード"
* relationship.coding.code ^example.label = "Example for code"
* relationship.coding.code ^example.valueCode = #1
* relationship.coding.display MS
* relationship.coding.display ^example.label = "Example for string"
* relationship.coding.display ^example.valueString = "被保険者"
* period MS
* period ^short = "保険証の有効期間。保険証に明示的に記載がある場合、かつ、医療機関がその情報を把握している場合のみ記録する。"
* period.start MS
* period.start ^short = "保険証の有効期間の開始日。資格取得日。ISO8601 に準拠してyyyy-mm-dd 形式で指定する。"
* period.end MS
* period.end ^short = "保険証の有効期間の終了日。資格喪失日。ISO8601 に準拠してyyyy-mm-dd 形式で指定する。"
* payor ..1 MS
* payor ^short = "費用負担者（医療保険の場合は保険者）情報。保険種別が「6：?費」の場合、患者本人を表すPatientリソースへの参照。それ以外の保険種別は、費用負担者を表すOrganization リソースへの参照。"
* payor.type MS
* costToBeneficiary ..1 MS
* costToBeneficiary ^short = "保険の自己負担率。記録が可能な場合にのみ記録する。"
* costToBeneficiary.type 1.. MS
* costToBeneficiary.type.coding 1..1 MS
* costToBeneficiary.type.coding.system 1.. MS
* costToBeneficiary.type.coding.system = "http://terminology.hl7.org/CodeSystem/coverage-copay-type" (exactly)
* costToBeneficiary.type.coding.system ^short = "保険における自己負担の種別を識別するコードのコード体系を識別するURI。"
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
* costToBeneficiary.value[x] ^example.valueQuantity.value = "30"
* costToBeneficiary.value[x] ^example.valueQuantity.unit = "%"