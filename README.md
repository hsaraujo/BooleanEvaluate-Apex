Apex code for boolean expression evaluation

# Usage:
This class has 2 different constructors with 2 methods each.

### First:
```java
public BooleanEvaluate(String expression, Boolean[] values){ ... }
```
So, the parameter 'expression' must be using ordinal numbers related to the parameter 'values'  (Examples below)

### Second:
```java
public BooleanEvaluate(String expression, String[] arguments){ ... }
```
So, the parameter 'expression' must be using arument numbers (preffixed with $) related to the parameter 'arguments' (Examples below)

# EXAMPLES

### First:

```java
List<Boolean> values = new List<Boolean>{
true, false, true, true, false, true, true, true
};

BooleanEvaluate boolEval = new BooleanEvaluate('1 && ( ( 2 || 3 ) && 6 ) && ( 4 && 5 || ( 7 && 8 ) )', values);
Boolean result = boolEval.evaluate(); // true
```

### Second:

```java
List<String> values = new List<String>{
'true', 'false', 'true', 'true', 'false', 'true', 'true', 'true'
};

BooleanEvaluate stringEval = new BooleanEvaluate('$1 && ( ( $2 || $3 ) && $6 ) && ( $4 && $5 || ( $7 && $8 ) )', values);
Boolean result = stringEval.evaluate(); // false
```
