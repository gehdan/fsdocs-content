# Gerätespezifische Funktionen

Nachfolgend werden diejenigen Funktionen erläutert, die nur auf spezifischen Geräten verfügbar sind. Es ist nicht oder nur eingeschränkt möglich, vom Browser aus auf native Funktionen wie z.B. das Dateisystem zuzugreifen. Dadurch hat der HTML Client auf mobilen Geräten mehr Möglichkeiten als im Browser.

## Barcode Scanner (nur mobile Geräte)

Über die in einem mobilen Gerät integrierte Kamera können im HTML Client Barcodes unterschiedlicher Formate eingescannt werden.

### Unterstützte Formate

|Name|Beispiel|
|---|---|
|AZTEC|![Aztec](media/barcodes/aztec.png)|
|CODABAR|![Codabar](media/barcodes/codabar.png)|
|CODE_39|![Aztec](media/barcodes/code_39.png)|
|CODE_93|![Aztec](media/barcodes/code_93.png)|
|CODE_128|![Aztec](media/barcodes/code_128.png)|
|DATA_MATRIX|![Aztec](media/barcodes/data_matrix.png)|
|EAN_8|![Aztec](media/barcodes/ean_8.png)|
|EAN_13|![Aztec](media/barcodes/ean_13.png)|
|ITF|![Aztec](media/barcodes/itf.png)|
|PDF_417|![Aztec](media/barcodes/pdf_417.png)|
|QR_CODE|![Aztec](media/barcodes/qr_code.png)|
|UPC_A|![Aztec](media/barcodes/upc_a.png)|
|UPC_E|![Aztec](media/barcodes/upc_e.png)|

### Action ScanBarcode()

In Framework Studio wird ein Scan über folgende Action am Form gestartet:

```C#
ScanBarcode(Action<IFrameworkBarcodeScanInfo> callback, BarcodeFormat allowedFormat)

ScanBarcode(Action<IFrameworkBarcodeScanInfo> callback, BarcodeFormat allowedFormat, string identifier)
```

**Beispiel:**

![Scan](media/scan.png)

#### Parameter `Action<IFrameworkBarcodeScanInfo> callback`

Wenn der Scanvorgang am Client abgeschlossen ist, wird der übergebene Callback aufgerufen. Der Callback ist vom Typ

```C#
Action<IFrameworkBarcodeScanInfo>
```

**IFrameworkBarcodeScanInfo Properties**

|Property|Typ|Beschreibung|
|---|---|---|
|Cancelled|bool|`true` wenn der Scanvorgang am Client abgebrochen wurde|
|ErrorMessage|string|Fehlermeldung bei einem gescheiterten Scanvorgang|
|Format|BarcodeFormat|Das Format des gescannten Barcodes|
|HasError|bool|`true` wenn beim Scanvorgang ein Fehler aufgetreten ist|
|Identifier|string|Der in `ScanBarcode()` übergebene Wert, sonst `null`|
|Value|string|Der Wert des gescannten Barcodes|

**Beispiel:**

![Callback](media/callback.png)

#### Parameter `BarcodeFormat allowedFormat`

Definiert, welches Barcode-Format am Client bei einem Scanvorgang unterstützt wird.

> [!NOTE]
> Es wird dringend empfohlen, nur diejenigen Barcode-Formate zu übergeben, die auch tatsächlich beim Scanvorgang unterstützt werden sollen, um Fehler beim Scannen zu vermeiden. Je geringer die Anzahl der unterstützten Formate ist, desto unwahrscheinlicher ist es, dass der Scan fehlschlägt.

**Beispiel:**

Wenn am Client z.B. CODE_128 und ITF unterstützt werden soll, so können diese per bitweiser Oder-Verknüpfung übergeben werden.

![Scan](media/scan.png)

#### Parameter `string identifier`

Es kann vorkommen, dass auf einem Form mehrere Buttons einen Scan initiieren können. Beispielsweise könnte erst ein Auftrag und nachfolgend eine Menge eingescannt werden. Es ist aber oft nicht praktikabel, für jeden Scanvorgang einen separaten Callback zu implementieren.

Anstatt dessen kann der `ScanBarcode()`-Action einfach ein beliebiger `string` mitgegeben werden, über den der Scanvorgang im Callback identifiziert werden kann.

**Beispiel:**

![Identifier](media/identifier.png)

### Berechtigung für Kamera

Der Barcode Scanner benötigt auf dem mobilen Gerät Zugriff auf die Kamera. Diese muss z.B. auf einem Android-Gerät einmalig erteilt werden:

![Permission](media/permission.png)