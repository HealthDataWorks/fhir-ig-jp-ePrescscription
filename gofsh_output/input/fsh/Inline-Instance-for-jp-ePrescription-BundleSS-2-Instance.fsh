Instance: Inline-Instance-for-jp-ePrescription-BundleSS-2
InstanceOf: Bundle
Usage: #inline
* identifier.system = "urn:ietf:rfc:3986"
* identifier.value = "urn:uuid:3183BE72-A852-4A00-A795-56477F9868D8"
* type = #document
* timestamp = "2021-02-11T20:09:23.976+10:00"
* entry[0].fullUrl = "urn:uuid:180f219f-97a8-486d-99d9-ed631fe4fc57"
* entry[=].resource.resourceType = "Composition"
* entry[=].resource.identifier.system = "urn:oid:1.2.392.100495.20.3.11"
* entry[=].resource.identifier.value = "1311234567-2020-00123456"
* entry[=].resource.status = #final
* entry[=].resource.type = urn:oid:1.2.392.100495.20.2.11#01 "処方箋"
* entry[=].resource.date = "2020-08-21T12:28:21+09:00"
* entry[=].resource.author.reference = "Organization/jp-ePrescription-Organization3SS"
* entry[=].resource.title = "分割処方箋"
* entry[+].fullUrl = "urn:uuid:92834f52-7e62-1840-5c10-771084179379"
* entry[=].resource.resourceType = "Organization"
* entry[=].resource.id = "jp-ePrescription-Organization3SS"
* entry[=].resource.text.status = #generated
* entry[=].resource.text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><ul><li>診療科：01 内科</li></ul></div>"
* entry[=].resource.type = $organization-type#dept
* entry[=].resource.name = "内科"
* entry[=].resource.partOf.reference = "Organization/jp-ePrescription-Organization2SS"