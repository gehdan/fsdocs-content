# ML_Config (Business-Datenbank)

Die [ML-Columns](../database/ml-column.md) arbeiten standardmäßig mit der Default-Sprache `de` Deutsch.
Ist die "führende" Sprache nicht `de`, dann kann über diese Tabelle die korrekte Default-Sprache eingestellt werden.

Das geschieht in der Business-Datenbank, wo auch die Übersetzungs-Tabelle [dbRun_MLStrings](dbrun_mlstrings.md) abgelegt ist, welche die anderssprachigen Werte speichert. Die Einstellung muss in dieser Datenbank stehen, damit sichergestellt ist, dass die Übersetzungs-Tabelle immer mit derselben Konfiguration angesprochen wird - unabhängig davon, wie die Anwendung FS-seitig konfiguriert ist.

Die Tabelle muss bei Bedarf manuell per SQL angelegt werden. Dazu können die folgenden Scripte verwendet werden. Das Iso-Sprach-Kürzel `de` muss entsprechend durch das gewünschte Iso-Sprach-Kürzel ersetzt werden.

```sql
-- SQL-Server
CREATE TABLE ML_CONFIG
(
    CONFIG_KEY VARCHAR(10) NOT NULL,
    DEFAULT_LANGUAGE VARCHAR(2),
    CONSTRAINT PK_ML_CONFIG PRIMARY KEY CLUSTERED (CONFIG_KEY)
);
INSERT INTO ML_CONFIG (CONFIG_KEY, DEFAULT_LANGUAGE) values ('!!!!!', 'de');
```

```sql
-- Oracle
CREATE TABLE ML_CONFIG
(
    CONFIG_KEY VARCHAR2(10) NOT NULL,
    DEFAULT_LANGUAGE VARCHAR2(2) NULL,
    CONSTRAINT PK_ML_CONFIG PRIMARY KEY (CONFIG_KEY)
);
INSERT INTO ML_CONFIG (CONFIG_KEY, DEFAULT_LANGUAGE) values ('!!!!!', 'de');
```

> [!CAUTION]
>
> * Wenn die Konfiguration geändert wurde, dann müssen die Anwendungs-Broker und FS-Services neu gestartet werden, weil diese Informationen aus Performance-Gründen zwischengespeichert werden.
>
> * Die Konfiguration darf nicht nachträglich geändert werden, weil ansonsten die in der Übersetzungs-Tabelle abgelegten Texte nicht mehr stimmen. Wenn die Konfiguration zu Beginn bei Einrichtung der Business-Datenbank vorgenommen wird, dann muss im Anschluss sichergestellt werden, dass die Tabelle [dbRun_MLStrings](dbrun_mlstrings.md) leer ist.
>
>   Wenn bei einer Änderung der Konfiguration doch [dbRun_MLStrings](dbrun_mlstrings.md)-Inhalte erhalten bleiben sollen, müssen alle Einträge, für die neue Default-Sprache gelöscht werden.
