# Message Box Editor / Exception Editor

Wenn Sie eine Methode eines Forms bearbeiten, stehen Ihnen Editoren zum komfortablen Erstellen und Bearbeiten von mehrsprachigen Ausnahmen (Exceptions) und Meldungen (Message-Boxen) zur Verfügung. Diese können Sie über die Buttons ![btn Exception](media/button-exception-editor.png)  **Exception Editor Wizard** und  ![btn MessageBox](media/button-messagebox-editor.png) **Message Box Editor Wizard** aufrufen.

Wenn Sie eine Textcollection ändern, indem Sie beispielsweise einen neuen Eintrag erzeugen oder einen bestehenden Eintrag ändern, dann muss die Textcollection dazu in der aktuellen Version für Sie ausgecheckt werden. Benutzen Sie dazu den Button **Edit Message**. Andere Benutzer können nun die Textcollection nicht bearbeiten. Beim Verlassen des **Message Box Editors** bzw. **Exception Editors** wird die Textcollection automatisch wieder eingecheckt, so dass auch andere Benutzer wieder auf die Textcollection zugreifen können.

Beide Editoren weisen nur sehr geringfügige Unterschiede auf.

![MessageBox Editor](media/messagebox-editor.png)
![Exception Editor](media/exception-editor.png)

Radiobutton **New Message**:

Wenn Sie diesen Radiobutton auswählen, wird ein neuer Text in die ausgewählte Textcollection eingetragen.

> [!IMPORTANT]
> Wenn Sie einen neuen Text hinzufügen, müssen Sie auch die Textcollection kompilieren, da es sonst beim Ausführen des Programms Fehlermeldungen gibt.

Radiobutton **Change Message**:

Wenn Sie diesen Radiobutton auswählen, können Sie mit dem Button **Choose existing Message** einen bestehenden Eintrag aus der angegebenen Textcollection auswählen oder mit dem Button **Search** nach einem bestehenden Eintrag suchen.

Button **Change Collection**:

Mit diesem Button kann die Textcollection geändert werden, aus der ein Text ausgewählt werden soll, bzw. in welcher der neue Text eingetragen werden soll. Als Default-Wert ist die Textcollection ctMessages ausgewählt.

Button **Choose existing Message**:

Mit diesem Button kann aus der gewählten Textcollection ein existierender Eintrag ausgewählt werden.

Feld **Collection**:

Zeigt an, welche Textcollection ausgewählt ist.

Button **Search**:

Mit diesem Button öffnen Sie einen Suchdialog. In diesem Dialog wird die Suche auf die Textcollection, die im Exception Editor / Message Box Editor angegeben ist, eingeschränkt.

Die Suchfunktionalität ist identisch mit den Möglichkeiten, die auf der Registerkarte **Search** im Framework-Designer zur Verfügung gestellt werden.

**Text-Grid**:

In diesem Grid kann der Text der Message in den verschiedenen Sprachen eingegeben werden. Wurde mit **Choose existing Message** ein Eintrag ausgewählt, wird dieser geändert und in die Textcollection zurückgeschrieben. Alle vorhandenen Message-Boxen, die diesen Eintrag verwenden, sind ebenfalls davon betroffen. Dem Text können Parameter zugewiesen werden. Die Parameter werden in der Form `{0}, {1}` usw. angegeben. Jeder Parameter kann mehrmals verwendet werden.

```text
Der Beleg {0} für Kunde {1} hat sich geändert. Wollen Sie den Beleg {0} speichern?
```

Die Parameter werden in der Textbox **String.Format...** gefüllt.

Combobox **Icon** (nur Message-Box):

Gibt an, welches Icon verwendet werden soll

* Error
* Exclamation
* Information
* Question
* None

Combobox **Buttons** (nur Message-Box):

Gibt an, welche Buttons angezeigt werden sollen. Wird `OK` ausgewählt, ist es nicht notwendig, einen Event-Handler zu hinterlegen. Werden andere Buttons ausgewählt, muss ein Event-Handler hinterlegt werden.

* AbortRetryIgnore
* OK
* OKCancel
* RetryCancel
* YesNo
* YesNoCancel

Button **Event Handler** (nur Message Box Editor):

Mit diesem Button kann angegeben werden, ob mit dem Klick in der Message-Box (z.B. auf `OK` oder `Cancel`) ein Event angestoßen werden soll oder nicht.

Ist der Button gedrückt, erscheint rechts daneben eine Combobox, mit der evtl. bestehende Methoden ausgewählt werden können. Mit dem Button **New** wird ein neuer Event-Handler angelegt.

Es wird eine Methode `OnMsgBoxClick1` angelegt. Der Parameter `MsgBoxEventArgs` hat ein Property DialogResult, damit abgefragt werden kann, welcher Button gedrückt wurde.

```csharp
public void OnMsgBoxClick1(object sender, MsgBoxEventArgs e)
{
    if (e.DialogResult == DialogResult.OK)
    {
        //Code for Ok.
    }
}
```

Combobox **Severity** (nur Exception Editor):

Hier können Sie den Schweregrad der Ausnahme (0-3) festlegen.

**Add Inner Exception** (nur Exception Editor):

Wenn die Checkbox gesetzt ist, können Sie das Property InnerException füllen. Geben Sie dazu die zu übergebende Variable im Textfeld an. Geben Sie dazu im Textfeld den Namen der lokalen Exception-Variable an.

Textbox **String.Format...**:

In dieser Textbox können die Parameter der Message angegeben werden. Es ist möglich im Message Text Parameter anzugeben. Dies geschieht mit `{0}, {1}` usw. Diese Parameter können im Text auch mehrmals verwendet werden. Für jeden dieser Parameter kann hier, mit Komma getrennt, ein Wert angegeben werden. Der erste Parameter steht für `{0}`, der zweite für `{1}` usw.

```text
this.oOrder.lngOrderID, this.oOrder.lngCustomerID
```

Button **OK**:

Schließt den Dialog und fügt den generierten Message-Code in den Code-Editor ein.

Button **Cancel**:

Schließt den Dialog und verwirft die Änderungen.

Wenn der Message-Box-Editor mit **OK** verlassen wird, wird an die Stelle im Code, an der sich der Cursor befindet der Code generiert.

```csharp
#region Required for MsgBoxEditor support. Do not modify manually.
//Should the Call {0} be deleted?
//Buttons: YesNo; Icon:Question
MsgBox.Show(String.Format(NV.NVSystem.ctMessages.Get(this.Global,2).Value[Global.Sele... //<MsgBox TextColl="Messages" ID ="90b4d563b3544dbfb8fa8e29b0506045" Buttons="4" Icon... #endregion End of generated section
```

> [!CAUTION]
> Dieser Code-Block darf nie verändert werden, da sonst spätere Änderungen an der Message-Box nicht mehr möglich sind.

Um eine Message-Box nachträglich zu ändern, setzen Sie den Fokus irgendwo in den generierten Code-Block und drücken erneut den Button **Message Box Editor Wizard**. Es öffnet sich wieder der Dialog wie oben und die Daten der MessageMessage-Boxbox werden angezeigt und können geändert werden.
