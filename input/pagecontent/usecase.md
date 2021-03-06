[Previous Page - 概要](summary.html)

このページは、令和2年度厚生労働科学特別研究事業「診療情報提供書, 電子処方箋等の電子化医療文書の相互運用性確保のための標準規格の開発研究」において研究班が策定した<a href="https://std.jpfhir.jp/wp-content/uploads/2021/04/ePresctiption20210329Rel.zip">電子処方箋 HL7® FHIR®記述仕様書案</a>をもとに引用・再構成して作成しています。  
以下で ***本文書*** は、研究班が策定した<a href="https://std.jpfhir.jp/wp-content/uploads/2021/04/ePresctiption20210329Rel.zip">電子処方箋 HL7® FHIR®記述仕様書案</a>を示します。  

### 前提とする電子処方箋の運用例
本文書では、仕様を検討するにあたって、厚生労働省健康・医療・介護情報利活用検討会[1]で提示された下記の運用例の図（図 1）を参考とした。本文書では、この図で医療機関により登録される③電子処方箋、調剤薬局から取得される⑤電子処方箋、についてその電子的記述仕様を取り扱う。また、⑦調剤情報についても、対象とする予定であるが、本文書ではこれに対応していない。

<table style="border: 0px none">
<tr><td  style="border: 0px none"><img src="figure1.png" width="700" height="544"></td></tr>
<tr><th style="border: 0px none; text-align: center">図1: 電子処方箋の運用と処方情報・調剤情報の活用</th></tr>
</table>

医療機関が本文書により記述された電子データを電子処方箋サーバに登録し、登録済みであることを確認する手順、および調剤薬局が登録済みの電子処方箋データを取得し、調剤情報を登録する手順などについては、この文書の範囲外とする。
また、調剤薬局が、特定の患者の未調剤電子処方箋データを取得するためのキーとなる文書ID の取得、およびその文書ID による電子処方箋データの取得において使用する文書ID の付番ルール、運用ルール、管理方法、またその文書ID の患者単位の検索方法については、電子処方箋サーバの仕様に関わることであるため、本文書の範囲外としている。
ただし、本文書の策定にあたっては、調剤薬局で以下のようなワークフローによりデータが使用されることを想定している。

1. 調剤薬局で対象とする患者から提示された被保険者番号情報をキーとして、その患者に発行され登録されている未調剤電子処方箋データを電子処方箋サーバから検索する。
2. サーバ上に複数の未調剤電子処方箋があった場合には、医療機関情報や処方交付日付情報などを患者に確認することにより、調剤すべき未調剤電子処方箋を特定する。
3. その未調剤電子処方箋データを取得（いわゆるダウンロード等）する。
4. 改ざん検知と発行者の電子署名の確認を行う。

[1] [https://www.mhlw.go.jp/stf/newpage_09958.html](https://www.mhlw.go.jp/stf/newpage_09958.html) , 
[https://www.mhlw.go.jp/content/12600000/000639835.pdf](https://www.mhlw.go.jp/content/12600000/000639835.pdf)


[Next Page - ガイダンス](guidance.html)