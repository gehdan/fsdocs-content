---
uid: fs-types
---

# FS-Datentypen

FS-Datentypen verhalten sich fast genauso wie die .NET-Datentypen mit ähnlich lautenden Namen. Der Unterschied zu den .NET-Datentypen besteht darin, dass sie einen Null-Wert verstehen.

Die FS-Datentypen sind die Basis für die Metadatentypen. Sie können aber auch als Datentyp für Properties oder einfach frei im Code verwendet werden. Sie sollten immer dann verwendet werden, wenn die Null-Information nicht verloren gehen darf.

Mit diesen Datentypen ist es möglich, Null-Werte aus einer Datenbank auszuwerten und auch wieder in die Datenbank zurückzuschreiben. Außerdem können z.B. Datenfelder in Forms, die eine Zahl oder ein Datum enthalten, komplett leer sein, was z.B. bei Suchfeldern wichtig ist.

Bei den FS-Datentypen handelt es sich ebenfalls um Structs. Die Wertzuweisungen zwischen verschiedenen FS-Datentypen erfolgen also ByValue – wie bei den .NET-Datentypen auch. Variablen und Properties von einem FS-Datentyp können genauso verwendet werden wie Variablen und Properties von .NET-Datentypen. Es können auch Zuweisungen zwischen den verschiedenen Datentypen erfolgen. Es erfolgt in den meisten Fällen eine implizite Konvertierung der Datentypen. Die Null-Information geht dabei aber verloren.

## Properties der FS-Datentypen

**Value:** (Property) Wert des FS-Datentyps als .NET-Datentyp. D.h.: FSdecimal.Value liefert einen Wert vom Typ dezimal. Dieser Wert kann sowohl gelesen als auch geschrieben werden. Ist der Wert der Variable Null, liefert Value den in der folgenden Tabelle angegebenen Wert aus der Spalte Null-Value zurück. Das Setzen des Wertes der Variable auf einen Null-Value hat aber **nicht** zur Folge, dass die Variable Null wird. Einzige Ausnahme ist FSstring: IsNull bedeutet Value=““ und Value=““ bedeutet IsNull.

<u>Beispiel:</u>

```csharp
FSdecimal decVar1 = 0;

// Wert auf 0 oder Null prüfen
if (decVar1.Value == 0)
{ … }

// Variante ohne Value
if (decVar1.IsNull || decVar1 == 0 )
{ … }

// Wert zuweisen:
decVar1 = 5;

//oder
decVar1.Value = 5;
```

### IsNull (Property)

Ist vom Typ `bool`.

Gibt an, ob der Wert der Variable Null ist. Um einem FS-Datentypen explizit ein Null zuzuweisen, gibt es zwei Möglichkeiten:

Sie weisen dem Property ***IsNull*** `true` zu, oder
Sie weisen der Variable `FSxxx.Null` zu

```csharp
FSdecimal decVar1 = 0;

// Wert nur auf Null prüfen
if (decVar1.IsNull)
{ … }

// Wert auf Null setzen
decVar1.IsNull = true;

// oder
decVar1 = FSdecimal.Null;
```

### Null (Statisches Property)

Liefert eine Variable mit einem Null-Wert.

```csharp
// Variable mit Null initialisieren
FSdecimal decVar2 = FSdecimal.Null;
```

Es folgt eine Tabelle mit allen FS-Datentypen und deren Null-Value.

|.NET-Datentyp | FS-Datentyp                                                                | Null-Value        |
|:-------------|:---------------------------------------------------------------------------|:------------------|
| bool         | [FSBool](xref:FrameworkSystems.FrameworkBase.Metadatatype.FSbool)          | false             |
| byte         | [FSbyte](xref:FrameworkSystems.FrameworkBase.Metadatatype.FSbyte)          | 0                 |
| DateTime     | [FSDateTime](xref:FrameworkSystems.FrameworkBase.Metadatatype.FSDateTime)  | DateTime.MinValue |
| decimal      | [FSdecimal](xref:FrameworkSystems.FrameworkBase.Metadatatype.FSdecimal)    | 0                 |
| double       | [FSdouble](xref:FrameworkSystems.FrameworkBase.Metadatatype.FSdouble)      | 0                 |
| float        | [FSfloat](xref:FrameworkSystems.FrameworkBase.Metadatatype.FSfloat)        | 0                 |
| int          | [FSint](xref:FrameworkSystems.FrameworkBase.Metadatatype.FSint)            | 0                 |
| long         | [FSlong](xref:FrameworkSystems.FrameworkBase.Metadatatype.FSlong)          | 0                 |
| short        | [FSshort](xref:FrameworkSystems.FrameworkBase.Metadatatype.FSshort)        | 0                 |
| string       | [FSstring](xref:FrameworkSystems.FrameworkBase.Metadatatype.FSstring)      | `String.Empty`    |

### HasValue (Property)

Ist vom Typ `bool`.

Man kann mit [IsNull](#isnull-property) prüfen, ob ein FSType ([FSstring](xref:FrameworkSystems.FrameworkBase.Metadatatype.FSstring), [FSdecimal](xref:FrameworkSystems.FrameworkBase.Metadatatype.FSdecimal), …) `null` ist. Wenn das Gegenteil geprüft werden soll, kann das Property [HasValue](#hasvalue-property) verwendet werden. So wird der Code deutlich lesbarer, vor allem dann, wenn das zu prüfende Property tief verschachtelt ist.

<u>Beispiel:</u>

```csharp
// herkömmlicher Weg (Das Ausrufezeichen wird schnell überlesen):
if (!this.oOrder.oCustomer.sCompany1.IsNull)

// neuer Weg:
if (this.oOrder.oCustomer.sCompany1.HasValue)
```

### FSDateTime.Now

Statisches Property am Typ [FSDateTime](xref:FrameworkSystems.FrameworkBase.Metadatatype.FSDateTime), welches das aktuelle System-Datum sekundengenau zurückgibt.

Wenn man mit der Datenbank oder auch mit Benutzer-Eingaben arbeitet, werden in der Regel sekundengenaue Werte verarbeitet. Wenn man mit dem `System.DateTime.Now` arbeitet, erhält man einen um mehrere Zehnerpotenzen genaueren Wert. Bei Vergleichen mit Benutzereingaben weichen diese dann von `System.DateTime.Now` ab.

Es wird daher empfohlen, alle Daten, die mit dem aktuellen Datum initialisiert werden sollen, mit [FSDateTime.Now](xref:FrameworkSystems.FrameworkBase.Metadatatype.FSDateTime.Now) zu initialisieren.

<u>Beispiel:</u>

```csharp
// Variable mit sekundengenauem Wert der aktuellen Zeit initialisieren
FSDateTime dtMyDate = FSDateTime.Now;
```

Wenn mit genaueren Werten gearbeitet werden soll, ist die folgende Initialisierung ebenfalls möglich:

```csharp
// Variable möglichst genau mit der aktuellen Zeit initialisieren
FSDateTime dtMyAccurateDate = DateTime.Now;
```
