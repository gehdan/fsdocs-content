# Umwandlungsfunktionen

#### CHAR_TO_DATE

`CHAR_TO_DATE ( <Expression>, <format-Number>)`

Wandelt eine Zeichen-Kette in ein Datum um. Dabei wird das angegebene Format verwendet. Die Format-Nummer muss als konstante Zahl übergeben werden. Sie kann folgende Werte haben:

| Number   | Format YY                   | Format YYYY  |
| -------- | --------------------------- | ------------ |
| 1 / 101  | MM/DD/YY                    | MM/DD/YYYY   |
| 2 / 102  | YY/MM/DD                    | YYYY/MM/DD   |
| 3 / 103  | DD/MM/YY                    | DD/MM/YYYY   |
| 4 / 104  | DD.MM.YY                    | DD.MM.YYYY   |
| 5 / 105  | DD-MM-YY                    | DD-MM-YYYY   |
| 6 / 106  | DD MM YYY                   | DD MM YYYY   |
| 7 / 107  | Mon DD, YY                  | Mon DD, YYYY |
| 8 / 108  | hh:mm:ss   (24h)            |              |
| 10 / 110 | MM-DD-YY                    | MM-DD-YYYY   |
| 11 / 111 | YY/MM/DD                    | YYYY/MM/DD   |
| 12 / 112 | YYMMDD                      | YYYYMMDD     |
| 20 / 120 | YYYY-MM-DD hh:mm:ss   (24h) |              |

#### DATE_TO_CHAR

`DATE_TO_CHAR ( <date Expression>, <format-Number> )`

Wandelt ein Datum in eine Zeichenkette um. Die Format-Nummer arbeitet wie bei der Funktion CHAR_TO_DATE.

#### NUMBER_TO_CHAR

`NUMBER_TO_CHAR ( <Number Expression>, <Decimals>)`

Wandelt eine Dezimal-Zahl in einen Text um. Dabei wird die Zahl auf die übergebene Anzahl von Dezimal-Stellen gerundet bzw. abgeschnitten.

|            | Umsetzung des Statements auf den verschiedenen Datenbanken                                                                                         |
| ---------- | -------------------------------------------------------------------------------------------------------------------------------------------------- |
| SQL-Server | `CAST ( ROUND ( <Number Expression>, <Decimals> ) AS VARCHAR )`                                                                                    |
| Oracle     | `LTRIM ( TO_CHAR (<Number Expression>, '99999999999999999999999999999999.9999' ) )` <br> *Die Anzahl der Nachkommastellen ist gleich `<Decimals>`* |

#### INT_TO_CHAR

`INT_TO_CHAR ( <Number Expression>)`

Wandelt eine Ganzzahl in einen Text um. Bei einer Dezimal-Zahl wird gerundet bzw. es werden die Dezimal-Stellen abgeschnitten.

|            | Umsetzung des Statements auf den verschiedenen Datenbanken                     |
| ---------- | ------------------------------------------------------------------------------ |
| SQL-Server | `CAST ( ROUND ( <Number Expression>, 0 ) AS VARCHAR )`                         |
| Oracle     | `LTRIM ( TO_CHAR (<Number Expression>, '99999999999999999999999999999999' ) )` |

#### CHAR_TO_DECIMAL

`CHAR_TO_DECIMAL ( <Expression> )`

Wandelt eine Zeichenkette in eine Dezimal-Zahl um.
