[Previous Page - 処方箋の運用に関係する情報の記述方法](descriptionmethod.html)

このページは、令和2年度厚生労働科学特別研究事業「診療情報提供書, 電子処方箋等の電子化医療文書の相互運用性確保のための標準規格の開発研究」において研究班が策定した<a href="https://std.jpfhir.jp/wp-content/uploads/2021/04/ePresctiption20210329Rel.zip">電子処方箋 HL7® FHIR®記述仕様書案</a>をもとに引用・再構成して作成しています。  

分割指示に係わる処方箋は、分割の1回分に対応するBundle リソースを、全体のヘッダ（分割処方箋の別紙）に相当するBundle リソースで束ねる構造をとる。分割処方箋の別紙に相当するBundle リソースには、分割処方箋セクションと別紙セクションの2 つのセクションを含むComposition リソースが含まれる。そのComposition リソースからは、患者を表すPatient リソースや、分割処方箋の作成医であるPractitionerRole リソースが参照される。

個々の処方箋に対応するBundle リソースは、分割処方箋セクションのentryとして参照される。別紙セクションは、発行保健医療機関を表すOrganizationリソースを含む。

<table style="border: 0px none">
<tr><td  style="border: 0px none"><img src="figure7.png" width="602" height="623"></td></tr>
<tr><th style="border: 0px none; text-align: center">図7 分割処方箋の構造</th></tr>
</table>

分割処方箋を表すBundle リソースの構造を以下に示す。

＜[表15 Bundleリソース　文書情報（処方箋・分割処方）](https://trifolia-fhir.lantanagroup.com/igs/lantana_hapi_r4/jp-ePrescription/StructureDefinition-jp-ePrescription-Bundle2.html)＞

次に、分割処方箋に対応するBundle リソースの最初のentry となるComposition リソースの構造を示す。

＜[表16 Compositionリソース　文書構成情報（分割処方箋）](https://trifolia-fhir.lantanagroup.com/igs/lantana_hapi_r4/jp-ePrescription/StructureDefinition-jp-ePrescription-Composition2.html)＞

分割処方箋発行医療機関情報は、Organization リソースとして記録する。これは、「4.1.7.1 処方医療機関情報」で説明した、個々の処方箋に対応するBundleのBundle.section.entry.resource 要素に格納されるOrganization リソースと同一施設となる。しかし、分割処方箋を表現するBundle とは異なるBundleリソースに格納されることとなるため、別インスタンスとして格納する必要がある。処方箋医療機関情報としては必要なかった項目として、分割処方箋発行医療機関として必要となる項目として医療機関の連絡先（FAX、その他）が必要となる。

＜[表17 Organizationリソース（分割処方箋における処方医療機関情報）](https://trifolia-fhir.lantanagroup.com/igs/lantana_hapi_r4/jp-ePrescription/StructureDefinition-jp-ePrescription-Organization4.html)＞
＜[分割処方箋の記述例](https://trifolia-fhir.lantanagroup.com/igs/lantana_hapi_r4/jp-ePrescription/Bundle-jp-ePrescription-BundleSS.html)＞


[Next Page - データタイプについて](datatype.html)