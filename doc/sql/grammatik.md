# SQL-Grammatik

Im Folgenden ist die Grammatik beschrieben, die vom Framework Studio SQL-Parser verstanden wird. Alle an die Datenbank geschickten Befehle müssen dieser Grammatik genügen, ansonsten kommt es zu SqlParser-Exceptions.

## Grammatik für SQL-Kommandos

* `<select>`

    ```sql
    SELECT [DISTINCT] { * | <resultColumn>[,…n] }
    FROM { <singleSource> | <joinSource> }
    [ WHERE <condition> ]
    [ GROUP BY <value>[,…n] [HAVING <condition>]]
    [ {UNION [ALL] | INTERSECT | EXCEPT} <select(ohne orderby)> ]
    [ ORDER BY <orderColumn>[,…n] ]
   ```

* `<insert>`

    ```sql
    INSERT INTO <identifierChain> ( <identifier>[,…n] )
    {
        VALUES ( <value>[,…n] )
    | <select>
    }
    ```

* `<update>`

    ```sql
    UPDATE <identifierChain>
    SET {<identifierChain> = <value> } [,…n]
    [ WHERE <condition> ]
    ```

* `<delete>`

    ```sql
    DELETE [FROM] <identifierChain>
    [ WHERE <condition> ]
    ```

## Grammatik für die Bestandteile der Kommandos

* `<resultColumn>`

    ```sql
    <identifierChain>.*
        | <value> [AS <identifier>]
    ```

* `<singleSource>`

    ```sql
    ( <singleSource> )
    | <identifierChain> [ [AS] <identifier> ]
    ```

* `<joinSource>`

    ```sql
    ( <joinSource> )

    | { <singleSource> | <joinSource> }
    { INNER | {LEFT | RIGHT | FULL} [OUTER] } JOIN
    { <singleSource> | <joinSource> } ON <condition>
    ```

* `<condition>`

    ```sql
    ( <condition> )
    | NOT <condition>
    | <condition> {{ AND | OR } <condition>}[,…n]
    | <value> <predicate2>
    | EXISTS ( <select> )
    ```

* `<predicate2>`

    ```sql
    { = | != | < | <= | > | >= } <value>
    | IS [NOT] NULL
    | BETWEEN <value> AND <value>
    | IN ( <select> | <value> [,…n] )
    | LIKE <value>
    | LIKEESCAPE <value>
    ```

* `<value>`

    ```sql
    NULL
    | ( <value> )
    | { - | + } <value>
    | <value> { + | - | * | / | “||” } <value>
    | <identifierChain>
    | [<identifierChain>.] <FunktionsName> ( [ <value> [,…n] ] )
    | <searchedCaseWhen>
    | <simpleCaseWhen>
    | "[[" <natives sql fragment> "]]"
    | <stringLiteral>
    | <integerValue>
    | <decimalValue>
    ```

* `<searchedCaseWhen>`

    ```sql
    CASE {WHEN <condition> THEN <value>}[,…n]
    [ ELSE <value> ] END
    <simpleCaseWhen>
    CASE <value>
    {WHEN {<predicate2> | <value>} THEN <value>}[,…n]
    [ ELSE <value> ] END
    ```

* `<orderColumn>`

    ```sql
    <value> [ASC | DESC]
    ```

* `<identifierChain>`

    ```sql
    <identifier>[.<identifier>][,…n]
    ```

* `<identifier>`

    ```sql
    "[" <beliebige Zeichenfolge> "]"
    | <Wort, mit einem Buchstaben beginnend>
    ```
