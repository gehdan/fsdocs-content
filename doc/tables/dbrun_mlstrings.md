# dbRun_MLStrings (Business-Tabelle)

In dieser Tabelle werden die Fremdsprachen-Texte der Anwendung abgelegt.

Die FS-Update-Logik erzeugt und aktualisiert diese Tabelle automatisch.

|Spalte         | Beschreibung|
|---------------|---|
|ML_TableName   |Der Name der Tabelle (Uppercase)|
|ML_ColumnName  |Der Name der MLColumn-Spalte (Uppercase)|
|ML_FSRowID     |Die FSRowID des referenzierten Datensatzes. Diese kann für SQL-Abfragen verwendet werden.|
|ML_Iso         |Der 2-stellige Iso-Code der Fremdsprache (Lowercase)|
|ML_Text        |Der fremdsprachige Text (Langtext)|
