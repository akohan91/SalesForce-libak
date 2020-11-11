# **Libak Package**

The Libak package provides some features that will help your development process.

## Libak_Map class
### **Description**
The Libak_Map class improves your work with the maps. The commont use case is the working with JSON fromat. But you also can use it in other cases.

### **Properties**
```java
protected Map<String, Object> data;
```

### **Constructors**

```java
public Libak_Map(Map<String, Object> data) {}
```
The common constructor takes the map and assigns it to `data` property

```java
public Libak_Map(String sourceJSON) {}
```
The constructor takes the JSON and than deserializes and assigns it to `data` property

```java
public Libak_Map() {}
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

```java
String JSONstring = '{"array":["Hello, world!"]}';
Libak_Map awesomeMap = new Libak_Map(JSONstring);
System.debug(awesomeMap.value('array.0')); // Hello, world!
```

### **`value(List<String> path)`**

The method takes the path to the element separated as List of Strings and returns the value with type `Object`. For example:

**Arguments:**

`List<String> path`

**Returns:**

`Object || null`

```java
String JSONstring = '{"array":["Hello, world!"]}';
Libak_Map awesomeMap = new Libak_Map(JSONstring);
System.debug(awesomeMap.value(new List<String>{'array', '0'})); // Hello, world!
```

### **`putValue (String path, Object value)`**

The method creates new or changes an existing value. 

**Arguments:**

- `String path`

- `Object value`

**Returns:**

- `void`
```java
String JSONstring = '{"array":["Hello, world!"]}';
Libak_Map awesomeMap = new Libak_Map(JSONstring);
System.debug(awesomeMap.value('array.0')); // Hello, world!

awesomeMap.putValue('array.1', 'My name is Andrew!');
System.debug(awesomeMap.value('array.1')); // My name is Andrew!

awesomeMap.putValue('array', new List<String> {'Great', ' feature!'});
System.debug(
	(String) awesomeMap.value('array.0') + 
	(String) awesomeMap.value('array.1')
); // Great feature! 
```
