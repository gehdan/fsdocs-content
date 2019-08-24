# MLString

Framework Studio bietet eine durchgängige Unterstützung für die Mehrsprachigkeit. An allen Stellen, an denen für den Anwender sichtbare Beschriftungen, Tooltips oder Meldungstexte gepflegt werden bietet Framework Studio einen Editor zur Bearbeitung von mehrsprachigen Texten (Multi Language String / **MLString**) an.

Der Editor wird in Form einer Tabelle angezeigt, in der die Verschiedenen Sprachen des Textes angezeigt und bei Bedarf auch bearbeitet werden.

Die **fett gedruckten** Angaben sind an dieser Stelle überschrieben. Die normal gedruckten Angaben sind aus dem Basis-Package oder dem Basis-Record geerbt. Siehe auch Abschnitt [Vererbung](#vererbung).

![MLString Designer](media/mlstring-in-designer.png)

An erster Stelle steht immer der **MLKey**. Dieser stellt einen Verweis auf das [Wörterbuch](woerterbuch.md) dar. Es kann direkt ein MLKey eingeben werden oder mit dem Auswahl-Button ein Such-Dialog geöffnet werden. Dabei handelt es sich um den voll funktionsfähigen [Multilanguage Text Editor](woerterbuch.md#multilanguage-text-editor) erweitert um eine Auswahl-Funktion. In diesem Dialog können, wenn kein passender MLKey gefunden wurde, auch ein neuer Key erfasst werden.

Die Texte in den einzelnen Sprachen werden im Designer und auch zur Laufzeit der Anwendung aus dem Wörterbuch ermittelt. Die angezeigten Sprachen und deren Reihenfolge können in den **Options** mit der Einstellung **Languages in designer** eingestellt werden.

> [!IMPORTANT]
> Ist ein **MLKey** angegeben, dann ist es davon abzuraten, einzelne Texte zu überschreiben.

Im **Property-Grid** wird der MLString in einer Zeile dargestellt, die zur Anzeige der einzelnen Sprachen erweitert werden kann.

![MLString Property Grid](media/mlstring-in-property-grid.png)

Die einzeilige Anzeige stellt einen kombinierten Text in Format `@{MLKey} - {deutscher Text}` dar. In diesem Text man auch direkt mit vorangestellten `@`-Zeichen einen anderen **MLKey** eintragen - z.B. `@LBL_ArticleID`.
Ein **MLKey** kann auch (wie oben beschrieben) am entsprechenden MLKey-Eintrag eingetragen oder ausgewählt werden.

## Vererbung

Mit den verschiedenen Records in Framework Studio werden auch die entsprechenden MLStrings vererbt. Dadurch werden im Idealfall die am Metadatentyp definierten Texte über die komplette Kette bis hin zu den Form-Controls durchgereicht.

Ein vererbter Text kann an jeder beliebigen Stelle in der Kette überschrieben werden. Es gibt 2 Möglichkeiten:

1. Einen anderen MLKey zuweisen

    Damit werden alle anderen Texte aus der Basis inkl. MLKeys und den überschriebenen Texten ausgeblendet. Auch wenn der neue MLKey z.B. keinen Text für `fr` definiert hat, wird ein in der Basis definierter `fr` Text ausgeblendet.

2. Einen einzelnen Text überschreiben:

    > [!WARNING]
    > Darauf sollte möglichst verzichtet werden. Wenn lediglich die Übersetzung gepflegt wird, dann erfolgt dies besser im Wörterbuch. Wenn eine abweichende Bedeutung gewünscht ist, dann sollte ein anderer MLKey angegeben werden.

    Das überschreibt nur den Text der entsprechenden Sprache. Die anderen nicht überschriebenen Sprachen werden weiter aus der Basis gezogen.

    > [!CAUTION]
    > In der **eNVenta/WS** Standard-Entwicklung ist das verboten.

Das folgende Bild zeigt eine Vererbungs-Hierarchie. Die Pfeile stellen den Weg dar, über den der Text für das Control ermittelt wird. Dabei wird hier die Sprache `fr` mit den Fallback-Sprachen `en` und `de` verwendet. Der erste Text der auf diesem Weg gefunden wird, wird ausgegeben.

![MLString Vererbung](media/mlstring-vererbung.png)
