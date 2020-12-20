# **Libak Package**

The Libak package provides some features that will help your development process.

## NiceMap class
### **Description**
The NiceMap class improves your work with the maps. The commont use case is the working with JSON fromat. But you also can use it in other cases.

### **Properties**
```js
protected Map<String, Object> data;
```

### **Constructors**

```js
global NiceMap(Map<String, Object> data) {}
```
The common constructor takes the map and assigns it to `data` property

```js
global NiceMap(String sourceJSON) {}
```
The constructor takes the JSON and than deserializes and assigns it to `data` property

```js
global NiceMap() {}
```
The constructor nothing takes but create the empty map and assigns it to `data` property

### **Methods**

### **`data()`**
The method just returns the `data` property

### **`value(String path)`**

The method takes the path to the element as string separated by dot `"."` and returns the value with type `Object`. For example:

**Arguments:**

`String path`

**Returns:**

`Object || null`

```js
String JSONstring = '{"array":["Hello, world!"]}';
NiceMap awesomeMap = new NiceMap(JSONstring);
System.debug(awesomeMap.value('array.0')); // Hello, world!
```

### **`value(List<String> path)`**

The method takes the path to the element separated as List of Strings and returns the value with type `Object`. For example:

**Arguments:**

`List<String> path`

**Returns:**

`Object || null`

```js
String JSONstring = '{"array":["Hello, world!"]}';
NiceMap awesomeMap = new NiceMap(JSONstring);
System.debug(awesomeMap.value(new List<String>{'array', '0'})); // Hello, world!
```

### **`putValue (String path, Object value)`**

The method creates new or changes an existing value.

**Arguments:**

- `String path`

- `Object value`

**Returns:**

- `void`
```js
String JSONstring = '{"array":["Hello, world!"]}';
NiceMap awesomeMap = new NiceMap(JSONstring);
System.debug(awesomeMap.value('array.0')); // Hello, world!

awesomeMap.putValue('array.1', 'My name is Andrew!');
System.debug(awesomeMap.value('array.1')); // My name is Andrew!

awesomeMap.putValue('array', new List<String> {'Great', ' feature!'});
System.debug(
	(String) awesomeMap.value('array.0') +
	(String) awesomeMap.value('array.1')
); // Great feature!
```

### **`putValue (List<String> path, Object value)`**

The method creates new or changes an existing value.

**Arguments:**

- `List<String> path`

- `Object value`

**Returns:**

- `void`
```js
String JSONstring = '{"array":["Hello, world!"]}';
NiceMap awesomeMap = new NiceMap(JSONstring);
System.debug(awesomeMap.value('array.0')); // Hello, world!

awesomeMap.putValue(new List<String>{'array', '1'}, 'My name is Andrew!');
System.debug(awesomeMap.value('array.1')); // My name is Andrew!

awesomeMap.putValue(new List<String>{'array'}, new List<String> {'Great', ' feature!'});
System.debug(
	(String) awesomeMap.value('array.0') +
	(String) awesomeMap.value('array.1')
); // Great feature!
```

### **`hasPath (String path)`**

The method checks is there the path in the map

**Arguments:**

- `String path`

**Returns:**

- `Boolean`

```js
String JSONstring = '{"array":["Hello, world!"]}';
NiceMap awesomeMap = new NiceMap(JSONstring);

System.debug(awesomeMap.hasPath('array')); // true
System.debug(awesomeMap.hasPath('array.0')); // true
System.debug(awesomeMap.hasPath('array.1')); // false
```

### **`json ()`**

Convert the map to JSON

**Returns:**

- `String`

```js
NiceMap awesomeMap = new NiceMap(
	new Map<String, Object>{
		'id' => 'uniqueId',
		'message' => 'Hello, World!'
	}
);

System.debug(awesomeMap.json()); // {"message":"Hello, World!","id":"uniqueId"}
```