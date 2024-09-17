Apex code for boolean expression evaluation

# Usage:
This class one public static method

### First:
```java
public Boolean BooleanEvaluate.evaluate(String expression, Boolean[] values){ ... }
```
The parameter 'expression' must be using ordinal numbers according to the parameter 'values'  (Examples below)

# Examples

### First:

```java
List<Boolean> values = new List<Boolean>{
true, false, true, true, false, true, true, true
};

String expression = '1 && ( ( 2 || 3 ) && 6 ) && ( 4 && 5 || ( 7 && 8 ) )';

Boolean result = BooleanEvaluate.evaluate(expression, values);
```
