/**
 * @author Andrew Kohanovskij <akohan91@gmail.com>
 * Class wrapped "Map" class and extends its functionality
 */
@IsTest(isParallel=false)
public with sharing class TestSobjectCollection {
    static TestDataFactory tdf = new TestDataFactory();

    @IsTest
    static void insertRecordsTest(){
        User user = tdf.createLibakTestsUser();

        Test.startTest();
        System.runAs(user){
            Boolean isException = false;
            try {
                new SobjectCollection(new Account( Name = 'Andrew Kohanovskij' )).insertRecords();
            } catch (Exception exc) {
                isException = true;
                System.assertEquals(
                    'SObject "Account" is not creatable!',
                    exc.getMessage(),
                    'The message should be: "SObject "Account" is not creatable!"'
                );
            }
            System.assert(isException, 'An error should be accured from SobjectCollection instance when insert!');
            System.assertEquals(0, [SELECT count() FROM Account], 'An account Shouldn\'t be created!');

            isException = false;
            try {
                new SobjectCollection(new Contact(
                    firstName = 'Andrew',
                    LastName = 'Kohanovskij',
                    Title = 'title'
                )).insertRecords();
            } catch (Exception exc) {
                isException = true;
                System.assertEquals(
                    'Field "Title" of SObject "Contact" is not editable!',
                    exc.getMessage(),
                    'The message should be: "SObject "Contact" is not editable!"'
                );
            }
            System.assert(isException, 'An error should be accured from SobjectCollection instance when insert!');
            System.assertEquals(0, [SELECT count() FROM Contact], 'A contact Shouldn\'t be created!');
        }
        new SobjectCollection(new Account( Name = 'Andrew Kohanovskij' )).insertRecords();
        System.assertEquals(1, [SELECT count() FROM Account], 'Should be created 1 Account!');
        Test.stopTest();
    }
}