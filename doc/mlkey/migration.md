# MLKey Migration

Ziel ist es, dass alle Texte aus den Records entfernt und in das Wörterbuch übertragen werden. Die Records erhalten dafür die MLKeys.

## Abwärts-Kompatibilität

Texte, die bisher an den Records definiert sind, funktionieren auch weiterhin, weil jeder MLString neben dem MLKey explizit gesetzte Texte versteht. So kann man nach dem Update auf die Version 4.2 die Migration in aller Ruhe angehen.

> [!NOTE]
> In Kunden-Umgebungen ist die Umstellung der eigenen Texte auf MLKeys empfohlen. Sie ist aber nicht zwingend notwendig.

Das hat aber langfristig einige Nachteile zur Folge - insbesondere in Hinblick auf die Mehrsprachigkeit der Anwendung:

* Der Language Export / Import funktioniert nur für das Wörterbuch. Individuelle Texte an Records werden nicht (mehr) berücksichtigt.
* Das Pflegen von Fremdsprachen an den Records ist sehr aufwändig. Die MLKeys aus dem Wörterbuch bringen hingegen die Übersetzungen automatisch in alle Bereiche der Anwendung.

> [!IMPORTANT]
> Funktionale Packages, die als Produkt an mehrere Kunden vertrieben werden, sollten in jedem Fall migriert werden.

## MLKeys zuordnen

Im Customizing kann man grundsätzlich 2 verschiedene Arten von überschriebenen Texten unterscheiden:

1. Texte, die eine ganz neue Bedeutung haben.

    Wenn z.B. ein relativ allgemeiner Metadatentyp in einem Component-Property verwendet wird, wird dort am Default-Label ein neuer Text formuliert.

    In diesen Fällen sollte auf jeden Fall ein entsprechender ggf. neuer MLKey zugeordnet werden.

2. Ändern eines bestehenden Textes.

    Es wird z.B. ein Metadatentyp customized und das Default-Label geändert - aus dem Begriff "Angebot" wird z.B. "Offerte". Die Bedeutung bleibt aber dieselbe.

    In solchen Fällen gilt es zu prüfen, ob es evtl. ratsam ist, diese Änderung direkt im Wörterbuch vorzunehmen. So zieht diese für die gesamte Anwendung. Bei der Migration weist man dann diesen Einträgen den existierenden MLKey zu - auch wenn er identisch mit dem bereits zugeordneten MLKey aus dem Basis-Package sein sollte. In einem späteren Schritt der Migration wird eine redundante Zuordnung dann automatisch eliminiert.

## MLKeys übertragen

Ist das Wörterbuch komplett vorbereitet, ist es an der Zeit, die MLKeys in die Records zu übertragen.

In diesem Schritt werden alle Aktionen ausgeführt, die einen Checkout der Records zur Folge haben. So wird die ggf. erhebliche Menge an Checkouts auf das nötigste reduziert.

### (1) Als FCUser anmelden

Weil nach der Konvertierung sehr viel kompiliert werden muss, ist es empfehlenswert als **FCUser** zu arbeiten. So kann direkt nach dem Kompilieren der **Complete Framework Compiler** aufgerufen werden und es ist kein zusätzlicher FrameworkCompiler nötig.

* Mit dem Benutzer FrameworkCompiler anmelden - mit Refresh Workspace. Get DLLs ist nicht notwendig.
* Framework Studio direkt wieder beenden.
* Jetzt als FC-User anmelden - mit Refresh Workspace. Das übernimmt den Workspace vom Benutzer FrameworkCompiler.

### (2) Apply MLKeys

Im Fenster **Multilanguage Text Migration**  mit dem Button **Load Data** (inkl. den Tooltips) alle Daten einlesen. Es sollte jetzt keine offenen Zuordnungen mehr geben - wenn man die Checkbox **Show only missing keys** setzt, dürfen keine Einträge angezeigt werden.

Mit dem Button **Apply MLKeys** wird die Routine gestartet. Es werden alle zugeordneten MLKeys an die entsprechenden Properties der Records übertragen. Dabei werden ALLE in den jeweiligen Sprachen gesetzten Texte aus den Records entfernt. Somit ziehen ab diesem Zeitpunkt die Texte nur noch aus dem Wörterbuch.

### (3) Convert Messages

Mit dem Button **Convert Messages** im Fenster **Multilangage Text Migration** wird die Routine gestartet. Für diese Routine müssen keine Daten eingelesen werden - das gilt auch, wenn sie zu einem späteren Zeitpunkt erneut gestartet wird.

Es werden alle Methoden-Codes analysiert und nach Exceptions- und MessageBox-Aufrufen gesucht. Diese werden in das neue Message-Format umgewandelt und die Verweise auf die Text-Collections werden durch den entsprechenden MLKey ersetzt.

> [!WARNING]
> Die Routine **Apply MLKeys** muss zuvor ausgeführt worden sein, damit die Message-TextCollections sauber zugeordnete MLKeys besitzen.

Alter Exception-Code vor der Konvertierung:

```csharp
#region Required for Exception Editor support. Do not modify manually.
//Component type is required.
//Severity: 0 ; Buttons: OK; Icon:Error
throw new FrameworkApplicationException (String.Format(FSGeneral.ctMessagesFactory.Get(this.Global,3550).Value[Global.SelectedLanguage],new object []{}),0 );
//<ExceptionEditor TextColl="Messages" ID ="832e0e50c2b748068ba38a2c4422aaab" Severity="0" EHID=""  ></ExceptionEditor>
#endregion End of generated section
```

Neuer Exception-Code nach der Konvertierung:

```csharp
// FSCodeMessage: Component type is required.
throw new FrameworkApplicationException(this.Global.GetMLKeyText(MLKeys.MSG_445559f2ca44452e8d49ca9515b3a83e), 0);
```

Es ist relativ wahrscheinlich, dass Warnings oder sogar Errors ausgegeben werden. Diese können erst einmal ignoriert werden. Es handelt sich dabei um inhaltliche Probleme und nicht um Compile-Errors. Die **Convert Code Messages** Routine kann zu einem späteren Zeitpunkt erneut ausgeführt und diese Probleme dann behoben werden.

> [!IMPORTANT]
> Damit sind die Message-Text-Collections jetzt obsolete.
> Sie dürfen aber nicht gelöscht oder geleert werden, weil sie ggf. noch von Customizing-Packages referenziert werden.

### (4) MLStrings Cleanup

Nachdem alle MLKeys übertragen wurden, können jetzt noch einige Bereinigungen durchgeführt werden.

Über das Menü **Tools / Checks / MLStrings Cleanup** kann das Cleanup-Fenster geöffnet werden.

Dort stehen mehrere Routinen zur Auswahl. Diese sollten einer nach der anderen ausgeführt werden. Dabei ist es ratsam zuerst den Button **Analyze** zu benutzen. Erst nach der Sichtung der Infos und Warnings wird die Routine mit dem Button **Cleanup** ausgeführt.

1. **Clean MLKeys**

    Wird in einem Record (z.B. DBColumn, Form-Control) der MLKey mit demselben Wert überschrieben, wie er in der Basis (z.B. Metadatentyp, Basis-Package) definiert ist, dann wird diese Überschreibung entfernt.

2. **Transfer translations**

    Wurden trotz vererbtem MLKey Übersetzungen nur an Records gepflegt, dann wurden diese mit der Migration ggf. nicht in das Wörterbuch übertragen. Das wird mit dieser Routine nachgeholt.

    Wird an einem Record, der einen MLKey besitzt, eine Übersetzung gefunden und das Wörterbuch kennt diese noch nicht, wird diese in das Wörterbuch übertragen und der Text vom Record entfernt.

    Dabei gewinnt pro MLKey der erste Record. Wird ein weiterer Record mit gleichem MLKey aber einer anderen Übersetzung gefunden, dann wird dieser als Warning ausgegeben. Beim Cleanup verbleibt dieser Text am Record. Bei einem weiteren Lauf würde dieser Record mit der Routine Clean individual texts gefunden werden.

3. **Clean individual texts**

    Die MLKey-Migration berücksichtigt nur Texte, die mindestens in Deutsch und Englisch gepflegt sind. Sind an einem Record nur andere Sprachen definiert, dann wird dieser Text nicht migriert. Oftmals erben diese Records schon einen Text aus der Basis und es sind nur einige Übersetzungen gepflegt. Diese sollen hier bereinigt werden.

    Es werden Texte, die identisch mit dem Wörterbuch sind, entfernt. Vom Wörterbuch abweichende Texte werden als Warning ausgegeben und NICHT entfernt. Diese müssen in einem weiteren Schritt bearbeitet werden.

4. **Warnings bearbeiten**

    Jetzt müssen die aufgetretenen Warnings begutachtet und ggf. manuell bearbeitet werden.

5. **Clean individual texts** mit **Remove different**

    Wurden im vorherigen Schritt die Warnings begutachtet, können mit dieser Aktion alle abweichenden Texte entfernt werden.

### (5) Compile und CheckIn

Jetzt müssen alle Änderungen compiliert werden. Menü **Compile / Compile Changes**.

Nachdem der Compiler erfolgreich beendet wurde, werden alle Elemente eingecheckt. Dabei sollte ein CheckIn-Kommentar z.B. `MLKey Migration` angegeben werden.

Zum Abschluss noch über den Compile-Manager den Button **Complete Framework Compiler** aufrufen.
