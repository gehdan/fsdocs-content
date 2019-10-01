# FrameworkCompiler

Der FrameworkCompiler ist ein besonderer Benutzer innerhalb von **Framework Studio**. Seine Hauptaufgabe besteht darin, den kompilierten Code einer Anwendung, den sog. Saved-Code, in das Repository zu schreiben.

Hintergrund ist das Entwicklungsmodell von **Framework Studio**. Mehrere Entwickler arbeiten an einer Anwendung, checken Elemente aus und ein. Der FrameworkCompiler ist die Instanz, die alle Änderungen zu einem gesamten funktionierenden Stand zusammenfügt. Dies könnte z.B. nachts über einen Job stattfinden, da zu dieser Zeit normalerweise auch kein Entwickler angemeldet ist.

> [!WARNING]
> Der FrameworkCompiler kann selbst keine Objekte auschecken und bearbeiten. Siehe hierzu **Benutzer bearbeiten** TODO! Link.

Ein Compile-Vorgang mit dem FrameworkCompiler hat folgenden Ablauf:

* Als erstes wird der Workspace des FrameworkCompiler aktualisiert. Hier werden alle von den Entwicklern eingecheckten Objekte herangezogen.
* Danach wird der gesamte Code kompiliert. Der Quellcode (Saved Code) sowie die daraus erzeugten Assemblies werden nach einem erfolgreichen Compile-Vorgang in die Datenbank geschrieben.
* Nun wird der Compile-Stamp des FrameworkCompilers aktualisiert. Hieran wird festgesetzt, ob die Entwickler mit einem aktuellen Workspace arbeiten oder nicht.

Ein erfolgreicher Durchlauf des FrameworkCompilers stellt somit sicher, dass sich im Repository ein sauberer Entwicklungsstand mit jeglichem Source Code und jeglichen Assemblies befindet, auf dem die Entwickler ihre tägliche Arbeit aufbauen können.
