# Editfield

* [Properties/Events](xref:FrameworkSystems.FrameworkStudio.General.DevObjects.Form.Designer.ViewModels.EditboxDesignViewModel)

* [Actions](xref:FrameworkSystems.FrameworkControls.Actions.EditboxControlAction)

## Unterstütztes HTML

Wenn die Eigenschaft **Editor** auf den Wert **HTML** gesetzt ist, wird am Datasource des Controls HTML Text erwartet. Das Control bietet keine vollständige Unterstützung von Html. Es folgt ein Überblick über die Einschränkungen:

* Das Control ist zur Darstellung von formatiertem Text gedacht. Daher werden keinerlei Eingabefelder o.ä. unterstützt.

* Textinhalt müssen (selbstverständlich) HTML-Encodiert dargestellt werden.

* Das Control kann nur Zeichen darstellen, die im Zeichensatz der eingestellten Schrift enthalten sind.

* Wenn am Control WordWrap eingeschaltet ist, wird (im Gegensatz zum Plain Text Modus) nur zwischen Worten getrennt. Wenn also ein Wort länger ist als die Control Breite, wird nicht umgebrochen! Dabei ist zu beachten, dass Sonderzeichen wie beispielsweise **`&nbsp;`** als Wortteil betrachtet werden.

* Schriftgrößen, die in Punkten (pt) angegeben sind, werden analog zu allen Schriftgrößenangaben in Framework Studio im Java Client skaliert und in mit Crystal Reports erstellten Dokumenten korrekt angezeigt. Die Definition von Schriftgrößen in einer anderen Einheit als pt wird nicht unterstützt.

* Ist keine Schriftgröße im Html angegeben, wird am Control die im Form Designer angegebene Größe verwendet, in Reports die dort angegebene Größe.

* Jeder Textinhalt muss innerhalb eines `<p>` Tags (Absatz) geklammert sein. Insbesondere werden deshalb die folgenden Tags nicht unterstützt:

  * Überschriften **`<h1> .. <h6>`**

  * Horizontale Linie **`<hr>`**

  * Tabellen **`<table> <tr> <td>`**
  
  * Aufzählungen **`<ol> <ul> <li>`**

  * Scripte **`<script>`**

* Zeilenumbrüche dürfen nicht mit **`<br>`** Tags realisiert werden, da mehrere **`<br>`** Tags hintereinander vom Crystal Reports nicht korrekt dargestellt werden können. Stattdessen müssen mit den Tags **`<p style="margin-top: 0">`** und **`</p>`** Absätze umschlossen werden. **`<p>`** Tags können neben der Definition von margin-top im style Attribut weitere Attribute und Stilangaben enthalten sein.

Im Html-Modus liefert der Datasource den Inhalt eines Body-Elements. Gesetzt werden darf auch ein vollständiges Html-Dokument. In diesem Fall wird der Body automatisch extrahiert.
