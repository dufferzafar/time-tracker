#Include libs\oXML.ahk

xmlpath := A_ScriptDir "\Schema.xml"

doc := oXML_Create(xmlpath)
root := doc.documentElement

oXML_AddNode(doc, "tracker-data", "global")
newAtt := doc.createAttribute("date")
newAtt.value := "16/11/2013"
root.attributes.setNamedItem(newAtt)

; Add 5 Applications to Global
Loop, 5 {
  oXML_AddNode(doc, "global", "application", 0)
  oXML_AddNode(doc, "application", "path", A_Index - 1)
  oXML_AddNode(doc, "application", "seconds", A_Index - 1)

  ; Path to Application
  oXML_InsertText(doc, "path", A_AhkPath, A_Index - 1)

  ; Some Random Number
  Random, Rand, 1, 1000
  oXML_InsertText(doc, "seconds", Rand, A_Index - 1)
}

; Msgbox % TidyUp(doc.xml)
oXML_Save(doc, xmlpath)
