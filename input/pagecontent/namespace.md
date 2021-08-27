[Previous Page - データタイプについて](datatype.html)

このページは、令和2年度厚生労働科学特別研究事業「診療情報提供書, 電子処方箋等の電子化医療文書の相互運用性確保のための標準規格の開発研究」において研究班が策定した<a href="https://std.jpfhir.jp/wp-content/uploads/2021/04/ePresctiption20210329Rel.zip">電子処方箋 HL7® FHIR®記述仕様書案</a>をもとに引用・再構成して作成しています。  
以下で ***本文書*** は、研究班が策定した<a href="https://std.jpfhir.jp/wp-content/uploads/2021/04/ePresctiption20210329Rel.zip">電子処方箋 HL7® FHIR®記述仕様書案</a>を示します。  

### 識別子名前空間一覧
本文書で定義された、識別子の名前空間の一覧を示す。ここに掲げたsystem値は仮設定のものがあり、今後変更がありうる。

本文書中で、患者ID や処方医ID を医療機関等が独自に付番管理する番号で記述する場合、表 18 に示すとおり、特定のOID の枝番に”1”＋保険医療機関番号（10 桁）によりOID を構成するものとする。1 を先頭に付与しているのは、OID のルール上、先頭が0 は許容されていないことによる。

表18 識別子名前空間一覧


||項目|Path|system値（URI）|
|--:|--|--|--|
|1|処方箋番号（処方箋ID）|Composition.identifier|urn:oid:1.2.392.100495.20.3.11.1[保険医療機関コード(10 桁)]<br>全国で⼀意になる発番ルールにもとづく場合にはurn:oid:1.2.392.100495.20.3.11 とする。|
|2|都道府県番号|Organization.extension.valueIdentifier|urn:oid:1.2.392.100495.20.3.21|
|3|点数表番号|Organization.extension.valueIdentifier|urn:oid:1.2.392.100495.20.3.22|
|4|保険医療機関番号（7 桁）|Organization.extension.valueIdentifier|urn:oid:1.2.392.100495.20.3.23|
|5|保険医療機関番号（10 桁）|Organization.identifier|http://jpfhir.jp/fhir/ePrescription/InsuranceInstitutionNo|
|6|医籍登録番号|PractitionerRole.identifier|urn:oid:1.2.392.100495.20.3.31|
|7|麻薬施用者免許番号|Practitioner.qualification.identifier|urn:oid:1.2.392.100495.20.3.32.1[都道府県番号]|
|8|処方医ID（医師）|PractitionerRole.identifier|urn:oid:1.2.392.100495.20.3.41.1[保険医療機関コード(10 桁)]|
|9|処方医ID（歯科医師）|PractitionerRole.identifier|urn:oid:1.2.392.100495.20.3.42.1[保険医療機関コード(10 桁)]|
|10|医療機関等の患者ID|Patient.identifier|urn:oid:1.2.392.100495.20.3.51.1[保険医療機関コード(10 桁)]|
|11|保険者番号|Organization.identifier|urn:oid:1.2.392.100495.20.3.61|
|12|公費負担者番号|Organization.identifier|urn:oid:1.2.392.100495.20.3.71|
|13|剤グループ番号|MedicationRequest.identifier|urn:oid:1.2.392.100495.20.3.81|
|14|同一剤グループ内での順番|MedicationRequest.identifier|urn:oid:1.2.392.100495.20.3.82|

urn:oid:1.2.392.100495.20.3. の系列は、厚生労働省 電子処方箋CDA 記述仕様第1 版（平成30 年7月）付表2 OID 一覧より引用。

医療機関等の患者ID のsystem値（URI）：[保険医療機関コード(10 桁)]が0312345678 の場合、urn:oid:1.2.392.100495.20.3.51.1[保険医療機関コード(10 桁)]はurn:oid:1.2.392.100495.20.3.51.10312345678 となる。

麻薬施用者免許番号のsystem値（URI）： [都道府県番号]は同別表21 都道府県番号（OID: 1.2.392.100495.20.3.21）より引用する2 桁とすること。urn:oid:1.2.392.100495.20.3.32.1[都道府県番号] で北海道01 の場合、urn:oid:1.2.392.100495.20.3.32.101 となる。

### バリューセット一覧
本文書で定義されたバリューセットの一覧を示す。ここに掲げたバリューセットURL、およびコード体系値は、今後変更または新たな設定がありうる。

＜[表19 バリューセット一覧](https://trifolia-fhir.lantanagroup.com/igs/lantana_hapi_r4/jp-ePrescription/artifacts.html#%E7%94%A8%E8%AA%9E-%E3%83%90%E3%83%AA%E3%83%A5%E3%83%BC%E3%82%BB%E3%83%83%E3%83%88)＞

### コード体系一覧
本文書で定義されたコード体系の一覧を示す。ここにURI は仮設定のものがあり、今後変更または新たな設定がありうる。

urn:oid:1.2.392.100495.20.x ： 厚生労働省電子処方箋 CDA 記述仕様第１版（6付録２ OID 一覧）（[https://www.mhlw.go.jp/content/10800000/000342368.pdf ](https://www.mhlw.go.jp/content/10800000/000342368.pdf )）に収載されているOIDurn:oid:1.2.392.200250.2.20.x ：（案）JAMI 管理のOID 表に追加する 電子処方箋FHIR 仕様でのOID 一覧（[http://jami.jp/jamistd/docs/OID-Table-JAMI-20200310.pdf](http://jami.jp/jamistd/docs/OID-Table-JAMI-20200310.pdf) ）

＜[表20 コード体系一覧](https://trifolia-fhir.lantanagroup.com/igs/lantana_hapi_r4/jp-ePrescription/artifacts.html#%E7%94%A8%E8%AA%9E-%E3%82%B3%E3%83%BC%E3%83%89%E3%82%B7%E3%82%B9%E3%83%86%E3%83%A0)＞

### 拡張一覧(FHIR Extension)
本文書で定義した拡張の一覧を示す。ここにURL は仮設定のものがあり、今後変更または新たな設定がありうる。

＜[表21 拡張一覧](https://trifolia-fhir.lantanagroup.com/igs/lantana_hapi_r4/jp-ePrescription/artifacts.html#%E6%A7%8B%E9%80%A0-%E6%8B%A1%E5%BC%B5%E3%81%AE%E5%AE%9A%E7%BE%A9)＞

