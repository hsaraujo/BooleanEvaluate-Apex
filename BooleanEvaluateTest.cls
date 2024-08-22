/**
 * @author: Heitor Araujo on 24/10/2017.
 */

 @IsTest
 private class BooleanEvaluateTest {
 
     @IsTest
     static void evaluateTest(){
 
         Boolean result1 = BooleanEvaluate.evaluate(
             '1 AND 2',
             new List<Boolean> { true, true }
         );
 
         Assert.areEqual(true, result1);
 
         Boolean result2 = BooleanEvaluate.evaluate(
             '1 AND 2 AND ( 3 OR 4 )',
             new List<Boolean> { true, true, true, false }
         );
 
         Assert.areEqual(true, result2);
 
         Boolean result3 = BooleanEvaluate.evaluate(
             '1 AND 2 AND ( 3 OR 4 )',
             new List<Boolean> { false, true, true, false }
         );
 
         Assert.areEqual(false, result3);
 
         Boolean result4 = BooleanEvaluate.evaluate(
             '1 AND ( 2 AND ( 3 OR 4 ) )',
             new List<Boolean> { true, true, true, false }
         );
 
         Assert.areEqual(true, result4);
     }
 }
 