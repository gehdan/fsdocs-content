# Vererbung von Metadatentypen

Es ist möglich, Metadatentypen zu vererben. Das macht dann Sinn, wenn Metadatentypen aufeinander aufbauen und z.B. ein gemeinsames Format-Pattern verwenden.

Sie können so in einem Basis-Metadatentyp mit allen Datentypen Controls und einem Default-Label definieren. Anschließend brauchen Sie diesen nur abzuleiten und die Ableitung hat die gleichen Eigenschaften wie die Basis. Dann können Sie noch z.B. das Label oder den Wertebereich ändern. In der Ableitung werden die nachträglich geänderten Werte fettgedruckt dargestellt.

Eine Ableitung können Sie auf zwei Wegen erstellen:

1. Einen Metadatentypen ableiten, indem Sie den Metadatentyp im Overview auswählen, den Button ![Derive](../media/button-derive.png)  (**Derive**) drücken und in der Namespace-Auswahl angeben, in welchem Namespace die Ableitung angelegt werden soll.

2. Einem vorhandenen Metadatentypen im Feld **Base** eine Basis (oder auch eine andere Basis) zuweisen.

    > [!WARNING]
    > Wird beim Ändern der Basis auch der Datentyp geändert, kann das evtl. Auswirkungen auf die Programmteile haben, die diesen Metadatentypen bereits verwenden. Unter Umständen lassen sich diese Programmteile nicht mehr kompilieren.
