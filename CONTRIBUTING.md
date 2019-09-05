# Contributing

Die Bearbeitung der Dokumentation erfolgt mit [Visual Studio Code.](https://code.visualstudio.com/)

Die benötigten Extensions werden über die Datei [extensions.json](.vscode/extensions.json) definiert und sollten in Visual Studio Code installiert werden. Dazu bei den Extensions die *Workspace Recommended* Extensions installieren.

## Versions-Branches

Die Versionierung erfolgt über Branches, die permanent gepflegt werden. Die aktuellste Version ist in der Regel der Default-Branch. Der Master-Branch enthält keinen Inhalt.

* `master` - leer
* `4.0/master` - für Framework Studio 4.0
* `4.2/master` (Default) - für Framework Studio 4.2

Somit können Änderungen aus älteren Versionen einfach in aktuellere Versionen gemerged werden. Ein Merge-Vorgang ist nur in Richtung neuerer Versionen möglich. In Richtung einer älteren Version dürfen Änderungen nur durch CherryPick übertragen werden.

Es ist auch möglich für eine Version z.B. feature-Branches zu erzeugen. Diese sollten aber nach Möglichkeit nicht zum Server übertragen werden. Beispiel:

* `4.2/feature/neue-funktion`

## Build / Preview

Die Datei [build-serve.cmd](build-serve.cmd) buildet das Projekt und startet einen lokalen Web-Server über den die doku angezeigt werden kann. Diese Datei kann über das Terminal gestartet werden. Die Lokale Webseite kann über <http://localhost:1234> angezeigt werden.

## Publish

Veröffentlicht wird die Dokumentation in das anderes Repository [fsdocs](https://github.com/FrameworkSystemsGmbH/fsdocs). Dieses ist über die Github-Pages unter der URL <https://frameworksystemsgmbh.github.io/fsdocs/> erreichbar. Dieses muss parallel zum Repository `fsdocs-content` im ordner `fsdocs` abgelegt sein.

Auf der obersten Ebene der Seite gibt es Ordner für jede Version (`v4.0`, `v4.2`, ...). In diese wird die von docfx generierte Webseite gepackt.

Die Api-Dokumentation wird automatisch aus dem Framework Studio Source Code generiert. Dieser steht für externe Bearbeiter nicht zur Verfügung. Das Repository liegt parallel im Ordner `fsdocs-fs`. Es wird automatisch von den Publish- und Build-Routinen angelegt und aktualisiert.

```text
[..]
  |- fsdocs
  |    |- v4.0
  |    |- v4.2
  |- fsdocs-content
  |    |- publish.cmd
  |    |- [...]
  |- fsdocs-fs   (nur intern)
  |    |- [Framework Studio Entwicklung]
```

Die Datei [publish.cmd](publish.cmd) im Root-Verzeichnis führt den kompletten Publish-Vorgang durch inkl. upload in des Repository fsdocs.

> [!IMPORTANT]
> Der Publish erfolgt ausschließlich durch Mitarbeiter der **Framework Systems GmbH**.

## Guidelines

Die Guidelines sind auf einer sapraten Seite beschrieben.

* siehe: [Guidelines zur Bearbeitung der Dokumentation](guidelines/index.md)
