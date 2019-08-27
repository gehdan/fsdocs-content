# Datums-Funktionen

## `GETDATE ( )`

Liefert das aktuelle Datum auf dem Datenbank-Server.

| |Umsetzung des Statements auf den verschiedenen Datenbanken|
|-|-|
|SQL-Server | `GETDATE ( )` |
|Oracle     | `SYSDATE` |

## `GETUTCDATE ( )`

Liefert die aktuelle Weltzeit (UTC) auf dem Datenbank-Server.

| |Umsetzung des Statements auf den verschiedenen Datenbanken|
|-|-|
|SQL-Server | `GETUTCDATE ( )` |
|Oracle     | `CAST(sys_extract_utc(systimestamp) AS TIMESTAMP)` |

## `ADD_DAYS ( <Date Expression>, <Days> )`

Addiert die übergebenen Tage zu einem Datum/Zeit-Ausdruck.

| |Umsetzung des Statements auf den verschiedenen Datenbanken|
|-|-|
|SQL-Server | `DATEADD ( DAY, <Days>, <Date Expression> )` |
|Oracle     | `<Date Expression> + <Days>` |

## `ADD_MINUTES ( <Date Expression>, <Minutes> )`

Addiert die übergebenen Minuten zu einem Datum/Zeit-Ausdruck.

| |Umsetzung des Statements auf den verschiedenen Datenbanken|
|-|-|
|SQL-Server | `DATEADD ( MINUTE, <Minutes>, <Date Expression> )` |
|Oracle     | `<Date Expression> + ( <Minutes> / 1440 )` |

## `ADD_MONTHS ( <Date Expression>, <Months> )`

Addiert die übergebenen Monate zu einem Datum/Zeit-Ausdruck.

| |Umsetzung des Statements auf den verschiedenen Datenbanken|
|-|-|
|SQL-Server | `DATEADD ( MONTH, <Months>, <Date Expression> )` |
|Oracle     | `ADD_MONTHS ( <Date Expression>, <Months> )` |

## `DAYS_BETWEEN (<Start-Date>, <End-Date>)`

Liefert die Anzahl der ganzen Tage zwischen 2 Datums-Werten. Wenn das Start-Datum größer ist als das End-Datum, dann werden negative Werte zurückgegeben.

| |Umsetzung des Statements auf den verschiedenen Datenbanken|
|-|-|
|SQL-Server | `DATEDIFF ( DAY, <Start-Date>, <End-Date> )` |
|Oracle     | `TRUNC ( <End-Date> - <Start-Date> )` |

## `MONTHS_BETWEEN (<Start-Date>, <End-Date>)`

Liefert die Anzahl der ganzen Monate zwischen 2 Datums-Werten. Wenn das Start-Datum größer ist als das End-Datum, dann werden negative Werte zurückgegeben.

| |Umsetzung des Statements auf den verschiedenen Datenbanken|
|-|-|
|SQL-Server | `DATEDIFF (MONTH, <Start-Date>, <End-Date>)` |
|Oracle     | `MONTHS_BETWEEN (<End-Date>, <Start-Date>)` |

## `YEAR ( <Date Expression> )`

Liefert eine 4-stellige Zahl, die dem Jahr des Datum/Zeit-Wertes entspricht.

| |Umsetzung des Statements auf den verschiedenen Datenbanken|
|-|-|
|SQL-Server | `YEAR ( <Date Expression> )` |
|Oracle     | `EXTRACT ( YEAR FROM <Date Expression> )` |

## `MONTH ( <Date Expression> )`

Liefert eine Zahl, die dem Monat des Datum/Zeit-Wertes entspricht.

| |Umsetzung des Statements auf den verschiedenen Datenbanken|
|-|-|
|SQL-Server | `MONTH ( <Date Expression> )` |
|Oracle     | `EXTRACT ( MONTH FROM <Date Expression> )` |

## `DAY ( <Date Expression> )`

Liefert eine Zahl, die dem Tag (Tag des Monats) des Datum/Zeit-Wertes entspricht.

| |Umsetzung des Statements auf den verschiedenen Datenbanken|
|-|-|
|SQL-Server | `DAY ( <Date Expression> )` |
|Oracle     | `EXTRACT ( DAY FROM <Date Expression> )` |

## `HOUR ( <Date Expression> )`

Liefert eine Zahl, die der Stunde des Datum/Zeit-Wertes entspricht.

| |Umsetzung des Statements auf den verschiedenen Datenbanken|
|-|-|
|SQL-Server | `DATEPART ( HOUR, <Date Expression> )` |
|Oracle     | `TO_NUMBER ( TO_CHAR ( <Date Expression>, 'HH24' ) )` |

## `MINUTE ( <Date Expression> )`

Liefert eine Zahl, die der Minute des Datum/Zeit-Wertes entspricht.

| |Umsetzung des Statements auf den verschiedenen Datenbanken|
|-|-|
|SQL-Server | `DATEPART ( MINUTE, <Date Expression> )` |
|Oracle     | `TO_NUMBER ( TO_CHAR ( <Date Expression>,'MI' ) )` |

## `SECOND ( <Date Expression> )`

Liefert eine Zahl, die der Sekunde des Datum/Zeit-Wertes entspricht.

| |Umsetzung des Statements auf den verschiedenen Datenbanken|
|-|-|
|SQL-Server | `DATEPART ( SECOND, <Date Expression> )` |
|Oracle     | `TO_NUMBER ( TO_CHAR ( <Date Expression>, 'SS' ) )` |
