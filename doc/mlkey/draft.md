# Text-Collections

Text-Collections arbeiten ebenfalls mit MLKeys. Im Grunde sind sie eine Auflistung von MLKeys.

## Arbeitsweise

Das Wörterbuch wird in xml-Dateien gespeichert. Diese liegen im Broker-Verzeichnis im Ordner `lang`. Die Dateien werden separat prop Package und Sprache mit dem folgenden Datei-Namen abgelegt: `<package>.<iso>.lang.xml`

Beispiel:

```text
<broker-directory>
  |--lang
  |   |--CustomPackage.de.lang.xml
  |   |--eNVenta.de.lang.xml
  |   |--eNVenta.en.lang.xml
  |   |--eNVenta.fr.lang.xml
  |   |--SystemPackage.de.lang.xml
  |   |--SystemPackage.en.lang.xml
```

Zur Laufzeit werden diese Dateien bei Bedarf einmalig für die benötigten Sprachen eingelesen. Dabei wird die Package-Hierarchie berücksichtigt.
