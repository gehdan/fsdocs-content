# ML-Column

Framework Studio bietet einen Mechanismus, um Dateninhalte in mehreren Sprachen zu speichern.

Eine beliebige Tabellen-Spalte, in der eine Zeichenkette abgelegt ist, kann im Tabelleneditor als **MLColumn** markiert werden. Vorraussetzung ist jedoch, dass die Tabelle die Spalte **FSRowID** enthält, weil diese als eindeutige Referenz auf den Datensatz benötigt wird.

Ist eine Tabellen-Spalte als **MLColumn** gekennzeichnet, dann werden die fremdsprachigen Texte in der Tabelle [dbRun_MLStrings](../tables/dbrun_mlstrings.md) abgelegt. Die normale Tabellen-Spalte beinhaltet die Texte in Default-Sprache.

## Customizing-Package

Die Eigenschaft **MLColumn** kann im Customizing-Package gesetzt werden. Somit kann man in Kunden-Umgebungen den Mechanismus gezielt für die gewünschten Tabellen-Spalten aktivieren.

## Anwendung in Default-Sprache

Die Default-Sprache ist `de` - außer man definiert über die Tabelle [ML_Config](../tables/ml_config.md) eine andere Default-Sprache.

Wird die Anwendung in der Default-Sprache gestartet, dann arbeitet Framework Studio mit der ganz normalen Spalte der Tabelle - ohne jegliche Sonder-Logik.

Die fremdsprachigen Texte können nicht beeinflusst werden. Ändert man einen Text, dann bleiben die ggf. existierenden Übersetzungen unverändert erhalten. Bei Bedarf müsste man die Anwendung anschließend in den Fremdsprachen starten und den gewünschten Text dort ebenfalls anpassen.

## Anwendung in Fremdsprache

Startet man die Anwendung mit einer Fremdsprache, dann greifen besondere Mechanismen. Die entsprechenden Component-Properties behandeln dann ausschließlich den fremdsprachigen Text mit einem Fallback auf die Default-Sprache.

Die ML-Column-Logik wird von den ganz normalen Component-Properties behandelt. Dadurch wirkt sie sich automatisch auf alle Bereiche der Anwendung aus - inkl. Form-Databinding und Reporting.

* **Load**: Beim Zugriff auf das entsprechende Component-Property wird der Text aus der Tabelle dbRun_MLStrings gelesen. Existiert dort kein Eintrag, wird der Text der Default-Sprache aus der normalen Tabellen-Spalte verwendet.

* **Update**: Wird der Text geändert, dann wird der Eintrag in der entsprechenden Fremdsprache überschrieben. Der Text in der Default-Sprache kann nicht verändert werden. Wird der fremdsprachige Text geleert, dann wird beim Save der Component der Eintrag aus der Übersetzungs-Tabelle gelöscht und das Component-Property fällt auf die Default-Sprache zurück.

* **Insert**: Beim Anlegen eines neuen Datensatzes wird der eingegebene Text sowohl in der normalen Tabelle als auch in der Fremdsprache gespeichert.

> [!IMPORTANT]
> Die Sprache ist mit dem Start der Anwendung am GlobalObject festgelegt. Es gibt keine Möglichkeit, zur Laufzeit auf die Sprache Einfluss zu nehmen oder die Texte in einer spezifischen Sprache zu behandeln.
