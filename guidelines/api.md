# Api Dokumentation

Die Api-Dokumentation wird aus dem Source-Code des Framework Studio Projektes generiert.

Es werden ausschließlich Klassen und Member dokumentiert, die mit dem Attribut `[DocfxBrowsable]` versehen sind.

Beispiel:

```csharp
namespace FrameworkSystems.FrameworkExceptions
{
    /// <summary>
    /// Exceptions die vom Framework geworfen werden und einen erwarteten
    /// Fehler darstellen sollten von dieser Klasse sein. Der Broker gibt
    /// diese dann als Fehler ohne StackTrace an den Client weiter.
    /// </summary>
    [DocfxBrowsable]
    public class FrameworkApplicationException : System.ApplicationException
    {
        private int severity;

        /// <summary>
        /// Beschreibung des Konstruktors.
        /// </summary>
        /// <param name="msg"></param>
        [DocfxBrowsable]
        public FrameworkApplicationException(string msg) : base(msg)
        {
        }
```

## \<Summary>-Block

Der Code-Kommentar beinhaltet alle Informationen, die in der Api-Dokumentation aufgeführt werden sollen.

Die Block **\<summary>** umfasst eine kurze aber aussagekräftige Beschreibung der Klasse bzw. des Members. Kurz deswegen, weil die Summary in den Übersicht-Seiten angezeigt wird.

Weiterführende Informationen und Beispiele werden in den anderen Blöcken **\<remarks>** und **\<examples>** abgelegt. Diese werden in der Details-Seite angezeigt.

### Code-Beispiele

Inline:

```xml
/// das ist ein <c>Code</c>.
```

Multiline:

```xml
/// <code>
/// using(this.GetDisposable())
/// {
///     this.MyMethod1();
/// }
/// </code>
```

Spitze Klammern \<> im Code führen zu XML-Fehlern beim Parsen der Doku. Diese durch ein CData unterbunden werden:

```xml
/// Die Klasse <c><![CDATA[List<string>]]></c> verwenden
///
/// <code><![CDATA[
/// this.list = new List<string>();
/// ]]></code>
```

## Links auf den doc-Bereich

**Variante 1:** Link auf eine **uid**. Diese Variante ist zu favorisieren.

```xml
/// <summary>
/// Ein Link auf [ML-Column](xref:ml-column)
/// </summary>
```

Dazu muss die entsprechende Datei mit im Header mit der **uid** versehen werden:

```md
---
uid: ml-column
---

# ML-Column
```

**Variante 2:** link auf die md-Datei mit einem relativen Pfad.

Die Links beginnen mit `~/doc/`.

```csharp
/// <summary>
/// Ein Link auf [ML-Column](~/doc/database/ml-column.md)
/// </summary>
```
