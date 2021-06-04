[Previous Page - 処方箋の運用に関係する情報の記述方法](descriptionmethod.html)

分割指示に係わる処方箋は、分割の1 回分に対応するBundle リソースを、全
体のヘッダ（分割処方箋の別紙）に相当するBundle リソースで束ねる構造を
とる。分割処方箋の別紙に相当するBundle リソースには、分割処方箋セクシ
ョンと別紙セクションの2 つのセクションを含むComposition リソースが含
まれる。そのComposition リソースからは、患者を表すPatient リソースや、
分割処方箋の作成医であるPractitionerRole リソースが参照される。

個々の処方箋に対応するBundle リソースは、分割処方箋セクションのentry
として参照される。別紙セクションは、発行保健医療機関を表すOrganization
リソースを含む。

<table style="border: 0px none">
<tr><td  style="border: 0px none"><img src="figure7.png" width="602" height="623"></td></tr>
<tr><th style="border: 0px none; text-align: center">図7 分割処方箋の構造</th></tr>
</table>

分割処方箋を表すBundle リソースの構造を以下に示す。

＜[表15](https://trifolia-fhir.lantanagroup.com/igs/lantana_hapi_r4/jp-electronic-prescription/StructureDefinition-Bundle2.html)＞

次に、分割処方箋に対応するBundle リソースの最初のentry となる
Composition リソースの構造を示す。

＜[表16](https://trifolia-fhir.lantanagroup.com/igs/lantana_hapi_r4/jp-electronic-prescription/StructureDefinition-Composition2.html)＞

分割処方箋発行医療機関情報は、Organization リソースとして記録する。これ
は、「4.7.1 処方医療機関情報」で説明した、個々の処方箋に対応するBundle
のBundle.section.entry.resource 要素に格納されるOrganization リソース
と同一施設となる。しかし、分割処方箋を表現するBundle とは異なるBundle
リソースに格納されることとなるため、別インスタンスとして格納する必要が
ある。処方箋医療機関情報としては必要なかった項目として、分割処方箋発行
医療機関として必要となる項目として医療機関の連絡先（FAX、その他）が必
要となる。

＜[表17](https://trifolia-fhir.lantanagroup.com/igs/lantana_hapi_r4/jp-electronic-prescription/StructureDefinition-Organization4.html)＞＜6 記述例＞
＜6 記述例＞
＜6 記述例＞



[Next Page - データタイプについて](datatype.html)