# SQL-Funktionen

## `GETGUID ( )`

Liefert eine neue Guid mit folgendem Format: `xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx`

| |Umsetzung des Statements auf den verschiedenen Datenbanken|
|-|-|
|SQL-Server | `LOWER( REPLACE ( NEWID ( ), '-', '' ) )` |
|Oracle     | `LOWER( SYS_GUID ( ) )` |
