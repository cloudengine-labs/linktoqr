// Golang REST API unit testing program
package main

import (
	"net/http"
	"net/http/httptest"
	"testing"
)

// http://localhost:1718/?url=test.com&qr=Show+QR
func TestRenderHtmlPage(t *testing.T) {
	req, err := http.NewRequest("GET", "/?url=test.com&qr=Show+QR", nil)
	if err != nil {
		t.Fatal(err)
	}
	rr := httptest.NewRecorder()
	handler := http.HandlerFunc(RenderHtmlPage)
	handler.ServeHTTP(rr, req)
	if status := rr.Code; status != http.StatusOK {
		t.Errorf("RenderHtmlPage returned wrong status code: got %v want %v",
			status, http.StatusOK)
	}
	expected := `
<html>
<head>
<title>Link to QR Generator</title>
</head>
<body>
<h2>Convert URL to QR</h2>

<img src="http://chart.apis.google.com/chart?chs=300x300&cht=qr&choe=UTF-8&chl=test.com" />
<br>
test.com
<br>
<br>

<form action="/" name=f method="GET">
<input maxLength=1024 size=70 name=url value="" title="Text to QR Encode">
<input type=submit value="Show QR" name=qr>
</form>
</body>
</html>
`
	if rr.Body.String() != expected {
		t.Errorf("RenderHtmlPage returned unexpected body: got %v want %v",
			rr.Body.String(), expected)
	}
}
