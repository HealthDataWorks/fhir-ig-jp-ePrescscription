[Previous Page - 電子処方箋FHIR記述の全体構造](structure.html)

以下の事項について、仕様を記述する。

1. 後発品変更可否
2. 後発品変更不可時の電子署名
3. 処方箋備考
4. 残薬確認指示
5. 分割投与指示

### 後発品変更可否
MedicationRequest リソースの substitution 要素に記録する。

substitution.allowedCodeableConcept 要素に、CodeableConcept 型で後発品変更可否コード（urn:oid:1.2.392.100495.2.41）を指定する。もし変更可否の理由を明示したい場合は、"substitution.reason"要素に文字列で指定することができる。後発品変更可否コードの指定は必須とし、変更可の場合であっても必ず「0:変更可」を指定する。

以下にsubstitution の記述例を示す。

```
"substitution": {
"allowedCodeableConcept": {
"coding": [
{
"system": "urn:oid:1.2.392.100495.20.2.41",
"code": "1",
"display": "変更不可"
}
]
},
"reason": {
"text": "患者からの強い要望により"
}
}
```

### 後発品変更不可時の電子署名
後発医薬品の変更不可をする場合は、処方医の署名が必要となる。電子処方箋では電子署名で実現される。

電子署名は、後発医薬品の変更不可としたMedicationRequest リソースごとに、MedicationRequest リソースに対する拡張「Signature」を利用し、Signature 型で署名データを記録する。署名対象データは、後発医薬品への変更不可としたMedicationRequest リソースを表す resource 要素のカノニカルJSON 文字列を署名対象データとし、SHA256 により生成したハッシュ値とする。

記述例を示す。

```
"resource": {
"resourceType": "MedicationRequest",
"text": {
"status": "generated",
"div": "<div xmlns=\"http://www.w3.org/1999/xhtml\"><ul><li>RP:1</li><li>カルボシステイン錠２
５０ｍｇ</li><li>１日３回 朝昼夕食後 １回１錠 ７日分</li><li>後発医薬品変更不可</li></ul></div>"
},
"extension": [
{
"url": "http://jpfhir.jp/fhir/ePrescription/StructureDefinition/Signature",
"valueSignature": {
"type": [
{
"system": "urn:iso-astm:E1762-95:2013",
"code": "1.2.840.10065.1.12.1.1",
"display": "Author's Signature"
}
],
"when": "2021-02-01T13:28:18.345+09:00",
"who": {
"reference": "urn:uuid:195a292d-169a-5cc4-0e10-7a1c0d3fcb2b"
},
"data": "ZjliNmNkOWI4YTFlYWRjZTY1NzMxYzQyOTQ3NTQ3ZjZkMzM1NTljN2Y5NjAwNWFkZWFiZDI5MTlhO
WVmNmI5NQ=="
}
}
],
： （以下略）
```

### 備考情報
「4.1.9.8 調剤補足情報」で示したCommunication リソースを使用して、処方箋全体にかかわる備考を記録する。本リソースは、処方情報セクションに格納する。例とし、以下のような情報を記載することを想定している。

* 限度量を超えた投与を行う理由
* ６歳・高一・高７
* 湿布薬の多量投与を判断した趣旨
* 地域包括診療加算等を算定している旨

Communication リソース、category 要素には、このリソースが処方箋全体の備考を表していることを識別するために、Communication.category 要素に指定するコード（[http://jpfhir.jp/fhir/ePrescription/CodeSystem/CommunicationCategory](http://jpfhir.jp/fhir/ePrescription/CodeSystem/CommunicationCategory)）から「1:処方箋備考」を指定する。

以下に、テキストによる備考のみを含む記述例を示す。

```
"resource": {
"resourceType": "Communication",
"extension": [
{
"url": "http://jpfhir.jp/fhir/ePrescription/StructureDefinition/CommunicationContent",
"extension": [
{
"url": "TextContent",
"valueString": "定期的に肝機能検査実施。特に異常なし。"
}
]
}
],
"category": {
"coding": [
{
"system": "http://jpfhir.jp/fhir/ePrescription/codeSystem/CommunicationCategory",
"code": "1",
"display": "処方箋備考"
}
]
}
}
```

### 残薬確認指示
「4.1.9.8 調剤補足情報」で示したCommunication リソースを使用して、残薬確認指示を記録する。残薬確認指示は、コードとしてCommunication.extension.extensin.valueCodeableCocept 要素にCodeableConcept 型で記録する。コードは、残薬確認指示コード（urn:oid:1.2.392.100495.20.2.42）からのコードを指定する。このリソースが残薬確認指示を表していることを識別するために、Communication.category 要素に指定するコード（[http://jpfhir.jp/fhir/ePrescription/CodeSystem/CommunicationCategory](http://jpfhir.jp/fhir/ePrescription/CodeSystem/CommunicationCategory)）から、「3:残薬確認指示」を指定する。本リソースは、処方情報セクションに格納する。

Communication の記述例を示す。

```
"resource": {
"resourceType": "Communication",
"extension": {
"url": "http://jpfhir.jp/fhir/ePrescription/StructureDefinition/CommunicationContent",
"extension": [
{
"url": "CodedContent",
"valueCodeableConcept": {
"coding": [
{
"system": "urn:oid:1.2.392.100495.20.2.42",
"code": "1",
"display": "疑義照会の上調剤"
}
]
}
}
]
},
"category": {
"coding": [
{
"system": "http://jpfhir.jp/fhir/ePrescription/CodeSystem/CommunicationCategory",
"code": "3",
"display": "残薬確認指示"
}
]
}
}
```


[Next Page - 医師の分割指示に係る処方箋](prescription.html)