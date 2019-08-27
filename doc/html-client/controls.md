# Controls

|Symbol|Bedeutung|
|:-:|---|
|+|Property oder Event wird vollständig unterstützt|
|-|Property oder Event wird nicht unterstützt|
|o|Property oder Event wird teilweise unterstützt (Anmerkung beachten)|

## Allgemein

Die folgende Auflistung beinhaltet diejenigen Properties und Events, die an allen verfügbaren Controls im HTML-Client vorhanden sind.

### Properties

|Name|Unterstützt|Anmerkung|
|---|:-:|---|
|Alignment|+||
|BackColor|+||
|BorderColor|+||
|BorderRadius|+||
|BorderThickness|+||
|ButtonGroupDataSource |+||
|Caption|+||
|DockPanel.ItemSize|+||
|Font Family|-|Ist im Client hart definiert auf die Hierarchie Arial -> Helvetica -> Sans-Serif.|
|Font Bold|+||
|Font Italic|+||
|Font Underline|+||
|ForeColor|+||
|IsEditable|+||
|LabelTemplate|+||
|MapEnterToTabAction|-||
|Margin|+||
|MaxSize|+||
|MinSize|+||
|Name|+||
|Padding|+||
|Shortcut|-||
|TabStop|+||
|ToolTip|+||
|Visibility|+||

### Events

|Name|Unterstützt|
|---|:-:|
|OnCanDrop|-|
|OnDrag|-|

## Form

### Properties

|Name|Unterstützt|
|---|:-:|
|BadgeImage DataSource|-|
|IsCloseIconVisible|+|
|MainMenu|-|
|PreferredSize|-|
|SymbolImage|-|
|Title|+|
|VerticalScrollbarOverlay|-|

### Events

|Name|Unterstützt|
|---|:-:|
|OnLoad|+|
|OnClose|+|

## Dock Panel

### Properties

|Name|Unterstützt|
|---|:-:|
|BackgroundImage|-|
|BackgroundScaleMode|-|
|DockPanelOrientation|+|
|Spacing|+|

### Events

|Name|Unterstützt|
|---|:-:|
|OnEnter|-|
|OnLeave|-|

## Wrap Panel

### Properties

|Name|Unterstützt|
|---|:-:|
|BackgroundImage|-|
|BackgroundScaleMode|-|
|ContentAlignment|+|
|InvertFlowDirection|+|
|Spacing|+|
|WrapArrangement|+|

### Events

|Name|Unterstützt|
|---|:-:|
|OnEnter|-|
|OnLeave|-|

## Field Panel

Properties

|Name|Unterstützt|
|---|:-:|
|BackgroundImage|-|
|BackgroundScaleMode|-|
|RowLabelTemplate|+|
|SynchronizeColumns|+|

### Events

|Name|Unterstützt|
|---|:-:|
|OnEnter|-|
|OnLeave|-|

## Field Row

### Properties

|Name|Unterstützt|
|---|:-:|
|FieldRowSize|+|
|LabelMode|+|
|OptimizeGeneratedLabels|+|

## Button

### Properties

|Name|Unterstützt|
|---|:-:|
|IsSearchButton|-|
|ShowCaption|+|
|TabStop|+|

### Events

|Name|Unterstützt|
|---|:-:|
|OnClick|+|
|OnEnter|+|
|OnLeave|+|

## ImageButton

### Properties

|Name|Unterstützt|
|---|:-:|
|BadgeImage DataSource|-|
|CaptionAlign|-|
|ContextMenu|-|
|DataSource|-|
|DisabledImage|+|
|HighlightImage|-|
|Image|+|
|MouseOverImage|+|
|PressedImage|+|
|ScaleMode|-|
|ShowCaption|+|
|SymbolImage|-|
|TabStop|+|

### Events

|Name|Unterstützt|
|---|:-:|
|OnClick|+|
|OnEnter|+|
|OnLeave|+|

## Label

Properties

|Name|Unterstützt|
|---|:-:|
|DataSource|+|
|TextAlign|+|

### Events

|Name|Unterstützt|
|---|:-:|
|OnEnter|+|
|OnLeave|+|

## CheckBox

### Properties

|Name|Unterstützt|
|---|:-:|
|DataSource|+|
|ShowCaption|+|

### Events

|Name|Unterstützt|
|---|:-:|
|OnClick|+|
|OnEnter|+|
|OnLeave|+|

## Editfield

### Properties

|Name|Unterstützt|Anmerkung|
|---|:-:|---|
|DataSource|+|
|DisabledBackColor|o|Wird dynamisch im Client berechnet|
|DisplayLength|+|
|Editor|o|Nur "PlainText”, "HTML” wird nicht unterstützt|
|Format|+|
|FormatPattern|o|Funktioniert nur mit Format "Decimal"|
|Multiline|+|
|PasswordChar|+|Client generiert ein Password-Feld, wenn gesetzt, das Passwort-Zeichen selbst kann aber nicht geändert werden (in Web Browsern technisch nicht möglich).|
|ScrollBars|+|
|SelectionEnd|-|
|SelectionStart|-|
|TabStop|+|
|TextAlign|+|
|WordWrap|+|

### Events

|Name|Unterstützt|
|---|:-:|
|OnEnter|+|
|OnLeave|+|
|OnValidated|+|

## ComboBox

### Properties

|Name|Unterstützt|
|---|:-:|
|DataSource|+|
|DisplayLength|+|
|EditStyle|+|
|List|+|
|ListOrder|+|
|MaxDropDownSize|+|
|TabStop|+|

### Events

|Name|Unterstützt|
|---|:-:|
|OnEnter|+|
|OnLeave|+|
|OnSelectionChanged|+|

## RadioButton

### Properties

|Name|Unterstützt|
|---|:-:|
|CaptionDataSource|+|
|DataSourceOnValue|+|

### Events

|Name|Unterstützt|
|---|:-:|
|OnEnter|+|
|OnLeave|+|
|OnClick|+|

## ListView

### Properties

|Name|Unterstützt|
|---|:-:|
|DataSource|+|
|ItemArrangement|+|
|ItemSize|+|
|SelectedItems|+|
|SelectionMode|+|
|SelectorPosition|+|
|Spacing|+|
|Template|+|

### Events

|Name|Unterstützt|
|---|:-:|
|OnEnter|-|
|OnLeave|-|
|OnItemActivated|+|
|OnItemSelectionChanged|+|
