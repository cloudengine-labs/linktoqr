package main

import (
	"fmt"
	"html/template"
	"net/http"
)

var templ = template.Must(template.New("qr").Parse(templateStr))

func RenderHtmlPage(w http.ResponseWriter, req *http.Request) {
	fmt.Println("\nQR Converter Page Accessed.. ")
	err := templ.Execute(w, req.FormValue("url"))
	if err != nil {
		// Handle the error if any and return
		http.Error(w, err.Error(), http.StatusInternalServerError)
		return
	}
}

const templateStr = `
<html>
<head>
<title>Link to QR Generator</title>
</head>
<body>
<h2>Convert URL to QR</h2>
{{if .}}
<img src="http://chart.apis.google.com/chart?chs=300x300&cht=qr&choe=UTF-8&chl={{.}}" />
<br>
{{.}}
<br>
<br>
{{end}}
<form action="/" name=f method="GET">
<input maxLength=1024 size=70 name=url value="" title="Text to QR Encode">
<input type=submit value="Show QR" name=qr>
</form>
</body>
</html>
`
