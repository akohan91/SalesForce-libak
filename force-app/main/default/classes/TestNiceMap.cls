@IsTest(isParallel=false)
public with sharing class TestNiceMap {
    @IsTest
    static void dataTest(){
        Test.startTest();
        NiceMap testNiceMap = new NiceMap();
        Map<String, Object> result = testNiceMap.data();
        System.assert(result.isEmpty(), 'Returned map should be empty!');

        testNiceMap = new NiceMap('{"name": "Andrew"}');
        result = testNiceMap.data();
        System.assertEquals(result.get('name'), 'Andrew', 'The map should contain map with the key "name" and value "Andrew"');

        testNiceMap = new NiceMap(new Map<String, String>{'name' => 'Andrew'});
        result = testNiceMap.data();
        System.assertEquals(result.get('name'), 'Andrew', 'The map should contain map with the key "name" and value "Andrew"');
        Test.stopTest();
    }

    @IsTest
    static void valueTest(){
        Test.startTest();
        NiceMap testNiceMap = new NiceMap(new Map<String, Object>{
            'string' => 'Hello, world',
            'array' => new List<Integer>{0, 1, 2, 3, 4},
            'map' => new Map<String, String>{
                'oneItem' => 'oneItem',
                'secondItem' => 'secondItem'
            }
        });

        System.assertEquals(null, testNiceMap.value(new List<String>()), 'method should return "null".');
        System.assertEquals(null, testNiceMap.value('unknown.0'), 'method should return "null" string by key "unknown.0"');
        System.assertEquals('Hello, world', testNiceMap.value('string'), 'method should return "Hello, world" string by key "string"');
        System.assertEquals(2, testNiceMap.value('array.2'), 'method should return "2" number by key "array.2"');
        System.assertEquals('secondItem', testNiceMap.value('map.secondItem'), 'method should return "secondItem" string by key "map.secondItem"');
        Test.stopTest();
    }

    @IsTest
    static void putValueTest(){
        Test.startTest();
        NiceMap testNiceMap = new NiceMap();
        testNiceMap.putValue('string', 'Hello, world');
        System.assertEquals('Hello, world', testNiceMap.value('string'), 'method should return "Hello, world" string by key "string"');

        testNiceMap.putValue('array.0', 0);
        testNiceMap.putValue('array.1', 1);
        testNiceMap.putValue('array.2', 2);
        System.assertEquals(3, ((List<Object>)testNiceMap.value('array')).size(), 'Size of included addray should be "3"');
        System.assertEquals(2, testNiceMap.value('array.2'), 'method should return "2" number by key "array.2"');

        testNiceMap.putValue('array.2', 3);
        System.assertEquals(3, testNiceMap.value('array.2'), 'method should return "3" number by key "array.2"');

        testNiceMap.putValue('array.2.test', 'test_1');
        System.assertEquals('test_1', testNiceMap.value('array.2.test'), 'method should return "test_1" string by key "array.2.test"');

        testNiceMap.putValue('map.secondItem.0.test', 'test_2');
        System.assertEquals('test_2', testNiceMap.value('map.secondItem.0.test'), 'method should return "test_2" string by key "map.secondItem.0.test"');
        Test.stopTest();
    }
}
