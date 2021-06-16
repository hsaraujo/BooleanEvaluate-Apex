public with sharing class ExpressionEvaluator {
    private static final String ANDv = 'AND';
    private static final String ORv = 'OR';
    private static final String OPEN = '(';
    private static final String CLOSE = ')';


    //TODO might want to overload this with the fully simplified expression?
    public static Boolean evaluateExpression(String expression, Boolean[] booleans){
        for (Integer i = booleans.size(); i >= 1; i--) {
            expression = expression.replaceAll(String.valueOf(i), String.valueOf(booleans.get(i - 1)));
        }

        return evaluateExpression(expression);
    }

    private static Boolean evaluateExpression(String expression){
        if(!expression.contains(OPEN)){
            return evaluateSimpleExpression(expression);
        }

        Integer indexOfOpen = -1;
        Integer indexOfClose = -1;

        String[] chars = expression.split('');
        for(Integer i = 0; i < chars.size(); i++){
            if(chars[i] == OPEN) {
                indexOfOpen = i;
                continue;
            }

            if(chars[i] == CLOSE) {
                indexOfClose = i;
                break;
            }
        }

        String innerExpression = expression.substring(indexOfOpen + 1 , indexOfClose);
        expression = expression.replace( OPEN + innerExpression + CLOSE, String.valueOf( evaluateExpression(innerExpression) ) );
        return evaluateExpression(expression);
    }

    private static Boolean evaluateSimpleExpression(String expression){
        Boolean result = false;
        for(String conj : expression.split(ORv)){
            Boolean b = true;
            for(String single : conj.split(ANDv)){
                b &= Boolean.valueOf(single.trim());
            }

            result |= b;
        }

        return result;
    }
}