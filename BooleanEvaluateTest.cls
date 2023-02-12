/**
 * @author: Heitor Araujo on 24/10/2017.
 */

@IsTest
private class BooleanEvaluateTest {

    @IsTest
    static void evaluateTest(){

        BooleanEvaluate eval = new BooleanEvaluate(
            '1 AND 2',
            new List<Boolean> { true, true }
        );

        Assert.areEqual(true, eval.evaluate());

        eval = new BooleanEvaluate(
            '1 AND 2 AND ( 3 OR 4 )',
            new List<Boolean> { true, true, true, false }
        );

        Assert.areEqual(true, eval.evaluate());

        eval = new BooleanEvaluate(
            '1 AND 2 AND ( 3 OR 4 )',
            new List<Boolean> { false, true, true, false }
        );

        Assert.areEqual(false, eval.evaluate());

        eval = new BooleanEvaluate(
            '1 AND ( 2 AND ( 3 OR 4 ) )',
            new List<Boolean> { true, true, true, false }
        );

        Assert.areEqual(true, eval.evaluate());
    }
}
