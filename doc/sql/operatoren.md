# Operatoren

#### `||`

Verbindet 2 Zeichenketten.

Beispiel:

```sql
SELECT column1 || ' - ' || colum2 FROM tabelle
```

Bei Zeichen-Ketten muss dieser Operator verwendet werden. Der + - Operator ist nicht zulässig.

Wenn dennoch der + - Operator verwendet wird, versucht der Parser dies zu korrigieren. Das ist möglich, wenn bei der Operation Zeichen-Ketten oder bestimmte Zeichenketten-Funktionen beteiligt sind. Nicht erkannt wird z.B. das Verbinden von 2 Spalten. In diesem Fall kann es zu Fehlern auf der Ziel-Datenbank kommen.

#### `+ - * /`

Addiert, subtrahiert, multipliziert bzw. dividiert 2 Zahlenwerte.

Der Framework Studio SQL-Parser versteht die im Folgenden beschriebenen Operatoren und Funktionen. Diese werden Datenbank-spezifisch umgesetzt und können bedenkenlos in selbst formuliertem Sql verwendet werden.

Funktionen, die der Parser nicht kennt, werden direkt ohne Konvertierung an die Datenbank weitergegeben. Das bedingt, dass diese Funktionen von der Datenbank verstanden werden. Ggf. Ist es in solchen Fällen nötig, selbst dafür zu sorgen, dass das Sql datenbankspezifisch formuliert wird.
