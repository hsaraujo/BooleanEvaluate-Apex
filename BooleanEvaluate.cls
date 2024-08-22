/**
 * @author: Heitor Araujo on 24/10/2017.
 */

 public with sharing class BooleanEvaluate {

    private static final String ANDv = 'AND';
    private static final String ORv = 'OR';
    private static final String OPEN = '(';
    private static final String CLOSE = ')';

    /**
     * @description Evaluates a boolean expression to a boolean result
     * @param expression Expression [eg. `1 || ( 2 && 3 )` ]
     * @param values List of boolean values to be evaluated with the expression
     * @return final boolean evaluation
     */
    public static Boolean evaluate(String expression, Boolean[] values){
        expression = expression.replaceAll('\\|\\|', 'OR').replaceAll('&&', 'AND');
        expression = formatExpression(expression, values);

        if(!expression.contains(OPEN)){
            return evaluateExpression(expression);
        }

        Integer indexOfOpen = -1;
        Integer indexOfClose = -1;

        String[] chars = expression.split('');
        for(Integer i = 0; i < chars.size(); i++){

            String singleChar = chars[i];

            if(singleChar == OPEN) {
                indexOfOpen = i;
                continue;
            }

            if(singleChar == CLOSE) {
                indexOfClose = i;
                break;
            }
        }

        String replace = expression.substring(indexOfOpen + 1 , indexOfClose);
        expression = expression.replace( OPEN + replace + CLOSE, String.valueOf( evaluateExpression(replace) ) );
        return evaluate(expression, values);
    }

    private static Boolean evaluateExpression(String expression){

        Boolean result = false;
        for( String conj : expression.split(ORv) ){

            Boolean b = true;
            for( String single : conj.split(ANDv) ){
                b &= Boolean.valueOf(single.trim());
            }

            result |= b;
        }

        return result;

    }

    private static String formatExpression(String originalExpression, Boolean[] values){

        String formattedExpression = originalExpression;
        String[] arguments = formattedExpression.split(' ');
        for(String arg : arguments){
            try{
                Integer index = Integer.valueOf(arg);
                formattedExpression = formattedExpression.replace(arg, String.valueOf(values[index - 1]));
            }catch(Exception e){
                continue;
            }
        }
        return formattedExpression;
    }
}
