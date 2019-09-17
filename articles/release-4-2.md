# Release-Information Framework Studio 4.2

## 4.2 Beta 1 (13.09.2019)

Die Auslieferung umfasst das Paket

* FS_4.2.0_Beta_1_Setup_x64

Alle anderen Pakete wie Print-Service, Client-Launcher und Requirements können weiter aus Framework Studio 4.0 verwendet werden.

#### Neuerungen

Die Neuerungen finden Sie unter [Neuheiten 4.2](neuheiten-4-2.md)

#### Korrigierte Fehler

Neben den Fehlern, die bereits bis einschließlich Framework Studio 4.0.14 korrigiert wurden, wurden in Framework Studio 4.2 die folgenden Fehler korrigiert:

* 2019089003 - **Doku-System**: Ausgeblendete Controls (hidden/Collapsed) werden im Doku-Screenshot
    nicht gerendert.

* 2019099502 - **Repository**: Alle Sublabeled Tabellen sollen aus Performance-Gründen mit einem Index
    auf die PackageID-Spalte versehen werden.

Die folgenden Fehler wurden bereits für die Version 4.0.15 korrigiert und sind in der 4.2 Beta 1 ebenfalls korrigiert:

* 2019099320 - **Java-Client**: Im Metal Look & Feel wird an der aktiven Tab-Page eine falsche Border
    gezeichnet.

* 2019068382 - **Java-Client**: Unter Linux und MacOS werden die Menüs falsch dargestellt.

    *Auf nicht-Windows-Systemen wird empfohlen, das Look & Feel "Metal" zu verwenden.
    Im Look & Feel "Default" können weiterhin Probleme auftreten.*

* 2019099428 - **Java-Client**: Wird eine Datei sehr schnell per Drag&Drop auf die Anwendung gezogen,
    kann es nach Auswahl einer D&D-Aktion zu einer "Java-Exception: null" kommen.

* 2019047700 - **IDE**: Suche: Combobox zur Einschränkung auf den Elementtyp wird nicht angezeigt.

* 2017099728 - **IDE**: Im Service-Release ist der Get- und Set-Method-Code von Properties
    manchmal fälschlicherweise editierbar.

* 2019099379 - **IDE**: Wird im Run-Wizard bei einer Connection-Group das Runtime-Repository angegeben,
    und die dazugehörigen Connection steht nicht auf "Imported", dann prüft der der Update-Assistent
    von eNVenta diese Datenbank auf Änderungen. Dabei werden auch die Trigger des Repositories erkannt
    und zum Deaktivieren angeboten. Das hat erhebliche Fehlfunktionen im Repository zur Folge.

    *Repository-Trigger werden jetzt erkannt und vom Update-Assistenten ignoriert.*

* 2019088935 - **Package-Merge**: Die Eigenschaft "Include Base Reports" an ReportDocumentTypes
    soll generell nicht übertragen werden. Der Wert im Ziel-Package muss unverändert erhalten bleiben.