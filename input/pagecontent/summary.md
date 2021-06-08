[Previous Page - Home Page](index.html)

### 本文書の位置づけ
この文書は、HL7 FHIR（以下、単に「FHIR 」という）に準拠した電子処方箋データの記述仕様を記述した文書のドラフトであり、下記に記載する研究班の報告書の一部を構成するものである。

令和2 年度厚生労働行政推進調査事業費補助金 令和２年度厚生労働科学特別研究事業「診療情報提供書, 電子処方箋等の電子化医療文書の相互運用性確保のための標準規格の開発研究」 (課題番号20ⅭＡ2013）

以下では本文書という。

本文書は、現在の法令が定める紙の処方箋様式に基づき作成したものであり、電子化に伴う新たな処方様式のあり方を検討してその仕様を作成したものではない。

また、本文書の作成にあたって、ベースとしたHL7 FHIR 仕様には、HL7 FIHR R4 に修正を加えたVer. 4.0.1(Oct-30, 2019)を採用しているが、それ自体がNormative として確定した仕様となっていないものを多く含んでいる。そのため、本仕様自体に含まれる各FHIR リソースの仕様も確定版ではなく、今後の細部の変更も十分に考えられる。以上の理由から、本文書はFHIR 仕様にもとづく電子処方箋の確定仕様を今後策定する上での参考文書として位置付けられるべきものである。

### 参照する仕様等
本文書は、以下の仕様等を参照して作成された。

HL7FHIR R 4 Ver. 4.0.1 [http://hl7.org/fhir/index.html](http://hl7.org/fhir/index.html)

JAHIS 電子処方箋実装ガイド Ver.1.1
[https://www.jahis.jp/standard/detail/id=634](https://www.jahis.jp/standard/detail/id=634)

電子処方箋CDA 記述仕様 第1 版
[https://www.mhlw.go.jp/content/10800000/000342368.pdf](https://www.mhlw.go.jp/content/10800000/000342368.pdf)

SS-MIX2 標準化ストレージ仕様書Ver.1.2f 別紙：コード表(2019.09.20 版)
[http://www.jami.jp/jamistd/docs/SS-MIX2/f/SSMIX2_StndrdStrgSpecVer.1.2fCodeTable.pdf](http://www.jami.jp/jamistd/docs/SS-MIX2/f/SSMIX2_StndrdStrgSpecVer.1.2fCodeTable.pdf)


[Next Page - ユースケース](usecase.html)