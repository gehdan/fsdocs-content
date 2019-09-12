---
uid: system-requirements
---

# Systemvoraussetzungen

## Entwicklungs-Rechner

Ein Rechner auf dem mit der Framework Studio IDE entwickelt wird bzw. ein Rechner oder Server auf dem der Framework-Compiler ausgeführt wird.

#### Betriebssystem

Es werden ausschließlich **64-Bit** Systeme unterstützt.

* Windows 10 - mind. Version 18.03
* Windows 8.1
* Windows Server 2019
* Windows Server Version 1809, 1803
* Windows Server 2016
* Windows Server 2012 R2

#### .NET Framework

* .NET Framework 4.8 - oder höher <https://dotnet.microsoft.com/download/dotnet-framework/net48>

#### Weitere Software

* [Java-Runtime](#java-runtime)
* [Crystal Reports Runtime](#crystal-reports-runtime)
* [Crystal Reports Designer](#crystal-reports-designer)
* Visual Studio: empfohlen zum Debuggen von Anwendungen
  * Visual Studio 2012
  * Visual Studio 2010
  * Andere Versionen und Editionen können auf eigene Verantwortung in den [IDE-Options](../doc/allgemein/options.md#visual-studio-path) konfiguriert werden.

## Anwendungs-Server

Rechner, auf dem Broker oder mit Framework Studio veröffentlichte Services laufen.

#### Betriebssystem

Es werden ausschließlich **64-Bit** Systeme unterstützt.

* Windows Server 2019
* Windows Server Version 1809, 1803
* Windows Server 2016
* Windows Server 2012 R2
* Client-Betriebssysteme: Ein Broker oder Service kann prinzipiell auf einem Client-Betriebssystem (Windows 8.1, Windows 10) installiert werden. In einer Produktiv-Umgebung wird aber dringend der Einsatz eines o.g. Server-Betriebssystems empfohlen. Auf Client-Betriebssystemen können nur sehr wenige Benutzer parallel arbeiten.

#### .NET Framework

* [.NET Framework 4.8](<https://dotnet.microsoft.com/download/dotnet-framework/net48>) - oder höher

#### Weitere Software

* [Crystal Reports Runtime](#crystal-reports-runtime)
* IIS

## Print-Server

Der Print-Service benötigt eine Verbindung zur Runtime-Repository-Datenbank und er muss die gewünschten Drucker ansprechen können. Er wird nicht von der Anwendung direkt kontaktiert, deshalb kann auch ein Client-Betriebssystem verwendet werden.

#### Print-Service

Die hier aufgeführten Systemvorrausetzungen gelten für den Print-Service Version 4.2.

Framework Studio ist kompatibel mit älteren Versionen des Print-Service. Kommen diese zum Einsatz, gelten die Systemvorrausetzungen für die jeweilige Version.

* Framework Studio Print-Service 3.11
* Framework Studio Print-Service 3.10.3
* Framework Studio Print-Service 3.9.10
* Framework Studio Print-Service 3.8.14

#### Betriebssystem

* siehe [Entwicklungs-Rechner](#entwicklungs-rechner)

Es wird der Einsatz eines 64-Bit Betriebssystems empfohlen. Wenn z.B. ein spezieller Drucker-Treiber nur unter 32-Bit funktioniert, kann der Print-Service auch unter 32-Bit eingesetzt werden.

#### Weitere Software

* [Crystal Reports Runtime](#crystal-reports-runtime)
* [.NET Framework 4.8](<https://dotnet.microsoft.com/download/dotnet-framework/net48>) - oder höher

## Authentication-Server

#### Authentication-Service

* Framework Studio Authentication-Service 3.9
* Framework Studio Authentication-Service 3.9.1 (unterstützt Runtime Supervisor)
* Framework Studio Authentication-Service 3.8 oder 3.8.5

#### Betriebssystem

* siehe [Anwendungs-Server](#anwendungs-server)

#### Weitere Software

* .NET Framework 4.5 / 4.5.1 / 4.5.2 / 4.6
* Oracle-Client

## Client-Rechner

Rechner, auf dem die Anwendung mit dem Java-Client ausgeführt wird.

#### Betriebssystem

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

#### Weitere Software

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

* Microsoft SQL Server 2014 - oder höher (Standard / Enterprise / BI)
* Microsoft SQL Server 2012 SP1 (Standard / Enterprise / BI)

Die Express- und Developer-Editionen des SQL Server können zu Entwicklungs- und Test-Zwecken eingesetzt werden. Dabei sind aber entsprechende funktionale und lizenzrechtliche Einschränkungen seitens Microsoft zu beachten. Der Einsatz erfolgt auf eigene Verantwortung.

* Oracle 12.2 - oder höher (Standard / Enterprise)

## Oracle-Client

Es ist kein Oracle Client erforderlich. Der **Oracle Managed** Provider bringt seine eigene Client-DLL mit.

> [!IMPORTANT]
> der **Oracle ODP** Provider ist veraltet (deprecated). Ein produktiver Einsatz wird nicht mehr supported. In einer zukünftigen Version wird er komplett entfernt.

Für die Verwendung des Oracle ODP Providers muss ein Oracle-Client installiert werden:

* Oracle Client 12.1.0.1+ mit Oracle Data Provider for .NET 4
* Oracle Client 11.2.0.3+ mit Oracle Data Provider for .NET 4
