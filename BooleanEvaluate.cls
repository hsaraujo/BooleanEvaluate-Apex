/**
 * @author: Heitor Araujo on 24/10/2017.
 */

public with sharing class BooleanEvaluate {

    private String expression;
    private Boolean[] values;
    private String finalExpression;

    private static final String ANDv = 'AND';
    private static final String ORv = 'OR';
    private static final String OPEN = '(';
    private static final String CLOSE = ')';

    public BooleanEvaluate(String expression, Boolean[] values){

//        this.expression = expression;
        this.expression = expression.replaceAll('\\|\\|', 'OR').replaceAll('&&', 'AND');
        this.values = values;
    }

    public void evaluate(){

        manageExpression();
        evaluate(this.expression);
        System.debug(this.expression);
        System.debug(this.finalExpression);
        System.debug(evaluateExpression(this.finalExpression));

    }

    private void evaluate(String expression){

        if(!expression.contains(OPEN)){
            this.finalExpression = expression;
            return;
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
        System.debug(replace);
        System.debug(expression);
        System.debug('########');
        evaluate(expression);

    }

    private Boolean evaluateExpression(String expression){

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

    private void manageExpression(){

        String[] arguments = expression.split(' ');
        for(String arg : arguments){
            try{
                Integer index = Integer.valueOf(arg);
                this.expression = this.expression.replace(arg, String.valueOf(this.values[index - 1]));
            }catch(Exception e){
                continue;
            }
        }

        System.debug(this.expression);
    }
}