# Funktionsumfang

Der HTML-Client befindet sich noch in der agilen Entwicklung. Verglichen mit dem ausgereiften JavaClient ist der Funktionsumfang des HTML-Clients noch überschaubar. Neue Funktionen und die Unterstützung für weitere Controls werden kontinuierlich weiter entwickelt und veröffentlicht.

> [!NOTE]
> Wird in diesem Kapitel etwas nicht erwähnt, wie z.B. ein Property eines Controls, eine Action oder andere Client-Funktionalitäten, so muss davon ausgegangen werden, dass diese noch nicht unterstützt werden.

## Handhabung von nicht unterstützten Funktionalitäten

Es gibt im Form Designer oder im Code Editor von Framework Studio keine Limitierungen, die den Entwickler auf den Funktionsumfang des HTML-Clients einschränken. Werden Controls, Actions oder anderweitige Funktionalitäten genutzt, die vom HTML-Client nicht unterstützt werden, so werden diese (so weit es möglich ist) vom Client ignoriert. Wenn z.B. ein Grid-Control in ein Form eingebaut wird, so wird dieses erst garnicht vom HTML-Client interpretiert. Dasselbe gilt für nicht unterstützte Properties an Controls.

## Frameset

Der HTML-Client besitzt kein Frameset. Alle geöffneten Forms werden in einer einzigen Liste organisiert. Es ist irrelevant, welchem Frame ein Form in einem Workflow zugeordnet ist.

## MessageBox und ExceptionBox

Werden vollständig unterstützt inkl. Buttons, Icons, DialogResult und EventHandler. Werden im Client als modale Popups angezeigt.

## Modale Forms

Modale Forms, die das Wechseln zu einem anderen Form unterdrücken, werden vom HTML-Client vollflächig angezeigt. Dabei wird der Menü-Button ausgeblendet.

Verhalten beim Drücken des „Zurück“-Button auf einem mobilen Gerät:

* Wenn am Form das Property IsCloseIconVisible auf true gesetzt ist, wird der modale Dialog geschlossen.
* Wird dem Form über die Action SetCloseButton ein Button zugewiesen, dessen Click-Event beim Schließen ausgelöst werden soll, wird dies beim Drücken des Zurück-Button ebenfalls ausgelöst.

## Drag & Drop

Drag & Drop und alle damit verbundenen Events werden vom HTML Client nicht unterstützt.

## Shortcuts und ToolTips

Da für den HTML-Client die mobile Welt im Vordergrund steht, werden Shortcuts und ToolTips noch nicht unterstützt, da diese auf einem Handy bzw. Tablet keinen Sinn machen.

## Control Styles

Control Styles werden für alle im HTML-Client verfügbaren Controls unterstützt. Wird im Form Designer einem Control ein Control Style zugeordnet, so werden dessen Properties korrekt interpretiert bzw. die Property-Hierarchie beachtet.

## Actions

Es werden derzeit folgende Actions unterstützt:

* SetEnabled
* SetVisible
* SetCloseButton
* Schließen eines Forms durch den Broker mit "this.Close()"

## Zurück-Button auf mobilen Geräten

Mobile Geräte (z.B. Android) besitzen teilweise einen Zurück-Button. Der HTML Client unterstützt diesen kontextabhängig. Es gibt drei Prioritätsebenen, die nacheinander durchlaufen werden. Wird in einer Ebene auf das Drücken des Zurück-Buttons reagiert, so werden die darunter liegenden Ebenen nicht mehr behandelt.

Die Ebenen geordnet nach Priorität sind:

1. Overlays
2. Modale Dialoge
3. Normale Anzeige

### Overlays

Als Overlay definiert sich alles, was sich mit einem ausgegrauten Hintergrund über die restliche Anzeige legt, wie z.B. MessageBoxen oder die ComboBox-Auswahl. Wenn ein Overlay geöffnet ist und der Zurück-Button gedrückt wird, wird das Overlay geschlossen. Eine MessageBox kann nur durch den Zurück-Button geschlossen werden, wenn ein Abbrechen-Button vorhanden ist.

### Modale Dialoge

Modale Dialoge können mit dem Zurück-Button geschlossen werden, wenn das Property IsCloseIconVisible am Form auf true gesetzt ist.
Wurde dem Form über die Action SetCloseButton ein Button mit einem Click-Event zugeordnet, so wird beim Drücken des Zurück-Buttons das Click-Event ausgelöst.

### Normale Anzeige

Befindet sich der HTML Client in einem normalen Form, wird beim Drücken des Zurück-Buttons das Beenden der Application angestoßen, was mit der Rückfrage, ob die Session beendet werden soll, einher geht.

Befindet sich der HTML Client im Broker-Auswahldialog, wird die Anwendung ohne Rückfrage geschlossen.
