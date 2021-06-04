[Previous Page - ガイダンス](guidance.html)

### 全体構造
FHIR では、医療情報はFHIR リソースと呼ばれる単位で記述される。処方箋は
文書形式のデータの一種であり、処方箋文書全体に電子署名ができ、またそれ
を利用して改ざん検知及び否認防止ができることが必要であると考えられる。

Bundle リソースは、複数のFHIR リソースの集合を、あるコンテクストに関す
る情報（この場合には、処方箋の交付と取得に関する日付情報や発行者、発行
機関情報など）とともにひとまとまりの情報にまとめあげたものを記述するの
に使われるFHIR リソースであり、以下のような要素から構成される。電子処
方箋管理サーバへ電子処方箋を送信する場合は、このBundle リソースの単位
で行われる。

<table style="border: 0px none">
<tr><td  style="border: 0px none"><img src="figure2.png" width="731" height="565"></td></tr>
<tr><th style="border: 0px none; text-align: center">図2 Bundle リソース（[http://hl7.org/fhir/bundle.html](http://hl7.org/fhir/bundle.html)）</th></tr>
</table>

そして、このBundle リソースのtype 要素（上図左段の2 つめの要素）の値
を"document"とすることにより、Bundle リソースのひとつのタイプである、
FHIR Document を記述できる。

そこで、本文書では、電子処方箋１文書を、FHIR におけるBundle リソース
のひとつのタイプであるFHIR Document により記述することとする。
[http://hl7.org/fhir/documents.html](http://hl7.org/fhir/documents.html)
紙の処方箋を構成する情報との対応を図 3 に示す。

<table style="border: 0px none">
<tr><td  style="border: 0px none"><img src="figure3.png" width="683" height="541"></td></tr>
<tr><th style="border: 0px none; text-align: center">図3 紙の処方箋を構成する情報とFHIR リソースとの対応関係</th></tr>
</table>

以降の章では、電子処方箋を構成するFHIR リソースの記述仕様を、次の項目
に従って共通の表形式で記述する。

||項目|説明|
|---|---|---|
|1|No|表内で要素を識別するための番号。同一階層を同一桁数で表す。|
|2|要素Lv 1～n|FHIR リソースに含まれる要素。要素の階層ごとに列を分けて記載する。|
|3|多重度|要素の出現数の最小値と最大値を表す。最小値が0 の要素は、省略することができる。最小値が1 の要素は必ず出現しなければならない。|
|4|値|固定値、あるいは、例示された値。|
|5|型|要素のデータ型。|
|6|説明|要素の説明と記録条件仕様。|

電子処方箋データは、FHIR JSON 形式表現 (RFC 8259)で記述する。使用する符
号化文字集合は Unicode であり、UTF-8 文字符号化方式を使用する。BOM
（Byte Order Mark）は使用してはならない。

本文書は、FHIR 基底仕様で定義されたリソース、及び、データ型の定義に対
して、電子処方箋仕様のための制約を追加している。そのため、要素の多重度
や使用可能なコード値について、FHIR 基底仕様に、より強い制約が加えられ
ていることに注意する。

また、表中では、繰り返し可能なJSON 要素を、多重度 0..* 、または、1..* とし
て1 行で記述する方法（例: 表１ No.15 Bundle.entry 要素）と、繰り返しの
要素ごとに展開して記述する方法（例：表１ No.6 Bundle.entry 要素）の2 通
りの書き方を使用している。いずれの場合も、繰り返される要素は、JSON イ
ンスタンス中では [ ] で括られた配列として表現され、要素名は1 つしか出
現しないことに注意する。

本文書で必須とした項目は、処方箋の記載内容として法的に必要となる項目で
あるため必ず指定すること。逆に、FHIR リソースで定義されている任意要素
で、本文書に記載していない要素は、JSON インスタンス中に出現してはなら
ない。

なお、本文書の表で出現するデータ型のうち、基本データ型については、7 章
で説明している。

### FHIR Document
FHIR Document の仕様では、entry 要素内（上図右段の先頭の要素）に
resource 要素を繰り返す基本構造をとり、最初のresource 要素は
Composition リソースであることと規定されている。Composition リソースと
は、この文書に含まれる他のすべてのリソース（情報単位）への参照を列挙す
るためのもので、いわば構成リソースの一覧目次のような役割を果たす。

電子処方箋Document では、＜表1＞のような基本構造とする。

＜[表1](https://trifolia-fhir.lantanagroup.com/igs/lantana_hapi_r4/jp-electronic-prescription/StructureDefinition-Bundle.html)＞

この表で示すように、document タイプのBundle リソースでは、管理的な情
報を格納する要素としてtimestamp、 signature などがあり、文書自体の内容
情報を格納する要素として、ひとつのentry 要素（エントリリスト）がある。
このentry 要素の値には、複数のresource 要素を含むブロックが繰り返され
る。

entry の最初のresource は、先に述べたように、構成リソース一覧目次を表す
Composition リソースである。

２つめのリソース以降に、Composition リソースから参照される Patient リソ
ース、受診時状況情報を表すEncounter リソース、保険情報などを表す複数個
のCoverage リソース、及び、保険者を表すOrganization リソース、処方医療
機関情報、及び、診療科を含むOrganization リソース、処方医の役割を表現
するPractitionerRole リソース、および、処方医師情報を含むPractitioner リ
ソースが出現する。

その後に、１医薬品処方指示がひとつのMedicationRequest リソースで記述
され、それが医薬品の数だけ繰り返し出現する。

最後に処方箋の備考欄や薬局への指示情報などがCommunication リソースに
より記述される。

エントリリスト内の各FHIR リソースを記述する際には、エントリリスト内で
そのリソースを一意に識別するために、resource 要素と1 対1 で対応する
fullUrl 要素に、UUID（Universally Unique IDentifier）と呼ばれる、全世界で
一意となるように発番された値を指定する1。このUUID は、Bundle 内でリソ
ース間の参照関係を記述する場合に使用される。具体的には、参照関係の参照
元リソースに含まれる Reference 型のreference 要素に、参照先リソースの
fullUrl 要素に指定されたUUID を指定する。

図 4 の例では、エントリリストに含まれるComposition リソースの
subject.reference 要素から、エントリリストに含まれるPatient リソース
を参照するために、Patient リソースの fullUrl 要素に指定されたUUID が使
用されていることが確認できる。

なお、FHIR のリソース参照では、リソースのid 要素（論理ID）の値を含む
URL を使用する方法も可能であるが、本文書ではUUID を使用してリソース間
の参照を記述する方法を採用するため、全てのリソースについて、リソースの
論理ID は使用しない。

<table style="border: 0px none">
<tr><td  style="border: 0px none"><img src="figure4.png" width="749" height="768"></td></tr>
<tr><th style="border: 0px none; text-align: center">図4 fullUrl（UUID）を利用したリソース参照</th></tr>
</table>

Bundle リソース、及び、エントリリスト内に含まれる各リソースの参照関係
を図 5 に示す。

<table style="border: 0px none">
<tr><td  style="border: 0px none"><img src="figure5.png" width="765" height="761"></td></tr>
<tr><th style="border: 0px none; text-align: center">図5 電子処方箋の全体構造の概要</th></tr>
</table>

以下では、まずentry の値である各リソースについて詳述する。

### Composition リソース
Composition リソースは、電子処方箋FHIR document にentry として格納され
る複数のリソースのうちの最初に出現するもので、この文書全体の構成目次に
相当する情報や、セクションの構成を記述したものである。

電子処方箋は、処方箋情報セクションと呼ばれるただ１つのセクションから構
成される。

＜[表2](https://trifolia-fhir.lantanagroup.com/igs/lantana_hapi_r4/jp-electronic-prescription/StructureDefinition-Composition.html)＞

Component.identifier 要素には、発行された電子処方箋を一意に識別する
ID（処方箋番号）を設定する。処方箋ID の採番ルールは本文書のスコープ外
であるが、案としては次のような方法が考えられる。

* すべての医療機関で横断的に一意になる処方箋ID の発番ルールが決定され
ている場合には、それに基づいて発番されたID を使用する。Identifier 型
のsystem 要素に、処方箋ID の名前空間を表すOID（表18. 識別子名前空間
一覧を参照）を指定。

* Identifier 型のvalue 要素に、保険医療機関番号（10 桁）、発行年（4
桁）、施設内において発行年内で一意となる番号（8 桁）をハイフン(“-“：
U+002D)で連結した文字列を指定する。例：”1311234567-2020-
00123456”。本仕様では当面これを採用する。Identifier 型のsystem 要素
に、保険医療機関番号を含む処方箋ID の名前空間を表すOID（表18. 識別
子名前空間一覧を参照）を指定。

### 患者情報
Patient リソースでは、患者の氏名（漢字等）、性別、生年月日、を必須情報
として記述する。また、任意情報として、氏名の読み（カタカナ表記）、医療
機関における患者番号 を記述できる。麻薬処方箋の場合には、患者住所を必須
情報として記述する。

＜[表3](https://trifolia-fhir.lantanagroup.com/igs/lantana_hapi_r4/jp-electronic-prescription/StructureDefinition-Patient.html)＞＜4.4 Patient 記述例＞
＜4.4 Patient 記述例＞
＜4.4 Patient 記述例＞

### 受診時状況情報
処方箋が出された受診時状況（外来、入院、退院時など）情報を、Encounter
リソースにより記録する。本リソースは処方箋では必須ではないので、運用上
必要とする使用例（たとえば院内処方箋での使用など）では出力することがで
きるが、それ以外では通常省略できる。

＜[表4](https://trifolia-fhir.lantanagroup.com/igs/lantana_hapi_r4/jp-electronic-prescription/StructureDefinition-Encounter.html)＞＜4.5 記述例＞
＜4.5 記述例＞
＜4.5 記述例＞

### 保険・公費情報
保険情報、公費保険情報ともに個々の保険給付ごとに別々のCoverage リソー
スで記述する。以下ではそれぞれについて説明する。

#### 保険情報
自費など保険のない診療における処方であってもこのCoverage リソースは必
須とし、適切な保険種別を指定する。

＜[表5](https://trifolia-fhir.lantanagroup.com/igs/lantana_hapi_r4/jp-electronic-prescription/StructureDefinition-Coverage.html)＞＜4.6.1 記述例＞
＜4.6.1 記述例＞
＜4.6.1 記述例＞

#### 公費情報
公費医療をうける場合のみ必要。複数の公費の場合には、その数だけ
Coverage リソースを繰り返す。公費医療でない場合には記述は不要。

＜[表6](https://trifolia-fhir.lantanagroup.com/igs/lantana_hapi_r4/jp-electronic-prescription/StructureDefinition-Coverage2.html)＞＜4.6.2 記述例＞
＜4.6.2 記述例＞
＜4.6.2 記述例＞

#### 費用負担者（保険者等）情報
保険種別が「6:自費」以外の場合、費用負担者情報を、Coverage リソースの
payor から参照されるOrganization リソースとして記録する。保険種別が「1:
医保」、「2:国保」、「7:後期高齢者」の場合は保険者を意味し、
Organization.identifier 要素に保険者番号を記録する。その他の保険種別の場合
は、identifier 要素は出現しない。費用負担者の名称を可能な範囲で
Organization.name 要素に記録する。

＜[表7](https://trifolia-fhir.lantanagroup.com/igs/lantana_hapi_r4/jp-electronic-prescription/StructureDefinition-Organization.html)＞＜4.6.3 記述例＞
＜4.6.3 記述例＞
＜4.6.3 記述例＞

### 処方医療機関と診療科情報
#### 処方医療機関情報
処方箋を発行した医療機関の情報をOrganization リソースに格納する。

処方医療機関情報を記述する際に、診療科情報の記述は必須ではない。診療科
情報を記述せずに、医療機関情報だけを記述する場合には、本項の
Organization リソースのみを記述する。

診療科情報と医療機関情報の両方を記述したい場合には、本項のOrganization
に加えて、「4.7.2 診療科情報」に後述するもうひとつのOrganization リソー
スを用いて診療科情報を記述する。

＜[表8](https://trifolia-fhir.lantanagroup.com/igs/lantana_hapi_r4/jp-electronic-prescription/StructureDefinition-Organization2.html)＞＜4.7.1 記述例＞
＜4.7.1 記述例＞
＜4.7.1 記述例＞

#### 処方診療科情報
処方診療科情報は、以下のOrganization リソースにより記述し、partOf 要素
から処方医療機関情報を表すOrganization リソースを参照する。処方診療科
情報を出力しない場合には不要である。

＜[表9](https://trifolia-fhir.lantanagroup.com/igs/lantana_hapi_r4/jp-electronic-prescription/StructureDefinition-Organization3.html)＞＜4.7.2 記述例＞
＜4.7.2 記述例＞
＜4.7.2 記述例＞

### 処方医師情報
処方医の情報は、処方医の役割を表すPractitionerRole リソース（4.8.1 処方
医役割情報）と、処方医個人そのものの情報を表すPractitioner リソース
（4.8.2 処方医情報）で記述する。

#### 処方医役割情報
処方医を識別するID や番号として、医籍登録番号、もしくは処方医療機関に
おける処方医ID（たとえば端末利用者アカウント、あるいは職員番号など）を
PractitionerRole リソースのidentifier 要素に記録する。

identifier.system 要素には、医籍登録番号を記述する場合は、
"urn:oid:1.2.392.100495.20.3.31"を指定する。

処方医療機関における処方医ID を記述する場合は、医療機関のOID 付番方法
（7.1 識別子名前空間一覧」を参照）に従ってそのOID を指定する。

＜[表10](https://trifolia-fhir.lantanagroup.com/igs/lantana_hapi_r4/jp-electronic-prescription/StructureDefinition-PractitionerRole.html)＞＜4.8.1 記述例＞
＜4.8.1 記述例＞
＜4.8.1 記述例＞

#### 処方医情報
処方医はPractitioner リソースとして記述し、PractitionerRole リソース（処
方医役割情報）から参照する。麻薬処方の場合のみ、qualification 要素に
、麻薬施用者免許番号を記録する。

＜[表11](https://trifolia-fhir.lantanagroup.com/igs/lantana_hapi_r4/jp-electronic-prescription/StructureDefinition-Practitioner.html)＞＜4.8.2 記述例＞
＜4.8.2 記述例＞
＜4.8.2 記述例＞

### 処方指示情報
#### 処方指示の構造の概要
処方指示のボディーセクションの基本構造は以下のようになる。

１医薬品ごとに処方指示がひとつのMedicationRequest リソースにより記述
され、医薬品の数だけMedicationRequest リソースが繰り返される。

本文書では以下の記述が可能である。

１）剤グループ構造とその番号（一般にシステムではRp 番号などと呼ばれる）

２）内服薬、外用薬、在宅自己注射、麻薬

３）定時用法と頓用

４）均等分割用法と不均等用法

５）毎日と不定期（隔日、曜日、期間指定、指定日）

６）交互、漸増、漸減用法

７）調剤補足情報（一包化、別包、混合、粉砕、その他）

８）明細単位での備考記述

MedicatonRequest リソースの要素の詳細を表12 に示す。

＜[表12](https://trifolia-fhir.lantanagroup.com/igs/lantana_hapi_r4/jp-electronic-prescription/StructureDefinition-MedicationRequest.html)＞

表１２のNo.14「dosageInstruction」要素は、Dosage 型の要素であり、用
法や投与量を表す。

dosageInstruction 要素の詳細は表12に含む。

表１２のNo.15.1 拡張「InstructionForDispense」を表すextension 要素は、
Extension 型の要素であり、調剤者への指示を表す。

本要素の詳細を表14 に示す。

＜[表14](https://trifolia-fhir.lantanagroup.com/igs/lantana_hapi_r4/jp-electronic-prescription/StructureDefinition-Extension.html)＞

#### 剤グループ構造とその番号
HL7 FHIR では、処方箋の中で同一の用法を持つ剤グループは、剤単位に個別
のMedicationRequest リソースに展開される。剤グループと
MedicationRequest リソースの関係を図 6 に示す。

<table style="border: 0px none">
<tr><td  style="border: 0px none"><img src="figure6.png" width="725" height="410"></td></tr>
<tr><th style="border: 0px none; text-align: center">図6 剤グループ構造</th></tr>
</table>

このとき、剤グループの番号（RP 番号と呼ぶ）と、同一剤グループ内での順
番は、いずれも MedicationRequest リソースの identifier で表現する。RP 番
号を識別するURI として、"urn:oid:1.2.392.100495.20.3.81"を使用する。同
一剤グループ内での順番を識別するURI として、
"urn:oid:1.2.392.100495.20.3.82"を使用する。value は 文字列型であり、数
値はゼロサプレス、つまり、"01"でなく"1"と指定すること。

```
"identifier": [
	{
		"system": "urn:oid:1.2.392.100495.20.3.81",
		"value": "1"
	},
	{
		"system": "urn:oid:1.2.392.100495.20.3.82",
		"value": "1"
	}
]
```

複数のMedicationRequest リソースがひとつの剤グループの番号に所属する
場合、剤グループので共通の用法指示は、各MedicationRequest リソースに
同一の用法指示を繰り返し記述する。すなわち、ひとつのMedicationRequest
リソースの記述のみで、それに記述された処方薬に関する処方指示情報は完結
していることが要求される。

また、剤グループへのコメント指示等は、同じコメント指示を剤グループに含
まれるMedicationRequest に繰り返し記述すること。

#### 内服薬、外用薬、在宅自己注射、麻薬
##### 処方薬
処方する医薬品（処方薬）は、MedicationRequest リソースにおいて
CodeableConcept 型のmedicationCodeableConcept に記述する。

medicationCodeableConcept は、ひとつのMedicationRequest リソースに1 回
だけ出現可能であるため、ひとつのMedicationRequest リソースで1 処方薬
だけを記述できる。従って、複数の処方薬を記述するには、前述したようにそ
の数だけMedicationRequest リソースを繰り返し記述する必要がある。

medicationCodeableConcept は、複数のcoding 要素を繰り返し記述できる。

厚生労働省標準であるHO9 コード（販社指定が不要な場合にはHOT7 コー
ド）を用いるか、一般薬処方の場合には厚生労働省保健局一般処方名マスタの
コードを使用して、1 組みのCoding 要素（コードsystem を識別するURI、医
薬品のコード、そのコード表における医薬品の名称の3 つからなる）で記述す
る。

ひとつの処方薬を複数のコード体系のコードで記述してもよく、その場合に
coding 要素を繰り返して記述する。

ただし、ひとつの処方薬を複数のコードで繰り返し記述する場合には、それた
のコードが表す処方薬は当然同じでなければならない。

以下にこの部分のHOT9 コードとYJ コードとで記述する場合の仕様例を示す。

|coding||1..*|Coding|||
||system|1..1|uri|"urn:oid:1.2.392.200119.4.403.1"|医薬品コード（HOT9）を識別するURI|
||code|1..1|code|"医薬品のHOTコード"|医薬品コード（HOT9）。値は例示|
||display|1..1|string|"医薬品の名称"|医薬品名称。|
||system|1..1|uri|"urn:oid:1.2.392.100495.20.1.73"|医薬品コード（YJ）を識別するURI。|
||code|1..1|code|"医薬品のYJ コード"|医薬品コード（YJ）。値は例示|
||display|1..1|string|"医薬品の名称"|医薬品名称。|

##### 内服薬
１) 用法

内服薬の用法は、テキストによる表現と、構造化データとしての表現の2 つの
記録方法がある。テキスト表現は必須とし、MedicationRequest リソースの
dosageInstruction.text 要素に用法文字列を指定する。

用法の構造化表現は、dosageInstruction.timing 要素 に、 Timing データ型
を使用して構造的に記述する。

コード化された用法は、dosageInstruction.timing.code 要素にJAMI 標準 処
方・注射オーダ標準用法規格（以下、「JAMI 標準用法コード」と呼ぶ）を指定
する。詳細は、「4.9.4 定時用法と頓用」に示す。

「1:内服」、「2:外用」などJAMI 標準用法コードにて基本用法区分として表現
される区分は、dosageInstruction.method 要素にコードまたは文字列で指定す
る。内服の場合、「1:内服」を指定する。

「0:経口」、「1:舌下」などJAMI 標準用法コードにて用法詳細区分として表現
される区分は、dosageInstruction.route 要素にコードまたは文字列で指定す
る。

２) 用量

記述対象リソース：MedicationRequest リソース

記述対象要素：

dosageInstruction.doseAndRate.doseQuantit （１回量）

dosageInstruction.doseAndRate.rateRatio （１日量）

dosageInsturction.doseAndRate.type （製剤量が成分量かの識別）

用量は、1 回投与量の記録を基本とし、MedicationRequest リソースの
dosageInstruction.doseAndRate.doseQuantity 要素 にSimpleQuantity 型で記
述する。単位コードには、医薬品単位略号（urn:oid:1.2.392.100495.20.2.101）
を使用する。

また、処方期間の中で1 日量が常に一定となる場合には、1 回量に加えて1 日
量の記録も可能とし、dosageInstruction.doseAndRate.rateRatio 要素に
Ratio 型で記録する。

Ratio 型は比を扱うデータ型で、分母にあたる
dosageInstruction.doseAndRate.rateRatio.denominator 要素には、投与量の
基準となる期間、つまり、1 日量の場合は「1 日」をQuantity 型で指定する。

単位には、単位コードUCUM（http://unitsofmeasure.org）で定義されてい
る「日」を表す単位コード「d」を使用する。

分子にあたる dosageInstruction.doseAndRate.rateRatio.numerator 要素に
は、1 回量と同様の記法で、1 日投与量をQuantity 型で指定する。

用量は製剤量で記述することを基本とするが、必要に応じて原薬量指定も可能
とする。

この識別は、MedicationRequest リソースの
dosageInsturction.doseAndRate.type 要素に、力価区分コード
（urn:oid:1.2.392.100495.20.2.22）を指定することで行い、製剤量は「1」、原
薬量は「2」とする。本要素は、安全性のため省略せずに必須とする。

投与量「1 回1 錠（1 日3 錠）」を製剤量で記述したdosageInstruction 要素の
記述例を示す。

````
"dosageInstruction": [
	{
		"text": "内服・経口・１日３回朝昼夕食後 １回１錠 ７日分",
		（中略）
		,
		"doseAndRate": [
			{
				"type": {
				"coding": [
					{
						"system": "urn:oid:1.2.392.100495.20.2.22",
						"code": "1",
						"display": "製剤量"
					}
				]
			},
			"doseQuantity": {
				"value": 1,
				"unit": "錠",
				"system": "urn:oid:1.2.392.100495.20.2.101",
				"code": "TAB"
			},
			"rateRatio": {
				"numerator": {
					"value": 3,
					"unit": "錠",
					"system": "urn:oid:1.2.392.100495.20.2.101",
					"code": "TAB"
				},
				"denominator": {
					"value": 1,
					"unit": "日",
					"system": "http://unitsofmeasure.org",
					"code": "d"
				}
			}
		}
	]
}
````

３) 投与日数

記述対象リソース：MedicationRequest リソース

記述対象要素：

dosageInstruction.timing.repeat.boundsDuration （服用開始日から終了日
までの期間の日数（服用しない日も1 日と数える））

dosageInstruction.extension.valueDuration （上記のうちの実投与日数）

dosageInstruction.timing.repeat.boundsDuration 要素に、Duration 型を使
用して記録する。本要素に指定される日数は、服用開始日から服用終了日まで
の全日数である。そのため、隔日投与や指定曜日の投与の場合には、服用しな
い日も日数に含まれることになり、処方箋に記録される投与実日数とは異なる
値が記録されることとなる。

投与期間とは別に投与実日数を表現したい場合には、MedicationRequest リソ
ースに対して本文書で定義した 拡張「UsageDuration」を使用し、Duration 型
で開始日を記載する。

Timing データ型のrepeat.boundsDuration 要素を記述した
dosageInstruction.timing 要素の記述例を示す。

この記述例には拡張「UsageDuration」を使用した投与実日数の記述例を含まれ
ている。この例の場合には、毎日投与なので開始日〜終了日の日数と、投与実
日数は7 日であり、拡張記述はなくてもよい。

[1 日３回毎食後 7 日分]

```
"dosageInstruction": [
	{
		"text": "内服・経口・１日３回朝昼夕食後 １回１錠 ７日分",
			"timing": {
				"repeat": {
					"boundsDuration": {
						"value": 7,
						"unit": "日",
						"system": "http://unitsofmeasure.org",
						"code": "d"
					}
				},
				"code": {
					"coding": [
						{
							"system": "urn:oid:1.2.392.200250.2.2.20.20",
							"code": "1013044400000000",
							"display": "１日３回毎食後"
						}
					]
				}
			},
			＜中略＞
		}
	]
	
"extension": [
	{
		"url": "http://jpfhir.jp/fhir/ePrescription/StructureDefinition/UsageDuration",
		"valueDuration": {
			"value": 7,
			"unit": "日",
			"system": "http://unitsofmeasure.org",
			"code": "d"
		}
	}
]
```

４) 投与開始日

期間指定など投与開始日を明示する必要がある場合には、MedicationRequest
リソースに対して本文書で定義した拡張「PeriodOfUse」を使用し、Period 型
で開始日を記録する。記述例を示す。

```
"extension": [
	{
		"url": "http://jpfhir.jp/fhir/ePrescription/StructureDefinition/PeriodOfUse",
		"valuePeriod": {
			"start": "2020-04-01"
		}
	}
]
```

５) 調剤量

MedicationRequest リソースのdispenseRequest.quantity に、
SimpleQuantity 型で記録する。単位コードには、投与量と同様に医薬品単位
略号（urn:oid:1.2.392.100495.20.2.101）を使用する。21 錠（1 日3 錠×7 日
分）を調剤する場合の記述例を以下に示す。

```
"dispenseRequest": {
	"quantity": {
		"value": 21,
		"unit": "錠",
		"system": "urn:oid:1.2.392.100495.20.2.101",
		"code": "TAB"
	},
	"expectedSupplyDuration": {
		"value": 7,
		"unit": "日",
		"system": "http://unitsofmeasure.org",
		"code": "d"
	}
}
```

例えば「１回２錠、５回分（10 錠）」など、頓用の場合に錠数ではなく回数
で調剤量を表現したい場合には、dispenseRequest 要素に対して本文書で定義
した拡張「ExpectedRepeatCount」を使用し、以下のように記録する。

```
"dispenseRequest": {
	"extension": {
		"url": "http://jpfhir.jp/fhir/ePrescription/StructureDefinition/ExpectedRepeatCount",
		"valueInterger": 5
	},
	"quantity": {
		"value": 10,
		"unit": "錠",
		"system": "urn:oid:1.2.392.100495.20.2.101",
		"code": "TAB"
	}
}
```

６) 調剤日数

MedicationRequest リソースのdispenseRequest.expectedSupplyDuration 要
素にDuration 型で記録する。単位は、UCUM コードより「日」を表す単位コ
ード「d」を指定する。

調剤日数の記述例を示す。

```
"dispenseRequest": {
	"quantity": {
		"value": 21,
		"unit": "錠",
		"system": "urn:oid:1.2.392.100495.20.2.101",
		"code": "TAB"
	},
	"expectedSupplyDuration": {
		"value": 7,
		"unit": "日",
		"system": "http://unitsofmeasure.org",
		"code": "d"
	}
}
```

７) 内服薬の記述例

＜4.9.3.2 内服薬処方_記述例＞
＜4.9.3.2 内服薬処方_記述例＞
＜4.9.3.2 内服薬処方_記述例＞

##### 外用薬
１) 用法

外用薬の用法は、内服薬と同様に、テキストによる表現と、構造化データとし
ての表現の2 つの記録方法がある。用法の構造化表現は、
dosageInstruction.timing.code にJAMI 標準用法コードを指定する。外用用
法の詳細は、「4.9.4.1 定時用法」「５)生活リズムを基本とした外用薬の用
法」～「７)時間間隔で明示した外用薬の用法」 に示す。

「1:内服」、「2:外用」などJAMI 標準用法コードにて基本用法区分として表現
される区分は、dosageInstruction.method 要素にコードまたは文字列で指定す
る。外用の場合、「2:外用」を指定する。

「A:貼付」、「B:塗布」などJAMI 標準用法コードにて用法詳細区分として表現
される区分は、dosageInstruction.route 要素にコードまたは文字列で指定す
る。

２) 用量

1 回量指定の場合と全量指定の場合がある。1 回量指定は、内服薬と同様に、
MedicationRequest リソース、dosageInstruction.doseAndRate.doseQuantity
要素に、SimpleQuantity 型で記録する。全量指定の場合は、調剤量として、
MedicationRequest リソースの、dispenseRequest.quantity 要素に、
SimpleQuantity 型で記録する。それぞれの記述例を、「５)記述例」に示す。

３) 投与期間

投与日数や投与開始日の指定は、内服薬の場合と同一である。

４) 部位

部位を指定する場合は、MedicationRequest.dosageInstruction.site 要素に、
CodeableConcept 型で指定する。部位コードは、JAMI 標準用法コード 表13
外用部位コード（"urn:oid:1.2.392.200250.2.2.20.32"）を使用する。

複数の部位ごとに投与量を記録する場合、
MedicationRequest.dosageInstruction 要素を複数繰り返す。以下に、右眼と
左眼で投与量の異なる指示を表現した記述例を示す。

＜4_9_3_3_外用薬処方_記述例1＞
＜4_9_3_3_外用薬処方_記述例1＞
＜4_9_3_3_外用薬処方_記述例1＞

５) 外用薬の記述例

外用薬における全量指定の例として、以下の表に示す処方指示内容を持つ記述
例を示す。

＜4_9_3_3_外用薬処方_記述例2＞
＜4_9_3_3_外用薬処方_記述例2＞
＜4_9_3_3_外用薬処方_記述例2＞

また、外用薬の1 回量指定の記述例を示す。

＜4_9_3_3_外用薬処方_記述例3＞
＜4_9_3_3_外用薬処方_記述例3＞
＜4_9_3_3_外用薬処方_記述例3＞

##### 在宅自己注射
ペンニードルなど特定保健医療材料についても、他の医薬品と同様に
MedicationRequest リソースで表現する。用法は、JAMI 標準用法コードを使
用する。

「1:内服」、「2:外用」などJAMI 標準用法コードにて基本用法区分として表現
される区分は、dosageInstruction.method 要素にコードまたは文字列で指定す
る。自己注射の場合、「3:注射」を指定する。

「1:静脈注射」、「2:皮下注射」などJAMI 標準用法コードにて用法詳細区分と
して表現される区分は、dosageInstruction.route 要素にコードまたは文字列
で指定する。

##### 麻薬処方
麻薬処方箋には、麻薬施用者番号と患者の住所を必須で記載する。

麻薬処方箋であることを識別するために、Composition リソースのcategory
要素に、麻薬処方箋を区別するためのコードを指定すると同時に、処方医師情
報に麻薬施用者番号を記録し、患者情報に住所を記録する。詳細は、「4.8 処
方医師情報 」、及び、「4.4 患者情報」 を参照すること。

#### 定時用法と頓用
JAMI 標準用法コードの用法分類に従って、定時用法と頓用の用法の表現方法に
ついて説明する。

##### 定時用法
１) 食事等タイミングを基本とする内服用法

「1 日3 回朝昼夕食後」といった、食事等タイミングを基本として服用タイミ
ングを指定する用法である。

MedicationRequest リソースのdosageInstruction.timing.code 要素に
CodeableConcept 型でJAMI 標準用法コード（urn:oid:1.2.392.200250.2.2.20.20
）を指定する。詳細は、「JAMI 標準 処方注射オーダ標準用法規格」規格書 5.1
「食事等タイミングを基本とする内服用法」 を参照のこと。

以下に、用法「１日３回 毎食後 7 日間」を表現する記述例を示す。

````
"timing": {
	"repeat": {
		"boundsDuration": {
			"value": 7,
			"unit": "日",
			"system": "http://unitsofmeasure.org",
			"code": "d"
		}
	},
	"code": {
		"coding": [
			{
				"system": "urn:oid:1.2.392.200250.2.2.20.20",
				"code": "1013044400000000",
				"display": "内服・経口・１日３回朝昼夕食後"
			}
		]
	}
}
````

２) １日回数と時間間隔を明示した内服用法

「1 日3 回 8 時間ごと」など、１日回数と時間間隔を明示した内服用法の表現
方法を示す。

MedicationRequest リソースのdosageInstruction.timing.code 要素に
CodeableConcept 型でJAMI 標準用法コード（urn:oid:1.2.392.200250.2.2.20.20
）を指定する。詳細は、「JAMI 標準 処方注射オーダ標準用法規格」規格書 5.2
「1 日回数と時間間隔を明示した内服用法」 を参照のこと。

用法「1 日３回 ８時間毎 ７日間」を表現する記述例を示す。

```
"timing": {
	"repeat": {
		"boundsDuration": {
			"value": 7,
			"unit": "日",
			"system": "http://unitsofmeasure.org",
			"code": "d"
		}
	},
	"code": {
		"coding": [
			{
				"system": "urn:oid:1.2.392.200250.2.2.20.20",
				"code": "1023000000000000",
				"display": "内服・経口・１日３回８時間毎"
			}
		]
	}
}
```

３) １日回数と服用時刻を明示した内服用法

「1 日3 回 8 時、12 時、18 時」など、1 日回数と服用時刻を明示した内服用法
の表現方法を示す。

MedicationRequest リソースのdosageInstruction.timing.code 要素 に
CodeableConcept 型でJAMI 標準用法コード（urn:oid:1.2.392.200250.2.2.20.20
）を指定する。詳細は、「JAMI 標準 処方注射オーダ標準用法規格」規格書 5.3
「1 日回数と服用時刻を明示した内服用法」 を参照のこと。

用法「1 日3 回 8 時、15 時、21 時 7 日間」を表現する記述例を示す。

```
"timing": {
	"repeat": {
		"boundsDuration": {
			"value": 7,
			"unit": "日",
			"system": "http://unitsofmeasure.org",
			"code": "d"
		}
	},
	"code": {
		"coding": [
			{
				"system": "urn:oid:1.2.392.200250.2.2.20.20",
				"code": "1033IPV000000000",
				"display": "内服・経口・１日３回８時、１５時、２１時"
			}
		]
	}
}
```

４) １日回数とイベントを明示した内服用法

1 日回数と服用タイミングを特定のイベントで明示した内服用法で、例として
「1 日N 回哺乳時」および「1 日1 回空腹時」がある。

「１日３回 哺乳時」を表現する記述例を示す。

```
"timing": {
	"code": {
		"coding": [
			{
				"system": "urn:oid:1.2.392.200250.2.2.20.20",
				"code": "1043B70000000000",
				"display": "内服・経口・１日３回哺乳時"
			}
		]
	}
}
```

５) 生活リズムを基本とした外用薬の用法

例えば「1 日3 回朝昼夕」「1 日1 回起床時」などのように生活リズム上の出
来事や行為を基本として外用タイミングを指定する種類の用法である。「起床
時」「就寝」は内服用法においては「食事等タイミングを基本とする用法」に
分類されるが、外用においては「生活リズムを基本とする用法」に分類され
る。

MedicationRequest リソースのdosageInstruction.timing.code 要素に
CodeableConcept 型でJAMI 標準用法コード（urn:oid:1.2.392.200250.2.2.20.20
）を指定する。詳細は、「JAMI 標準 処方注射オーダ標準用法規格」規格書 6.1
「生活リズムを基本とした外用用法」 を参照のこと。

用法「1 日2 回 朝と就寝前 塗布」を表現する記述例を示す。

```
"timing": {
	"code": {
		"coding": [
			{
				"system": "urn:oid:1.2.392.200250.2.2.20.20",
				"code": "2B62100900000000",
				"display": "外用・塗布・１日２回朝と就寝前"
			}
		]
	}
}
```

６) １日回数だけを明示した外用薬の用法

「1 日3 回」など、1 日回数だけを明示した用法。「1 日2～3 回」というよう
な幅を持たせた回数指定も含まれる。

MedicationRequest リソースのdosageInstruction.timing.code 要素に
CodeableConcept 型でJAMI 標準用法コード（urn:oid:1.2.392.200250.2.2.20.20
）を指定する。詳細は、「JAMI 標準 処方注射オーダ標準用法規格」規格書 6.2
「１日回数だけを明示した外用用法」 を参照のこと。

用法「1 日1～２回 塗布 7 日間」を表現する記述例を示す。

```
"timing": {
	"repeat": {
		"boundsDuration": {
			"value": 7,
			"unit": "日",
			"system": "http://unitsofmeasure.org",
			"code": "d"
		}
	},
	"code": {
		"coding": [
			{
				"system": "urn:oid:1.2.392.200250.2.2.20.20",
				"code": "2B71200000000000",
				"display": "外用・塗布・１日１～２回"
			}
		]
	}
}
```

７) 時間間隔で明示した外用薬の用法

「３時間ごと」や「４～６時間ごと」といった、時間間隔のみでタイミングを
指定する場合の表現を示す。

MedicationRequest リソースのdosageInstruction.timing.code 要素に
CodeableConcept 型でJAMI 標準用法コード（urn:oid:1.2.392.200250.2.2.20.20
）を指定する。詳細は、「JAMI 標準 処方注射オーダ標準用法規格」規格書 6.3
「時間間隔で明示した外用用法」を参照のこと。

用法「４～６時間ごと 塗布 ７日間」を表現する記述例を示す。

```
"timing": {
	"repeat": {
		"boundsDuration": {
			"value": 7,
			"unit": "日",
			"system": "http://unitsofmeasure.org",
			"code": "d"
		}
	},
	"code": {
		"coding": [
			{
				"system": "urn:oid:1.2.392.200250.2.2.20.20",
				"code": "2B84600000000000",
				"display": "外用・塗布・４～６時間毎"
			}
		]
	}
}
```

##### 頓用
１) 頓用型の内服用法

ある状況になったときに服用を指示する頓用と呼ばれる指示に使用する。

MedicationRequest リソースのdosageInstruction.timing.code 要素に
CodeableConcept 型でJAMI 標準用法コード（urn:oid:1.2.392.200250.2.2.20.20
）を指定する。詳細は、「JAMI 標準 処方注射オーダ標準用法規格」規格書 5.5
「頓用型の内服用法」を参照のこと。

さらに、頓用であることを明示するために、
dosageInstruction.asNeededBoolean 要素に true を指定する。

以下に、用法「疼痛時 １回２錠 ５回分」を表現する記述例を示す。「5 回分」
という情報を表すために、「4.9.3.1 内服薬 ５) 調剤量 」に示した拡張
「ExpectedRepeatCount」をdispenseRequest. extension で使用して
valueInteger 要素に値5 を指定する。

```
"dosageInstruction": [
	{
		"text": "内服・経口・疼痛時 １回２錠 ５回分",
		"timing": {
			"code": {
				"coding": [
					{
						"system": "urn:oid:1.2.392.200250.2.2.20.20",
						"code": "1050110000000000",
						"display": "内服・経口・疼痛時"
					}
				]
			}
		},
		"asNeededBoolean": true,
		: (中略)
		} ],
"dispenseRequest": {
	"extension": [ {
			"url": "http://hl7.jp/ePrescription/StructureDefinition/ExpectedRepeatCount",
			"valueInteger": 5
	} ],
	"quantity": {
		"value": 10,
		"unit": "錠",
		"system": "urn:oid:1.2.392.100495.20.2.101",
		"code": "TAB"
	},
},
: (以下省略)
```

２) 頓用型の外用用法

ある状況になったときに外用を指示する頓用と呼ばれる指示に使用する。

MedicationRequest リソースのdosageInstruction.timing.code 要素に
CodeableConcept 型でJAMI 標準用法コード（urn:oid:1.2.392.200250.2.2.20.20
）を指定する。詳細は、「JAMI 標準 処方注射オーダ標準用法規格」規格書 6.4
「頓用型の外用用法」を参照のこと。さらに、頓用であることを明示するため
に、dosageInstruction.asNeededBoolean 要素に true を指定する。

以下に、用法「かゆいとき患部に塗布」を表現する記述例を示す。

```
"dosageInstruction": [
	{
		"text": "かゆいとき患部に塗布",
		"timing": {
			"code": {
				"coding": [
					{
						"system": "urn:oid:1.2.392.200250.2.2.20.20",
						"code": "2B50810000000000",
						"display": "外用・塗布・かゆいとき"
					}
				]
			}
		},
		"asNeededBoolean": true,
		"site": {
			"coding": [
				{
					"system": "urn:oid:1.2.392.200250.2.2.20.32",
					"code": "AA0",
					"display": "患部"
				}
			]
		},
		"route": {
			"coding": [
				{
					"system": "urn:oid:1.2.392.200250.2.2.20.40",
					"code": "2B",
					"display": "塗布"
				}
			]
		},
		"method": {
			"coding": [
				{
					"system": "urn:oid:1.2.392.200250.2.2.20.30",
					"code": "2",
					"display": "外用"
				}
			]
		}
	}
],
"dispenseRequest": {
	"quantity": {
		"value": 1,
		"unit": "本",
		"system": "urn:oid:1.2.392.100495.20.2.101",
		"code": "HON"
	}
},
	"substitution": {
		"allowedCodeableConcept": {
			"coding": [
				{
					"system": "urn:oid:1.2.392.100495.20.2.41",
					"code": "0",
					"display": "変更可"
				}
			]
		}
	}
}
```

#### 均等分割用法と不均等用法
「4.9.4.1 定時用法」で説明した均等分割用法に対して、不均等用法は、「朝1
錠、昼2 錠、夕3 錠服用」など、1 日の中の服用タイミングごとに服用量が変
化する用法である。不均等投与を1 回投与ごとの複数の用法（1 回用法）に分
けて記述できる場合は、服用タイミングが異なる複数の剤グループとして表現
することができる。しかし、不均等投与を1 つの剤グループとして１つの用法
（1 日用法）でしか表現できないシステムもある。以下では、1 回用法の記述
例と、1 日用法での記述例をそれぞれ示す。

１) １回用法の例

朝食後に4 錠、昼食後2 錠、夕食後1 錠、合計1 日投与量7 錠であることを1
回用法で３つの剤グループで表現したインスタンスの例である。それぞれの剤
グループの表現方法は「4.9.4.1 定時用法」に従う。

＜4.9.5. 1 不均等投与記述例（１回ごと記述）＞
＜4.9.5. 1 不均等投与記述例（１回ごと記述）＞
＜4.9.5. 1 不均等投与記述例（１回ごと記述）＞

２) １日用法の例

朝食後に4 錠、昼食後2 錠、夕食後1 錠、合計1 日投与量7 錠であることを1
日用法で表現したインスタンスの例である。

１つのMedicationRequest リソースの1 つのdosageInstruction 要素を使
用し、dosageInstruction.doseAndRate.rateRatio 要素に、1 日投与量の
みを記載する。1 回の投与量の情報をコードとして記述できる場合は、
dosageInstruction.additionalInstruction 要素に、1 日の服用回数分だ
け繰り返し、JAMI 補足用法コードを使用し記述する。コード化できない場合
は、明細単位の備考としてテキストで記述する。

＜4.9.5. 2 不均等投与記述例（１日用法で記述）＞
＜4.9.5. 2 不均等投与記述例（１日用法で記述）＞
＜4.9.5. 2 不均等投与記述例（１日用法で記述）＞

#### 毎日と不定期（隔日、曜日、期間指定、指定日）
##### 隔日投与
隔日投与など、連続して服用する日数と、その後の連続して休薬する日数を指
定する方法。

MedicationRequest リソースのdosageInstruction.timing.code 要素に
CodeableConcept 型でJAMI 標準用法コード（urn:oid:1.2.392.200250.2.2.20.20
）を指定する。さらに、dosageInstruction.timing.additionalInstrunction
要素に、CodeableConcept 型で、JAMI 標準「処方・注射オーダ標準用法規格
」 8 桁補足用法コード（urn:oid:1.2.392.200250.2.2.20.22）を指定する。詳細
は、「JAMI 標準 処方注射オーダ標準用法規格」規格書 8.1「日数間隔指定」 を
参照のこと。

用法「１日３回 朝昼夕食後 １回１錠 ７日分（隔日投与）」をJAMI 標準用法コ
ード、及び、補足用法コードで表現した記述例を示す。

＜4.9.6.1 隔日投与の記述例＞
＜4.9.6.1 隔日投与の記述例＞
＜4.9.6.1 隔日投与の記述例＞

##### 曜日指定
「火曜日と金曜日に服用」など、服用する曜日を指定する指示。

MedicationRequest リソースのdosageInstruction.timing.code 要素に
CodeableConcept 型でJAMI 標準用法コード（urn:oid:1.2.392.200250.2.2.20.20
）を指定する。さらに、dosageInstruction.timing.additionalInstrunction
要素に、CodeableConcept 型で、JAMI 標準「処方・注射オーダ標準用法規格
」 8 桁補足用法コード（urn:oid:1.2.392.200250.2.2.20.22）を指定する。詳細
は、「JAMI 標準 処方注射オーダ標準用法規格」規格書 8.2「曜日指定」 を参照
のこと。

曜日指定投与「１日１回 朝食後 １回１錠 （月曜日、木曜日）」を、JAMI 標準
用法コードで記録した記述例を示す。

＜4.9.6.2 曜日指定の記述例＞
＜4.9.6.2 曜日指定の記述例＞
＜4.9.6.2 曜日指定の記述例＞

##### 期間指定
期間指定がある指示。MedicationRequest リソースに、投与開始日と実投与日
数を記録する。投与開始日は、「4.9.3.1 内服薬 ４)投与開始日」 で説明した拡
張「PeriodOfUse」を使用する。実投与日数を指定する場合は、「4.9.3.1 内服
薬 ３)投与日数」ので説明した拡張「UsageDuration 」を使用する。

##### 指定日
服用タイミングを、具体的な日時で指定する指示方法。MedicationRequest リ
ソースの dosageInstruction.timing.event 要素に、各服用日時をdateTime
型で列挙する。

指定日用法の「2020/08/21、2020/08/23、2020/08/25 の3 日間 1 日3 回毎
食後 1 回1 錠」の用法を表すdosageInstruction 記述例を示す。

```
"dosageInstruction": [
	{
		"text": "１日３回 朝昼夕食後 １回１錠 ３日分",
		"timing": {
			"event": [
				"2020-08-21",
				"2020-08-23",
				"2020-08-25"
			],
			： （以下略）
```

#### 交互、漸増、漸減用法
交互投与は、異なる服用開始日を持ちそれぞれが隔日投与を表現した複数の
MedicationRequest リソースとして表現することができる。各剤グループの表
現は、「4.9.6.1 隔日投与」の仕様に準じる。

漸増、漸減用法は、投与量ごとに剤グループを分けて、複数の
MedicationRequest リソースを使用して記録する。各剤グループの表現は、上
記に述べた仕様に準じる。

漸増・漸減用法の例として「1 日1 回夕食後2 日分、1 日2 回朝夕食後３日
分、1 日3 回朝昼夕食後2 日分 1 回1 錠」を表す記述例を示す。

＜4.9.7 漸増処方の記述例＞
＜4.9.7 漸増処方の記述例＞
＜4.9.7 漸増処方の記述例＞

#### 調剤補足情報
調剤者への指示は、薬剤単位の指示と、処方箋全体の指示の２つの場合があ
る。それぞれについて、本文書で定義した、テキストによる指示とコードによ
る指示を並記するための拡張「InstructionForDispense 拡張」および
「CommunicationContent 拡張」を使用する。

##### 薬剤に対する調剤指示
単一の薬剤に対する指示は、MedicationRequest リソースのdispenseRequest
要素に対して本文書で定義した拡張「InstructionForDispense」を使用する。こ
の拡張は、string 型を使用してテキストとして指示の内容を記録できる拡張
と、CodeableConcept 型を使用してコード化された指示を記録できる拡張の２
つを含んでおり、テキストによる指示とコードによる指示を並記することがで
きる。一つの薬剤に対して、複数の指示を記録する場合には、この拡張を、拡
張単位で繰り返して記録する。

薬剤単位の調剤指示を表すdispenseRequest の記述例を示す。

```
"dispenseRequest": {
	"extension": [
		{
			"url": "http://jpfhir.jp/fhir/ePrescription/StructureDefinition/InstructionForDispense",
			"extension": [
				{
					"url": "TextContent",
					"valueString": "嚥下障害のため、上記粉砕指示"
				},
				{
					"url": "CodedContent",
					"valueCodeableConcept": {
						"coding": [
							{
								"code": "C",
								"system": "urn:oid:1.2.392.200250.2.2.30.10",
								"display": "粉砕指示"
							}
						]
					}
				}
			]
		}
	],
	"quantity": {
		"value": 21,
		"unit": "錠",
		"system": "urn:oid:1.2.392.100495.20.2.101",
		"code": "TAB"
	},
	"expectedSupplyDuration": {
		"value": 7,
		"unit": "日",
		"system": "http://unitsofmeasure.org",
		"code": "d"
	}
},
"substitution": {
	"allowedCodeableConcept": {
		"coding": [
			{
				"system": "urn:oid:1.2.392.100495.20.2.41",
				"code": "0",
				"display": "変更可"
			}
		]
	}
}
```

##### 処方箋全体の指示
１つの処方箋の中で、調剤者への指示が複数の薬剤に関わる場合には、処方箋
全体の指示を使用する。

処方箋ヘッダセクションに格納するCommunication リソースで表現する。指
示の内容は、薬剤単位の指示と同様に、テキストによる指示とコード化された
指示を並記するために本文書で定義した拡張「CommunicationContent」を使用
して記録する。

Communication リソースは、後述する処方箋備考や残薬確認指示でも使用す
る。そのため、Communication リソースのcategory 要素に指定するコード
（http://jpfhir.jp/fhir/ePrescription/CodeSystem/CommunicationCategory）か
ら「2:調剤者への指示」を指定することで、Communication リソースが表現
する内容が調剤者への指示であることを識別する。複数の指示を指定する場合
は、Communication リソース単位で繰り返す。

処方箋全体にかかわる調剤指示を表現するCommunication リソースの記述例
を示す。

```
"resource": {
	"resourceType": "Communication",
	"extension": [
		{
			"url": "http://jpfhir.jp/fhir/ePrescription/StructureDefinition/CommunicationContent",
			"extension": [
				{
					"url": "TextContent",
					"valueString": "Rp01. 1 回量が9mL なので、 水を1mL 加え、1 回量を10mL とする。"
				}
			]
		}
	],
	"category": {
		"coding": [
			{
				"system": "http://jpfhir.jp/fhir/ePrescription/CodeSystem/CommunicationCategory",
				"code": "2",
				"display": "調剤者への指示"
			}
		]
	}
}
```

#### 明細単位での備考記述
処方箋の薬剤単位の備考は、MedicationRequest リソースのnote 要素に、
Annotation 型で記録する。その記述例を示す。

```
"note": {
	"text": "4 月1 日から4 日間服用。2 週間休薬後、4 月19 日から4 日間服用。患者に書面にて説明済み。"
}

```



[Next Page - 処方箋の運用に関係する情報の記述方法](descriptionmethod.html)