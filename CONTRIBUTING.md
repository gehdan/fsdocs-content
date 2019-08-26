# Contributing

Die Bearbeitung der Dokumentation erfolgt mit [Visual Studio Code.](https://code.visualstudio.com/)

Die benötigten Extensions werden über die Datei [extensions.json](.vscode/extensions.json) definiert und sollten in Visual Studio Code installiert werden.

## Versions-Branches

Die Versionierung erfolgt über Branches, die permanent gepflegt werden. z.B.:

* `v4.0` - für Framework Studio 4.0
* `v4.2` - für Framework Studio 4.2

Die aktuellste Version ist in der Regel der Default-Branch. Der Master-Branch enthält keinen Inhalt.

Somit können Änderungen aus älteren Versionen einfach in aktuellere Versionen gemerged werden. Ein Merge-Vorgang ist nur in richtung Neuerer Versionen möglich. Ein Richtung einer älteren Version dürfen Änderungen nur CherryPick übertragen werden.

## Preview

Die Datei [Build-Serve.cmd](Build-Serve.cmd) buildet das Projekt und startet einen lokalen Web-Server über den die doku angezeigt werden kann. Diese datei kann über das Terminal gestartet werden. Die Lokale Webseite kann über <http://localhost:1234> angezeigt werden.

## Publish

Veröffentlicht wird die Dokumentation in das anderes Repository [fsdocs](https://github.com/FrameworkSystemsGmbH/fsdocs). Dieses über die Github-Pages unter der URL <https://frameworksystemsgmbh.github.io/fsdocs/> erreichbar.

Auf der obersten Ebene der Seite gibt es Ordner für jede Version (`v4.0`, `v4.2`, ...). In diese wird die von docfx generierte Webseite gepackt.

Die Datei [Publish.cmd](Publish.cmd) im Root-Verzeichnis führt den kompletten Publish-Vorgang durch inkl. upload in des Repository fsdocs.