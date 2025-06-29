
' Simulated Malware Sample - invoice.vbs
' This script is for CTF and learning, there is no actual malware

Dim objXML, objShell, url, response
Set objXML = CreateObject("MSXML2.XMLHTTP")
Set objShell = CreateObject("WScript.Shell")

' Should return b64
url = "https://pastebin.com/raw/eqkzMd2M"

' Retrieve the content
objXML.Open "GET", url, False
objXML.Send
response = objXML.responseText

' Display the fetched content with a security reminder
MsgBox response & vbCrLf & vbCrLf & "You really shouldn't just double-click to open scripts you download from the Internet :(", _
       vbOKOnly + vbExclamation, "Warning"


