# Metadatentypen

Die Idee der Metadatentypen kommt daher, dass bestimmte Felder innerhalb einer Anwendung immer wieder auftauchen (z.B. Artikelnummer, Kundennummer, ...). Deshalb können solche Felder an einer zentralen Stelle definiert werden, was Fehler in der Felddefinition verhindert und Redundanzen minimiert. Dabei werden Informationen wie das Label, das Datenformat, das zugehörige Control, die mehrsprachige Bezeichnung usw. hinterlegt, so dass sich der Arbeitsaufwand bei der späteren Arbeit mit dem Metadatentypen minimiert.

## Metadatentypen bearbeiten

Um einen Metadatatypen zu bearbeiten, doppelklicken Sie den entsprechenden Eintrag auf der Registerkarte **Namespaces**. Der Metadatentyp wird im Hauptfenster des **Framework Designers** angezeigt.

![MDT-Designer](media/mdt-designer.png)

Der Metadatentyp kann in verschiedenen Teilen der Anwendung zum Einsatz kommen:

* Er kann auf unterster Ebene der Spalte einer DBTable zugeordnet werden.
* Er kann in Components oder Forms als Datentyp für Properties verwendet werden.

Deshalb nehmen Sie an einem Metadatentyp verschiedene Einstellungen vor:

* **Name**:
Geben Sie die Bezeichnung des Metadatentyps an.

* **Datatype Database**:
Benennen Sie den Datentyp der Spalte in der Datenbank.

* **Datatype Application**:
Gibt den FS-Datentyp des Metadatentyps an. Dieser Datentyp wird später in den **Components** und **Forms** gezogen.

Die folgende Tabelle zeigt, welche Database-Datatypes mit welchem Application-Datatype kombiniert werden können:

|              | FSbool | FSbyte | FSbyteArray | FSDateTime | FSdecimal | FSdouble | FSfloat | FSint | FSlong | FSshort | FSstring |
|-------------:|:------:|:------:|:-----------:|:----------:|:---------:|:--------:|:-------:|:-----:|:------:|:-------:|:--------:|
| Binary       |        |        |      X      |            |           |          |         |       |        |         |          |
| Boolean      |    X   |        |             |            |           |          |         |       |        |         |          |
| Byte         |        |    X   |             |            |           |          |         |       |        |         |          |
| Date         |        |        |             |      X     |           |          |         |       |        |         |          |
| DateTime     |        |        |             |      X     |           |          |         |       |        |         |          |
| Time         |        |        |             |      X     |           |          |         |       |        |         |          |
| Double       |        |        |             |            |           |     X    |         |       |        |         |          |
| Currency     |        |        |             |            |     X     |     X    |    X    |       |        |         |          |
| Single       |        |        |             |            |     X     |     X    |    X    |       |        |         |          |
| Decimal      |        |        |             |            |     X     |          |         |       |    X   |         |          |
| Big Int      |        |        |             |            |           |          |         |       |    X   |         |          |
| Integer      |        |        |             |            |           |          |         |   X   |    X   |         |          |
| Smallint     |        |        |             |            |           |          |         |   X   |    X   |    X    |          |
| Tiny Int     |        |        |             |            |           |          |         |   X   |    X   |    X    |          |
| Ansi String  |        |        |             |            |           |          |         |       |        |         |     X    |
| Long Varchar |        |        |             |            |           |          |         |       |        |         |     X    |
| String       |        |        |             |            |           |          |         |       |        |         |     X    |
| null         |    X   |    X   |      X      |      X     |     X     |     X    |    X    |   X   |    X   |    X    |     X    |

> [!WARNING]
> Wenn Sie die Datentypen nachträglich ändern, kann das evtl. Auswirkungen auf Programmteile haben, die diesen Metadatentypen bereits verwenden. Unter Umständen lassen sich diese Programmteile nicht mehr kompilieren.

Die Einstellungen für Size, Precision und Scale hängen von der Auswahl des **Datatype Database** ab. Je nachdem, ob der Datenbank-Datentyp Zeichen, Ganzzahlen oder Gleitkommazahlen unterstützt, sind die Felder für Eingaben zugänglich.

* **Size**:
Definiert die Feldlänge bei Zeichenfeldern.

* **Precision**:
Anzahl der Stellen inkl. eventueller Nachkommastellen bei numerischen Feldern. 

* **Scale**:
Anzahl der Nachkommastellen bei **Dezimal**-Feldern.

* **Format**:
Gibt das Anzeige-Format des Felds an. Das Format wirkt sich in der Darstellung des Felds auf einem Form aus.

* **Format Pattern**:
Wird im Feld Format **User Defined** gewählt, ist es möglich hier selbst ein Format anzugeben. Es können Formate für Zahlen, Daten und Zeichenketten entsprechend der Standard-Definition für reguläre Ausdrücke eingegeben werden.
