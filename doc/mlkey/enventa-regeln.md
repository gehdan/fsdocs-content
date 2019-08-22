# eNVenta Regeln für MLKeys

## Allgemeine Regeln

**Texte aus den Test-Namespaces**: Diese sollen nicht ins Wörterbuch aufgenommen werden.

**Unübersetzbare Texte**: Texte, die nicht übersetzt werden können wie z.B. Eigennamen, müssen mit dem Kommentar `untranslatable` versehen werden. Sind weitere Hinweise im Kommentar nötig, beginnt der Kommentar mit `untranslatable` gefolgt von einem Zeilenumbruch. Der Text soll in diesem Fall **nur** in der **deutschen** Sprache angegeben werden.

**Abkürzungen im Namen eines MLKeys**: Werden im Namen eines MLKeys bewusst Großbuchstaben als Abkürzungen für Teilworte verwendet, weil z.B. der Name sonst zu lang würde, so muss die Abkürzung nach folgendem Schema im **Comment** erläutert werden:

**`{Abkürzung1} = {Begriff1}, {Abkürzung2} = {Begriff2}`**

Beispiele:

* `LBL_CCServicePort`: Comment = `CC = Cross Company`
* `LBL_CCNameDebit`: Comment = `CC = Cost Center`

## Bezeichnung von MLKeys

### Normalfall

* Begriffe: **`LBL_{englische Bezeichnung}`** Beispiel: `LBL_Search`
* Sätze: **`MSG_{GUID}`** Beispiel: `MSG_f39ceca46b3341ee8b9862d34cfd06b6`

### Einheiten

**`LBL_{englische Bezeichnung}_Unit`**

Beispiel: `LBL _mm_Unit`

### Zeichen

**`LBL_{englische Bezeichnung}_Sign`**

Beispiel: `LBL_Plus_Sign` für den Text „+“

### Ziffern

**`LBL_{englische Bezeichnung}_Digit`** oder **`LBL_{englische Bezeichnung}_Digits`** (Plural)

Beispiele:

* `LBL_Nine_Digit` für den Text „9“,
* LBL_EightOClock_Digits` für den Text „08:00“

### Prozentzeichen

**`LBL_{englischer Prefix}Percent`** (kein Unterstrich)

Beispiel: `LBL_DiscountPercent` (de = „Skonto %“, en = „Discount %“)

### Abkürzungen / Ausgeschriebene Texte

Wenn für einen englischen Begriff im deutschen **am häufigsten** eine abgekürzte Schreibweise verwendet wird, so wird der MLKey für den Text mit Abkürzung normal mit **`LBL_{englische Bezeichnung}`** benannt.

Wird parallel dazu auch der im deutschen (oder anderen Fremdsprachen) ausgeschriebene Text benötigt, so wird der MLKey mit **`LBL_{englische Bezeichnung}_Full`** benannt.

Wird zu einem Begriff, zu dem es schon eine ausgeschriebene Schreibweise gibt eine Abkürzung benötigt, so wird  der MLKey mit **`LBL_{englische Bezeichnung}_Abbrev`** bezeichnet.

Beispiele:

* `LBL_ClerkScanner` (de = „SB-Scanner“), `LBL_ClerkScanner_Full` (de = „Sachbearbeiter Scanner“)
* `LBL_Reminder` (de = „Wiedervorlage“), `LBL_Reminder_Abbrev` (de = „Wiedervorl.“)

### Spezialfall: Ein Buchstabe als Abkürzung

**`LBL_{englische Bezeichnung}_Char`**

Beispiele:

* `LBL_Order_Char` (de = „B“, en= „O“)
* `LBL_Container_Char` (de = „B“, en = „C“)

### Beschriftung von Mini-Buttons

**`LBL_{englische Bezeichnung}_Mini`**

Wird ein MiniButton (Constrol Style = MiniEmpty) auf einer Maske mit einer Caption von 1 bis 2 Buchstaben versehen (die typischerweise eine Abkürzung darstellen), so wird der MLKey dazu mit der eigentlichen Bezeichnung, ergänzt um `_Mini` beschriftet. Dabei ist darauf zu achten, dass die Beschriftungen pro Sprache eindeutig sind.

Beispiele:

* **`LBL_Custoner_Mini`** (de = „K“, en = „Cu“)
* **`LBL_CrossOver_Mini`** (de = „C“, en = „Cr“)

### Zwei unterschiedliche deutsche Begriffe, die im Englischen gleich heißen

Wenn zwei unterschiedliche Begriffe im englischen durch den gleichen Text beschrieben werden, so werden die Bezeichnungen der MLKeys durch Anhängen eines Zählers beginnend mit 2 im Format **`_{Zähler}`** unterschieden.

Beispiel:

* de = „Herkunft“, en = „Source“ => MLKey = `LBL_Source`
* de = „Quelle“, en = „Source“ => MLKey = `LBL_Source_2`

### Tooltips

**`TTT_{englische Bezeichnung}`**  oder **`TTT_{GUID}`**

**TODO**

### Kleingeschriebene Begriffe

Sollte man ein Text (z.B. wegen einer Verwendung in einer Textcollection) berechtigterweise klein geschrieben sein und es soll trotzdem ein sprechender Key generiert werden, so ist dieser ebenfalls klein zu schreiben.

Beispiel: de = „eins“, en = „one“ => MLKey = `LBL_one`

## Texte

* Alle Texte in allen Sprachen beginnen mit einem großen Buchstaben.<br>
Ausnahmen:
  * Abgekürzte Einheiten (z.B. mm)
  * Einträge in Textcollections, soweit eine Umstellung aller Einträge nicht sicher durchgeführt werden kann.

* Vor Satzzeichen werden keine Leerzeichen verwendet.
* Ganze Sätze werden mit einem Satzzeichen beendet.
* Im Englischen werden bei Texten mit bis ca. 4 Worte (Beschriftungen von Eingabefeldern, Menüs, Buttons usw.) alle Worte bis auf Füllwörter wie *of, to, in, ...* groß geschrieben.
