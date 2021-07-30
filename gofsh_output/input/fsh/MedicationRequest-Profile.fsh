Profile: MedicationRequest
Parent: $MedicationRequest
Id: jp-ePrescription-MedicationRequest
Title: "MedicationRequestリソース　処方依頼情報"
Description: """１医薬品ごとに処方指示がひとつのMedicationRequest リソースにより記述
され、医薬品の数だけMedicationRequest リソースが繰り返される。"""
* ^meta.versionId = "2"
* ^meta.lastUpdated = "2021-06-04T04:37:38.868+00:00"
* ^meta.source = "#EBkwIoCSVvmT0NjU"
* ^url = "https://healthdataworks.net/JP-ePrescription/StructureDefinition/MedicationRequest"
* ^status = #active
* . ^short = "MedicationRequestリソースであることを示す"
* text MS
* text ^short = "本リソースをテキストで表現したものを入れてもよい。"
* text.status = #generated (exactly)
* text.status MS
* text.status ^short = "テキスト内容の全てがリソースのコンテンツから生成されたことを示す。"
* text.div MS
* text.div ^example.label = "Example for xhtml"
* text.div ^example.valueString = "<div\r\n                        xmlns=\"http://www.w3.org/1999/xhtml\">xxx</div>"
* extension MS
* extension ^slicing.discriminator.type = #value
* extension ^slicing.discriminator.path = "extension.url"
* extension ^slicing.rules = #open
* extension contains
    1 ..1 MS and
    2 ..1 MS and
    3 ..1 MS
* extension[1] only Extension
* extension[=] ^short = "投与開始日を明示したい場合に使用する拡張「PeriodOfUse」。詳細は「4.9.3.1内服薬」の「４)投与開始日」を参照。"
* extension[=].url = "http://jpfhir.jp/fhir/ePrescription/StructureDefinition/PeriodOfUse" (exactly)
* extension[=].url MS
* extension[=].url ^short = "拡張を識別するURL。"
* extension[=].value[x] only Period
* extension[=].value[x] ^short = "投与期間を表す。処方期間の開始日。"
* extension[+] only Extension
* extension[=] ^short = "隔日投与など、服用開始日から終了日までの日数と実投与日数が異なる場合に、実投与日数を明示したい場合に使用する拡張「UsageDuration」。詳細は「4.9.3.1内服薬」の「３)投与日数」を参照。"
* extension[=].url = "http://jpfhir.jp/fhir/ePrescription/StructureDefinition/UsageDuration" (exactly)
* extension[=].url MS
* extension[=].url ^short = "拡張を識別するためのURL。"
* extension[=].value[x] 1.. MS
* extension[=].value[x] only Duration
* extension[=].value[x] ^short = "実投与日数。単位「日」。単位コード UCUMを識別するURI。単位コードUCUMにおける実投与日数の単位を表すコード。"
* extension[=].value[x] ^example.label = "Example for Duration"
* extension[=].value[x] ^example.valueDuration.value = "7"
* dosageInstruction.timing.repeat ^example.valueDuration.value = "7"
* extension[=].value[x] ^example.valueDuration.unit = "日"
* extension[+] only Extension
* extension[=] ^short = "後発医薬品変更不可に対する電子署名を表す拡張「Signature」。"
* extension[=].url = "http://jpfhir.jp/fhir/ePrescription/StructureDefinition/Signature" (exactly)
* extension[=].url MS
* extension[=].url ^short = "拡張を識別するURL。"
* extension[=].value[x] 1.. MS
* extension[=].value[x] only Signature
* extension[=].value[x] ^short = "電子署名情報"
* identifier MS
* identifier ^slicing.discriminator.type = #value
* identifier ^slicing.discriminator.path = "identifier.system"
* identifier ^slicing.rules = #open
* identifier contains
    1 1..1 MS and
    2 1..1 MS
* identifier[1] ^short = "剤グループ（Rp）番号。詳細は「4.9.2 剤グループ構造とその番号」参照。"
* identifier[=].system 1.. MS
* identifier[=].system = "urn:oid:1.2.392.100495.20.3.81" (exactly)
* identifier[=].system ^short = "剤グループ番号の名前空間を識別するURI。"
* identifier[=].value 1.. MS
* identifier[=].value ^short = "剤グループ番号"
* identifier[=].value ^example.label = "Example for string"
* identifier[=].value ^example.valueString = "1"
* identifier[+] ^short = "剤グループ内連番。詳細は「4.9.2剤グループ構造とその番号」参照。"
* identifier[=].system 1.. MS
* identifier[=].system = "urn:oid:1.2.392.100495.20.3.82" (exactly)
* identifier[=].system ^short = "剤グループ内番号の名前空間を識別するURI。"
* identifier[=].value 1.. MS
* identifier[=].value ^short = "剤グループ内連番。"
* identifier[=].value ^example.label = "Example for string"
* identifier[=].value ^example.valueString = "1"
* status = #active (exactly)
* status MS
* intent = #order (exactly)
* intent MS
* medication[x] only CodeableConcept
* medication[x] MS
* medication[x] ^short = "医薬品コードと医薬品名称。coding要素を繰り返すことでHOT9 やYJコードなど複数のコード体系で医薬品コードを並記することが可能。利用可能なコード体系は表 20 を参照。"
* medication[x] ^example.label = "Example for CodeableConcept"
* medication[x] ^example.valueCodeableConcept = urn:oid:1.2.392.200119.4.403.1#103831601 "カルボシステイン錠２５０ｍｇ"
* subject MS
* subject ^short = "患者を表すPatientリソースへの参照。"
* subject.reference 1.. MS
* subject.reference ^short = "PatientリソースのfullUrl要素に指定されるUUIDを指定。"
* subject.reference ^example.label = "Example for string"
* subject.reference ^example.valueString = "urn:uuid:1af0a9a6-a91d-3aef-fc4e-069995b89c4f"
* authoredOn MS
* authoredOn ^short = "処方指示が最初に作成された日時。秒の精度まで記録する。タイムゾーンも付与しなければならない。"
* authoredOn ^example.label = "Example for dateTime"
* authoredOn ^example.valueDateTime = "2021-04-01T00:00:00+09:00"
* note ..1 MS
* note ^short = "薬剤単位の備考。詳細は「4.9.8.1薬剤単位の指示」"
* note.text MS
* note.text ^short = "備考文字字列。"
* note.text ^example.label = "Example for markdown"
* note.text ^example.valueMarkdown = "4月1日から4日間服用。2週間休薬後、4月19日から4日間服用。患者に書面にて説明済み。"
* dosageInstruction MS
* dosageInstruction ^short = "用法や投与量を含む処方指示。詳細は表 13に記載。"
* dosageInstruction.text 1.. MS
* dosageInstruction.text ^short = "dosageInstructionが表す処方指示の文字列表現。"
* dosageInstruction.additionalInstruction MS
* dosageInstruction.additionalInstruction ^short = "補足的な処方指示。本文書では、不均等投与を1 日用法として記載する場合に、補足用法コードを記録するために使用する。詳細は「4.9.5均等分割用法と不均等用法」参照。"
* dosageInstruction.additionalInstruction.coding 1..1 MS
* dosageInstruction.additionalInstruction.coding ^short = "JAMI 補足用法８桁コードを識別するURI。JAMI 補足用法コード指定する。コードの表示名。"
* dosageInstruction.additionalInstruction.coding ^fixedCoding.system = "urn:oid:1.2.392.200250.2.2.20.22"
* dosageInstruction.additionalInstruction.coding ^example.label = "Example for Coding"
* dosageInstruction.additionalInstruction.coding ^example.valueCoding = #V14NNNNN "不均等・１回目・４錠"
* dosageInstruction.timing 1.. MS
* dosageInstruction.timing ^short = "服用タイミングを記録する。"
* dosageInstruction.timing.event MS
* dosageInstruction.timing.event ^short = "服用タイミングを具体的な日時で指定する場合に使用する。"
* dosageInstruction.timing.event ^example.label = "Example for dateTime"
* dosageInstruction.timing.event ^example.valueDateTime = "2021-04-10T09:00:00+09:00"
* dosageInstruction.timing.repeat only Duration
* dosageInstruction.timing.repeat MS
* dosageInstruction.timing.repeat ^example.label = "Example for Duration"
* dosageInstruction.timing.repeat ^example.valueDuration.unit = "日"
* dosageInstruction.timing.code 1.. MS
* dosageInstruction.timing.code ^short = "用法。JAMI標準用法コードを指定する。詳細は「4.9.3.2 内服薬 １)用法」、及び、「4.9.3.3 外用薬 １)用法」を参照。"
* dosageInstruction.timing.code.coding 1..1 MS
* dosageInstruction.timing.code.coding ^example.label = "Example for Coding"
* dosageInstruction.timing.code.coding ^example.valueCoding = urn:oid:1.2.392.200250.2.2.20.20#1013044400000000 "内服・経口・１⽇３回朝昼夕食後"
* dosageInstruction.asNeeded[x] MS
* dosageInstruction.asNeeded[x] ^short = "頓用型の用法を指定する場合に”true”を指定する。詳細は「4.9.4.2 頓用」を参照。"
* dosageInstruction.site MS
* dosageInstruction.site ^short = "外用薬で部位を指定する場合に使用する。詳細は「4.9.3.3 外用薬 ４)部位」参照。"
* dosageInstruction.site.coding 1..1 MS
* dosageInstruction.site.coding ^example.label = "Example for Coding"
* dosageInstruction.site.coding ^example.valueCoding = urn:oid:1.2.392.200250.2.2.20.32#950 "膝"
* dosageInstruction.site.text MS
* dosageInstruction.site.text ^short = "部位のテキスト表現。"
* dosageInstruction.site.text ^example.label = "Example for string"
* dosageInstruction.site.text ^example.valueString = "膝"
* dosageInstruction.route MS
* dosageInstruction.route ^short = "投与経路"
* dosageInstruction.route.coding 1..1 MS
* dosageInstruction.route.coding ^example.label = "Example for Coding"
* dosageInstruction.route.coding ^example.valueCoding = urn:oid:1.2.392.200250.2.2.20.40#10 "経口"
* dosageInstruction.route.text MS
* dosageInstruction.route.text ^short = "投与経路の文字列表現。コードで指定できない場合、本要素で文字列として指定してもよい。"
* dosageInstruction.route.text ^example.label = "Example for string"
* dosageInstruction.route.text ^example.valueString = "経口"
* dosageInstruction.method MS
* dosageInstruction.method ^short = "投与方法"
* dosageInstruction.method.coding 1..1 MS
* dosageInstruction.method.coding ^example.label = "Example for Coding"
* dosageInstruction.method.coding ^example.valueCoding = urn:oid:1.2.392.200250.2.2.20.30#1 "内服"
* dosageInstruction.method.text MS
* dosageInstruction.method.text ^short = "投与方法のテキスト表現。コードで指定できない場合、本要素で文字列列として指定してもよい。"
* dosageInstruction.method.text ^example.label = "Example for string"
* dosageInstruction.method.text ^example.valueString = "内服"
* dosageInstruction.doseAndRate MS
* dosageInstruction.doseAndRate ^short = "投与量を記録する。記録方法の詳細は、「4.9.3.2 内服薬 ２)用量」参照。"
* dispenseRequest 1.. MS
* dispenseRequest ^short = "調剤情報"
* dispenseRequest.extension MS
* dispenseRequest.extension ^slicing.discriminator.type = #value
* dispenseRequest.extension ^slicing.discriminator.path = "extension.url"
* dispenseRequest.extension ^slicing.rules = #open
* dispenseRequest.extension contains
    1 0..* MS and
    2 ..1 MS
* dispenseRequest.extension[1] ^short = "調剤指示を表す拡張「InstructionForDispense」。"
* dispenseRequest.extension[+] ^short = "頓用回数を表現する拡張「ExpectedRepeatCount」。"
* dispenseRequest.extension[=].url = "http://jpfhir.jp/fhir/ePrescription/StructureDefinition/ExpectedRepeatCount" (exactly)
* dispenseRequest.extension[=].url MS
* dispenseRequest.extension[=].url ^short = "拡張を識別するURL。"
* dispenseRequest.extension[=].value[x] 1..
* dispenseRequest.extension[=].value[x] only integer
* dispenseRequest.extension[=].value[x] ^short = "頓用回数。"
* dispenseRequest.extension[=].value[x] ^example.label = "Example for integer"
* dispenseRequest.extension[=].value[x] ^example.valueInteger = 5
* dispenseRequest.quantity MS
* dispenseRequest.quantity ^short = "調剤量"
* dispenseRequest.quantity.value 1.. MS
* dispenseRequest.quantity.value ^short = "調剤量。"
* dispenseRequest.quantity.value ^example.label = "Example for decimal"
* dispenseRequest.quantity.value ^example.valueDecimal = "21"
* dispenseRequest.quantity.unit 1.. MS
* dispenseRequest.quantity.unit ^short = "単位文字列。"
* dispenseRequest.quantity.unit ^example.label = "Example for string"
* dispenseRequest.quantity.unit ^example.valueString = "錠"
* dispenseRequest.quantity.system 1.. MS
* dispenseRequest.quantity.system = "urn:oid:1.2.392.200119.4.403.1" (exactly)
* dispenseRequest.quantity.system ^short = "医薬品単位略号を識別するURL。"
* dispenseRequest.quantity.code 1.. MS
* dispenseRequest.quantity.code = #TAB (exactly)
* dispenseRequest.quantity.code ^short = "医薬品単位略号。"
* dispenseRequest.expectedSupplyDuration MS
* dispenseRequest.expectedSupplyDuration ^short = "調剤日数"
* dispenseRequest.expectedSupplyDuration.value 1.. MS
* dispenseRequest.expectedSupplyDuration.value ^short = "調剤日数。"
* dispenseRequest.expectedSupplyDuration.value ^example.label = "Example for decimal"
* dispenseRequest.expectedSupplyDuration.value ^example.valueDecimal = "7"
* dispenseRequest.expectedSupplyDuration.unit 1.. MS
* dispenseRequest.expectedSupplyDuration.code = #d (exactly)
* dispenseRequest.expectedSupplyDuration.system = "http://unitsofmeasure.org" (exactly)
* dispenseRequest.expectedSupplyDuration.unit = "日" (exactly)
* dispenseRequest.expectedSupplyDuration.unit ^short = "調剤日数の単位。"
* dispenseRequest.expectedSupplyDuration.system 1.. MS
* dispenseRequest.expectedSupplyDuration.system ^short = "UCUM単位コードを識別するURI。"
* dispenseRequest.expectedSupplyDuration.code 1.. MS
* dispenseRequest.expectedSupplyDuration.code ^short = "「日」を表すUCUM単位コード。"
* substitution MS
* substitution ^short = "後発医薬品への変更可否情報。詳細は「5.1後発品変更可否」参照。"
* substitution.allowed[x] only CodeableConcept
* substitution.allowed[x] MS
* substitution.allowed[x] ^short = "後発品変更不可コード。"
* substitution.allowed[x] ^example.label = "Example for CodeableConcept"
* substitution.allowed[x] ^example.valueCodeableConcept = urn:oid:1.2.392.100495.20.2.41#1 "変更不可"
* substitution.reason MS
* substitution.reason ^short = "後発品変更不可の理由。"
* substitution.reason.text 1.. MS
* substitution.reason.text ^short = "理由を表す文字列。"
* substitution.reason.text ^example.label = "Example for string"
* substitution.reason.text ^example.valueString = "患者からの強い要望により"