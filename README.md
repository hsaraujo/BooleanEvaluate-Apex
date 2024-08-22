Apex code for boolean expression evaluation

# Usage:
This class has one constructor and one method

### First:
```java
public BooleanEvaluate(String expression, Boolean[] values){ ... }
```
The parameter 'expression' must be using ordinal numbers according to the parameter 'values'  (Examples below)

# Examples

### First:

```java
List<Boolean> values = new List<Boolean>{
true, false, true, true, false, true, true, true
};

BooleanEvaluate boolEval = new BooleanEvaluate('1 && ( ( 2 || 3 ) && 6 ) && ( 4 && 5 || ( 7 && 8 ) )', values);
Boolean result = boolEval.evaluate(); // true
```