# Numerische Funktionen

#### ABS

`ABS ( <Numeric Expression> )`

Liefert den absoluten Betrag einer Zahl

#### TRUNC

`TRUNC ( <Numeric Expression>, <Decimals> )`

Schneidet eine Dezimal-Zahl auf die angegebene Anzahl Stellen ab.

|            | Umsetzung des Statements auf den verschiedenen Datenbanken |
| ---------- | ---------------------------------------------------------- |
| SQL-Server | `ROUND ( <Numeric Expression>, <Decimals>, 1 )`            |
| Oracle     | `TRUNC ( <Numeric Expression>, <Decimals> )`               |

#### ROUND

`ROUND ( <Numeric Expression>, <Decimals> )`

Rundet eine Dezimal-Zahl auf die angegebene Anzahl Stellen.

#### POWER

`POWER ( <Numeric Expression>, <y> )`

Potenziert eine Zahl mit y

#### SQUARE

`SQUARE ( <Numeric Expression> )`

Quadrat eine Zahl.

#### SQRT

`SQRT ( <Numeric Expression> )`

Quadratwurzel einer Zahl

#### CEILING

`CEILING ( <Numeric Expression> )`

Rundet eine Zahl auf.

#### FLOOR

`FLOOR ( <Numeric Expression> )`

Rundet eine Zahl ab.

#### LOG

`LOG (<Float Expression> )`

Natürlicher Logarithmus einer Fließkommazahl.

#### LOG10

`LOG10 ( <Float Expression> )`

Logarithmus mit der Basis 10.

#### EXP

`EXP ( <float Expression> )`

Gibt den exponentiellen Wert des angegebenen float-Ausdrucks zurück. (e<sup>x</sup>)

#### SIN

`SIN ( <float Expression> )`

Sinus einer Fließkommazahl.

#### TAN

`TAN (<Float Expression> )`

Tangens einer Fließkommazahl.

#### SIGN

`SIGN ( <Number> )`

Gibt das Vorzeichen der Zahl zurück. Negativ -> -1, 0 -> 0, positiv -> +1.
