# Hinweise zu Lizenzen

## Timeout

Aus technischen Gründen kann der HTML-Client weder im Browser, noch in der App auf einem mobilen Gerät dem Broker mitteilen, dass er beendet wurde. Z.B. kann auf einem Android-Gerät nicht unterschieden werden, ob eine App nur in den Ruhezustand gewechselt hat oder komplett geschlossen wurde.

Dies hat zur Folge, dass Broker-Sessions, die von einem HTML-Client aus gestartet wurden, offen bleiben, bis der Broker sie von sich aus verwirft. Diese Zeitspanne beträgt **12 Stunden**.

## ClientID

Um dem Verbrauch von Lizenzen entgegen zu wirken, wird im HTML-Client eine ClientID generiert, die den Browser bzw. das mobile Gerät identifiziert und mit zum Broker geschickt wird.

Im Browser ist die ClientID eine UUIDv4, die im Code generiert wird, auf mobilen Geräten wird die Cordova-Geräte-ID herangezogen.

Über die ClientID kann der Broker den Browser bzw. das mobile Gerät identifizieren und bei einem erneuten Start einer Anwendung diesem die bisherige Lizenz zuordnen.

### Zusatz für mobile Geräte

Die ClientID auf mobilen Geräten ist immer gleich. Ein mobiles Gerät verbraucht am Broker eine Lizenz unabhängig vom Benutzer.

### Zusatz für Browser

Ein Browser hat keinen Zugriff auf das Betriebssystem und den Computer. Die generierte ClientID wird deshalb im sogenannten „Local Storage“ des Browsers gespeichert. Dieser Speicher ist je nach Konfiguration benutzerabhängig.

*Beispiel:*
Ist auf einem Computer, den drei Benutzer verwenden, Firefox als Browser installiert, so hat jeder Benutzer seinen eigenen Local Storage. Dies bedeutet, dass jeder Benutzer seine eigene ClientID bekommt und somit auch drei Lizenzen am Broker verbraucht werden.

Dies gilt auch, wenn ein Benutzer dieselbe Applikation einmal im Firefox und einmal im Chrome öffnet. Die beiden Browser haben separate Local Storages und verbrauchen somit auch wieder zwei Lizenzen am Broker.
