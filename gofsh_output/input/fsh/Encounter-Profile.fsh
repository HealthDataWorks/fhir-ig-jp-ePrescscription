Profile: Encounter
Parent: $Encounter
Id: jp-ePrescription-Encounter
Title: "Encounterリソース　受信状況情報"
Description: "処方箋が出された受診時状況（外来、入院、退院時など）情報を、Encounterリソースにより記録する。"
* ^meta.versionId = "2"
* ^meta.lastUpdated = "2021-06-04T04:36:33.634+00:00"
* ^meta.source = "#66x3Lq5MyB6ulVgm"
* ^url = "https://healthdataworks.net/JP-ePrescription/StructureDefinition/Encounter"
* ^status = #active
* . ^short = "Encounterリソースであることを⽰す 2"
* text MS
* text ^short = "本リソースをテキストで表現したものを入れてもよい。"
* text.status = #generated (exactly)
* text.status MS
* text.status ^short = "テキスト内容の全てがリソースのコンテンツから生成されたことを示す。"
* text.div MS
* text.div ^example.label = "Example for xhtml"
* text.div ^example.valueString = "<div\r\n                        xmlns=\"http://www.w3.org/1999/xhtml\">xxx</div>"
* status = #finished (exactly)
* status MS
* status ^short = "バリューセットEncounterStatus(http://hl7.org/fhir/ValueSet/encouner-status)より”finished\"を指定する。"
* class MS
* class ^short = "受診情報の分類"
* class.system 1.. MS
* class.system = "http://terminology.hl7.org/CodeSystem/v3-ActCode" (exactly)
* class.system ^short = "コード体系v3.ActEncounterCode を識別するURI。"
* class.code 1.. MS
* class.code = #AMB (exactly)
* class.code ^short = "「AMB:外来(ambulatory)」固定。本文書は外来診療における処方箋を対象としているため、外来に限定される。救急の場合も外来と指定する。入院の院内処方箋での仕様は別途作成する。"
* class.display = "外来" (exactly)
* class.display MS