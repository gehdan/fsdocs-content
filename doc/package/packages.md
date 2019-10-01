# Packages

Ein **Package** kapselt funktionale Erweiterungen und Veränderungen der Anwendung.

Eine mit **Framework Studio** erstellte Anwendung setzt sich immer aus mehreren Packages zusammen. Aus welchen Packages letztendlich eine Anwendung zusammengesetzt ist, steht zur Entwicklungszeit eines Packages nicht fest. Klar definiert ist nur, welche Packages vorausgesetzt werden.

Einzelne Packages einer Anwendung können von unterschiedlichen Herstellern entwickelt werden und mit Packages anderer Hersteller kombiniert werden.

Hauptvorteil des Package-Konzepts von **Framework Studio** sind die Customizing Möglichkeiten. Kunden und Partnerunternehmen können durch das Hinzufügen eines zusätzlichen Packages die Anwendung nahezu ohne Einschränkungen funktional erweitern und verändern. Dabei sind sogar Erweiterungen an zentralen Datenstrukturen, Datenbanktabellen und Prozessabläufen möglich.

## SystemPackage

Wenn Sie ein leeres Repository anlegen, enthält dieses Repository immer automatisch ein Package mit dem Namen **SystemPackage**. An diesem Package können Sie sich beim Start von **Framework Studio** nicht anmelden, da am **SystemPackage** keine Veränderungen vorgenommen werden können.

Das **SystemPackage** enthält einige grundlegende Namespaces und Elemente, die von jeder Anwendung benötigt werden.

## Default Package

Mit Default Package wird das Package bezeichnet, welches in der Verwendungsreihenfolge der Packages direkt oberhalb des SystemPackages angeordnet ist. Dieses Package hat einige Besonderheiten:

* Am Default Package werden die Sprachen definiert, die grundsätzlich von der Anwendung unterstützt werden sollen.

* Verschiedene Default Packages lassen sich mit der aktuellen **Framework Studio** Version nicht zusammen führen.

* Im Default Package werden alle Standard Controls (Default Control Styles(**!TODO LINK**) ) angezeigt.

Ein Default Package muss mit dem Package Manager (Package Manager(**!TODO LINK**)) angelegt werden, bevor es genutzt werden kann.

## Weitere Packages

Mit Hilfe des Package Managers (Package Manager(**!TODO LINK**)) können weitere Packages zu einem Repository hinzugefügt werden. Dort wird auch definiert, in welcher Reihenfolge die Packages benutzt werden sollen und welche anderen Packages Voraussetzung für die Verwendung eines Packages sind.

## Aktives Package

Mit **aktivem Package** wird das Package bezeichnet, an dem sich der Benutzer beim Start von **Framework Studio** angemeldet hat. Nur an diesem Package kann der Benutzer Veränderungen durchführen.

Synonym dazu wird auch der Begriff **Top Package** verwendet.

## Customizing

Mit **Customizing** wird der Vorgang bezeichnet, bei dem man Änderungen an einem Element aus einem Package vornimmt, das nicht das aktive Package ist. Da Änderungen immer nur im aktiven Package durchgeführt werden können, wird dazu von dem gewünschten Element eine **Customization** im aktiven Package angelegt. An dieser Customization können die gewünschten Änderungen dann vorgenommen werden.

Technisch gesehen ist eine Customization eine Ableitung vom originalen Element. Diese Ableitung wird dann in der gesamten Anwendung statt des Originalen Elements verwendet.
Das Anlegen einer Customization erfolgt über den Button ![button-customizing.png](../media/button-customizing.png) Customize ([Buttons](../ide/allgemeine-funktionatitaeten.md#buttons)).

> [!WARNING]
> Wenn ein Element über das Kontextmenü mit der Funktion **Change Namespace…** in einem anderen Package in einen anderen Namespace verschoben wurde, so muss das Element, wenn eine Customization im aktiven Package existiert, über das Kontextmenü seines Namespaces mit der Funktion **Adjust moved customizations …** auch im aktiven Package in den neuen Namespace verschoben werden.
