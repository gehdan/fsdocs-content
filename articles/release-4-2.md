# Release-Information Framework Studio 4.2

## 4.2 Beta 3 (09.10.2019)

Die Auslieferung umfasst das Paket

* FS_4.2.0_Beta_3_Setup_x64

Alle anderen Pakete wie Print-Service, Client-Launcher und Requirements können weiter aus Framework Studio 4.0 verwendet werden.

#### Neuerungen

* [Barcode-Scanner](../doc/html-client/barcode.md) im Mobile-Client
* [Find unused MLKeys](../doc/mlkey/mlkey-cleanup.md#checkbox-find-unused-mlkeys) in MLKeys Cleanup
* Code-Suche nach MLKeys - ControlTypes und Component-Properties werden gefunden
* Language Translation Editor wurde entfernt

#### Korrigierte Fehler

* 2019037512 - **Java-Client**: Wird zur Laufzeit die Schriftgröße eines Grids geändert
    (per Action oder Client Side Customizing), dann werden einige Anpassungen nicht nachgezogen:<br/>
  o Die Breite der Spalten wird nicht neu berechnet<br/>
  o Die Zeilen-Höhe wird nicht angepasst<br/>
  o Die Beschriftungen im Spalten-Kopf behalten ihre Schrift-Größe bei<br/>
  o Die Zeilen-Nummern im Row-Header behalten ihre Schrift-Größe bei<br/>

* 2019099555 - **Oracle**: Im Update-Assistent kann es vorkommen, dass die Namen für den
    IXROWID_-Index nicht eindeutig sind.

* 2019109954 - **Runtime Supervisor**: Beim Senden von Logs von Observables zum Runtime
    Supervisor kann es zum Deadlock kommen.

* 2019099617 - **IDE**: Werden in Dialog "Manage Themes" neue Themes angelegt oder bestehende
    Themes geändert, dann werden diese nicht im Repository gespeichert. Sie werden zwar in der
    laufenden Sitzung angezeigt, aber beim nächsten Login sind die Änderungen verschwunden.

* 2017099863 - **IDE**: Beim Kopieren eines Forms werden zu den enthaltenen AccessUnits die
    Parent-Informationen nicht kopiert. Alle AccessUnits hängen im Ziel-Form unter "Root".

## 4.2 Beta 2 (18.09.2019)

Die Auslieferung umfasst das Paket

* FS_4.2.0_Beta_2_Setup_x64

Alle anderen Pakete wie Print-Service, Client-Launcher und Requirements können weiter aus Framework Studio 4.0 verwendet werden.

> [!IMPORTANT]
> Wenn Sie bereits mit der Beta 1 ein Repository auf 4.2 upgedatet oder ein neues Repository angelegt haben, dann führen Sie bitte die folgende Aktion aus:
>
> * Im Programm-Verzeichnis die **FrameworkStudioUpgradeDatabase.exe** starten und am Repository anmelden.
> * Den Update ausführen, um die verbleibenden 2 Scripte auszuführen.

#### Korrigierte Fehler

* 2019099609 - **Broker**: Ist an einem Form-Control die Caption mit expliziten fremdsprachigen
    Text überschrieben, dann ziehen diese nicht zur Laufzeit. Es werden die Texte des MLKeys aus
    der Basis angezeigt.

* 2019099613 - **Repository**: Beim Update des Repositories von Version 3.11 auf 4.2 gibt es
    eine Exception im Script `4.0.0.0 2017.12.31 Version 4.0.0.0`.

* 2019099616 - **Repository**: Beim Update auf die Version 4.2 werden in den Text-Collections des
    System-Packages (ctDocumentationTexts, ctSystemMessages) die Texte durch MLKeys ersetzt.
    Dadurch sehen ältere FS-Versionen keine Texte mehr und es kommt zu Fehlern - z.B. beim
    Dokumentations-Export.

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

    > [!NOTE]
    > Auf nicht-Windows-Systemen wird empfohlen, das Look & Feel "Metal" zu verwenden.
    > Im Look & Feel "Default" können weiterhin Probleme auftreten.

* 2019099428 - **Java-Client**: Wird eine Datei sehr schnell per Drag&Drop auf die Anwendung gezogen,
    kann es nach Auswahl einer D&D-Aktion zu einer "Java-Exception: null" kommen.

* 2019047700 - **IDE**: Suche: Combobox zur Einschränkung auf den Elementtyp wird nicht angezeigt.

* 2017099728 - **IDE**: Im Service-Release ist der Get- und Set-Method-Code von Properties
    manchmal fälschlicherweise editierbar.

* 2019099379 - **IDE**: Wird im Run-Wizard bei einer Connection-Group das Runtime-Repository angegeben,
    und die dazugehörigen Connection steht nicht auf "Imported", dann prüft der der Update-Assistent
    von eNVenta diese Datenbank auf Änderungen. Dabei werden auch die Trigger des Repositories erkannt
    und zum Deaktivieren angeboten. Das hat erhebliche Fehlfunktionen im Repository zur Folge.

    > [!NOTE]
    > Repository-Trigger werden jetzt erkannt und vom Update-Assistenten ignoriert.

* 2019088935 - **Package-Merge**: Die Eigenschaft "Include Base Reports" an ReportDocumentTypes
    soll generell nicht übertragen werden. Der Wert im Ziel-Package muss unverändert erhalten bleiben.
