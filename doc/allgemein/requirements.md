# Systemvoraussetzungen

## Entwicklungs-Rechner

Ein Rechner auf dem mit der Framework Studio IDE entwickelt wird bzw. ein Rechner oder Server auf dem der Framework-Compiler ausgeführt wird.

### Betriebssystem

* Windows 10 64 Bit (Pro / Enterprise) <sup>[2]</sup>
* Windows 10 (Pro / Enterprise) <sup>[1]</sup> <sup>[2]</sup>
* Windows 8.1 64Bit (Pro / Enterprise) <sup>[2]</sup>
* Windows 8.1 (Pro / Enterprise) <sup>[1]</sup> <sup>[2]</sup>
* Windows 8 64Bit (Pro / Enterprise) <sup>[2]</sup>
* Windows 8 (Pro / Enterprise) <sup>[1]</sup> <sup>[2]</sup>
* Windows 7 SP1 64Bit (Professional / Enterprise / Ultimate)
* Windows 7 SP1 (Professional / Enterprise / Ultimate) <sup>[1]</sup>
* Windows Vista SP2 64Bit (Business / Enterprise / Ultimate)
* Windows Vista SP2 (Business / Enterprise / Ultimate) <sup>[1]</sup>
* Windows Server 2012 R2 64Bit (Essentials / Enterprise / Datacenter)
* Windows Server 2012 64Bit (Essentials / Enterprise / Datacenter)
* Windows Server 2008 R2 SP1 64Bit (Standard / Enterprise / Datacenter)
* Windows Server 2008 SP2 64Bit (Standard / Enterprise / Datacenter)
* Windows Server 2008 SP2 (Standard / Enterprise / Datacenter) <sup>[1]</sup>

### .NET Framework

* Microsoft .NET Framework 4.5 / 4.5.1 /4.5.2 / 4.6 <sup>[2]</sup>

<sup>[1]</sup> Es wird ein 64Bit-Betriebssystems empfohlen.

<sup>[2]</sup> Ab Windows 8 / Windows Server 2012 ist das .NET Framework 4.5 <br>
ab Windows 8.1 / Windows Server 2012 R2 ist das .NET Framework 4.5.1 und <br>
ab Windows 10 ist das .NET Framework 4.6 standardmäßig installiert.

### Weitere Software

* [Java-Runtime](#java-runtime)
* [Crystal Reports Runtime](#crystal-reports-runtime)
* [Crystal Reports Designer](#crystal-reports-designer)
* [Oracle-Client](#oracle-client)
* Visual Studio: empfohlen zum Debuggen von Anwendungen
  * Visual Studio 2012
  * Visual Studio 2010
  * Andere Versionen und Editionen können auf eigene Verantwortung in den [IDE-Options](options.md) konfiguriert werden.
* Windows Azure: Für die Funktion Publish2Azure wird folgende Software benötigt:
  * Windows Azure SDK Version 2.4

## Anwendungs-Server

Rechner, auf dem Broker oder mit Framework Studio veröffentlichte Services laufen.

### Betriebssystem

* Windows Server 2012 64Bit (Essentials / Enterprise / Datacenter)
* Windows Server 2012 R2 64Bit (Essentials / Enterprise / Datacenter)
* Windows Server 2008 R2 SP1 64Bit (Standard / Enterprise / Datacenter)
* Windows Server 2008 SP2 64Bit (Standard / Enterprise / Datacenter)
* Windows Server 2008 SP2 (Standard / Enterprise / Datacenter) <sup>[1]</sup>
* Client-Betriebssysteme: Ein Broker oder Service kann prinzipiell auf einem Client-Betriebssystem (Windows 7, Windows 8, Windows 8.1, Windows 10) installiert werden. In einer Produktiv-Umgebung wird aber dringend der Einsatz eines o.g. Server-Betriebssystems empfohlen. Auf Client-Betriebssystemen können nur sehr wenige Benutzer parallel arbeiten.

### .NET Framework

* Microsoft .NET Framework 4.5 / 4.5.1 / 4.5.2 / 4.6

<sup>[1]</sup> Es wird ein 64Bit-Betriebsystems empfohlen.

### Weitere Software

* [Crystal Reports Runtime](#crystal-reports-runtime)
* IIS
* [Oracle-Client](#oracle-client)

## Print-Server

Der Print-Service benötigt eine Verbindung zur Runtime-Repository-Datenbank und er muss die gewünschten Drucker ansprechen können. Er wird nicht von der Anwendung direkt kontaktiert, deshalb kann auch ein Client-Betriebssystem verwendet werden.

### Print-Service

* Framework Studio Print-Service 3.11
* Framework Studio Print-Service 3.10.3
* Framework Studio Print-Service 3.9.10
* Framework Studio Print-Service 3.8.14

### Betriebssystem

* siehe [Entwicklungs-Rechner](#entwicklungs-rechner)

### Weitere Software

* [Crystal Reports Runtime](#crystal-reports-runtime)
* .NET Framework 4.5 / 4.5.1 / 4.5.2 / 4.6
* [Oracle-Client](#oracle-client)

## Authentication-Server

### Authentication-Service

* Framework Studio Authentication-Service 3.9
* Framework Studio Authentication-Service 3.9.1 (unterstützt Runtime Supervisor)
* Framework Studio Authentication-Service 3.8 oder 3.8.5

### Betriebssystem

* siehe [Anwendungs-Server](#anwendungs-server)

### Weitere Software

* .NET Framework 4.5 / 4.5.1 / 4.5.2 / 4.6
* Oracle-Client

## Client-Rechner

Rechner, auf dem die Anwendung mit dem Java-Client ausgeführt wird.

### Betriebssystem

An das Betriebssystem werden grundsätzlich keine besonderen Anforderungen gestellt. Entscheidend ist, dass die Java-Runtime verfügbar ist. Ja nach Framework-Studio-Anwendung kann es ggf. weitere Einschränkungen geben.

* Windows 10
* Windows 8.1
* Windows 8
* Windows 7 SP1
* Windows Vista SP2
* Windows Server 2012
* Windows Server 2008
* Ubuntu Linux
* Mac OS X 10.9

### Weitere Software

* [Java-Runtime](#java-runtime)
* [Crystal Reports Designer](#crystal-reports-designer) - sofern Reports bearbeitet werden sollen
* Je nach Framework-Studio-Anwendung ggf. weitere Software

## Java-Runtime

Die Java Laufzeit-Umgebung wird benötigt am Client-Rechner und auf dem Entwicklungs-Rechner zur Ausführung der Anwendung.

* Java 8

## Crystal Reports Runtime

Diese Runtime wird benötigt auf dem Anwendungs-Server, dem Print-Service und dem Entwicklungs-Rechner.

* SAP Crystal Reports Runtime engine for .NET Framework 13.0.9 oder höher.

Bei 64Bit-Betriebssystemen muss die 64Bit-Version der Runtime verwendet werden.

## Crystal Reports Designer

Der Crystal Reports Designer wird für die Bearbeitung der Crystal Reports auf dem Entwicklungs-Rechner benötigt und sofern erforderlich auch auf dem Client-Rechner.

* Crystal Reports 2008

## Datenbank-Server

* Microsoft SQL Server 2014 (Standard / Enterprise / BI)
* Microsoft SQL Server 2012 SP1 (Standard / Enterprise / BI)
* Microsoft SQL Server 2008 R2 SP2 (Standard / Enterprise / Datacenter)
* Microsoft SQL Server 2008 SP3 (Standard / Enterprise / Datacenter)

Die Express- und Developer-Editionen des SQL Server können zu Entwicklungs- und Test-Zwecken eingesetzt werden. Dabei sind aber entsprechende funktionale und lizenzrechtliche Einschränkungen seitens Microsoft zu beachten. Der Einsatz erfolgt auf eigene Verantwortung.

* Oracle 12c (Standard / Enterprise)
* Oracle 11gR2 (Standard / Enterprise)
* Oracle 11g (Standard / Enterprise)

## Oracle-Client

> [!TIP]
> Es wird der Einsatz des **Oracle Managed** Providers empfohlen. Dieser ist bereits in allen Framework-Studio enthalten. Es ist keine separate Oracle-Client Software nötig.

Für die Verwendung des **Oracle ODP** Providers muss ein Oracle-Client installiert werden:

* Oracle Client 12.1.0.1+ mit Oracle Data Provider for .NET 4
* Oracle Client 11.2.0.3+ mit Oracle Data Provider for .NET 4

Die Version des Oracle Client sollte möglichst zur Version des Datenbank-Servers passen, ansonsten kann es zu Performanceeinbußen kommen.
