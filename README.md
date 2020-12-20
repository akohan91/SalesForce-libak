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
public NiceMap(Map<String, Object> data) {}
```
The common constructor takes the map and assigns it to `data` property

```js
public NiceMap(String sourceJSON) {}
```
The constructor takes the JSON and than deserializes and assigns it to `data` property

```js
public NiceMap() {}
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
# ** Пакет Libak ** Пакет Libak предоставляет некоторые функции, которые помогут вашему процессу разработки. ## NiceMap класс ### **Описание** Класс NiceMap улучшает вашу работу с картами. Обычный вариант использования - работа с JSON fromat. Но вы можете использовать его и в других случаях. ### ** Свойства ** `` js защищенные данные Map <String, Object>; `` '' ### ** Конструкторы ** `` js public NiceMap (данные карты <String, Object>) {} `` Общий конструктор берет карту и присваивает ее свойству data. `` js public NiceMap (String sourceJSON) {} `` Конструктор принимает JSON, десериализует его и назначает его свойству data. `` js public NiceMap () {} `` '' Конструктор ничего не берет, кроме создания пустой карты и присваивает ее свойству data. ### ** Методы ** ### ** `данные ()` ** Метод просто возвращает свойство data. ### ** `value (String path)` ** Метод принимает путь к элементу в виде строки, разделенной точкой `". "`, И возвращает значение с типом `Object`. Например: ** Аргументы: ** `Путь к строке` ** Возвращает: ** `Объект || null` `` js Строка JSONstring = '{"массив": ["Привет, мир!"]}'; NiceMap awesomeMap = новая NiceMap (JSONstring); System.debug (awesomeMap.value ('array.0')); // Привет, мир! `` '' ### ** `значение (Список <String> путь)` ** Метод берет путь к элементу, разделенному как список строк, и возвращает значение с типом `Object`. Например: ** Аргументы: ** `Список <String> путь` ** Возвращает: ** `Объект || null` `` js Строка JSONstring = '{"массив": ["Привет, мир!"]}'; NiceMap awesomeMap = новая NiceMap (JSONstring); System.debug (awesomeMap.value (новый список <String> {'array', '0'})); // Привет, мир! `` '' ### ** `putValue (String path, Object value)` ** Метод создает новое или изменяет существующее значение. ** Аргументы: ** - `String path` - `Ценность объекта` ** Возвращает: ** - `пустота` `` js Строка JSONstring = '{"массив": ["Привет, мир!"]}'; NiceMap awesomeMap = новая NiceMap (JSONstring); System.debug (awesomeMap.value ('array.0')); // Привет, мир! awesomeMap.putValue ('array.1', 'Меня зовут Эндрю!'); System.debug (awesomeMap.value ('array.1')); // Меня зовут Андрей! awesomeMap.putValue ('массив', новый список <String> {'Отлично', 'особенность!'}); System.debug ( (Строка) awesomeMap.value ('array.0') (Строка) awesomeMap.value ('массив.1') ); // Отличная возможность! `` '' ### ** `putValue (Список <String> путь, значение объекта)` ** Метод создает новое или изменяет существующее значение. ** Аргументы: ** - `Список <String> путь` - `Ценность объекта` ** Возвращает: ** - `пустота` `` js Строка JSONstring = '{"массив": ["Привет, мир!"]}'; NiceMap awesomeMap = новая NiceMap (JSONstring); System.debug (awesomeMap.value ('array.0')); // Привет, мир! awesomeMap.putValue (новый список <String> {'array', '1'}, 'Меня зовут Эндрю!'); System.debug (awesomeMap.value ('array.1')); // Меня зовут Андрей! awesomeMap.putValue (новый список <String> {'массив'}, новый список <String> {'Отлично', 'особенность!'}); System.debug ( (Строка) awesomeMap.value ('array.0') (Строка) awesomeMap.value ('массив.1') ); // Отличная возможность! `` ### ** `hasPath (Путь к строке)` ** Метод проверяет, есть ли путь на карте ** Аргументы: ** - `String path` ** Возвращает: ** - `Boolean` `` js Строка JSONstring = '{"массив": ["Привет, мир!"]}'; NiceMap awesomeMap = новая NiceMap (JSONstring); System.debug (awesomeMap.hasPath ('массив')); // правда System.debug (awesomeMap.hasPath ('array.0')); // правда System.debug (awesomeMap.hasPath ('array.1')); // ложный `` ### ** `json ()` ** Конвертируйте карту в JSON ** Возвращает: ** - `Строка` `` js NiceMap awesomeMap = новая NiceMap ( новая карта <String, Object> { 'id' => 'uniqueId', 'message' => 'Привет, мир!' } ); System.debug (awesomeMap.json ()); // {"message": "Hello, World!", "id": "uniqueId"} `` ''