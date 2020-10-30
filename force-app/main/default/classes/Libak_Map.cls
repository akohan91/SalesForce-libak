/**
 * @author Andrew Kohanovskij <akohan91@gmail.com>
 */
public virtual class Libak_Map {
    protected Map<String, Object> data;
    private final Pattern ARRAY_NOTATION = Pattern.compile('\\d+');

    /********************************************************************************
     *                             CONSTRUCTORS
     *******************************************************************************/

    public Libak_Map() {
        this.data = new Map<String, Object>();
    }

    public Libak_Map(Map<String, Object> data) {
        this.data = data == null ? new Map<String, Object>() : data;
    }

    public Libak_Map(String sourceJSON) {
        this.data = (Map<String, Object>) JSON.deserializeUntyped(sourceJSON);
    }

    /********************************************************************************
     *                             PUBLIC METHODS
    *******************************************************************************/

    /**
     * Returns the major map
     * @return   { Map<String, Object> }
     */
    public Map<String, Object> data() {
        return this.data;
    }

    /**
     * Returns the value from map by path
     * @param  path  { String }
     * @return       { Object || null }
     */
    public Object value(String path) {
        return value(path.split('\\.'));
    }

    /**
     * Returns the value from map by path
     * @param  path  { String[] }
     * @return       { Object || null }
     */
    public Object value(List<String> path) {
        List<String> currentKeys = path;
        Object tempObj = this.data;
        List<Object> tempArr = null;
        Map<String, Object> tempMap;

        while (!currentKeys.isEmpty()) {
            if (tempObj != null && tempObj instanceof List<Object>) {
                tempArr = (List<Object>) tempObj;
            } else if (tempObj != null && tempObj instanceof Map<String, Object>) {
                tempMap = (Map<String, Object>) tempObj;
            } else {
                return null;
            }

            String key = currentKeys.remove(0);
            Boolean isLastKey = currentKeys.isEmpty();
            Integer index = this.isListIndex(key);

            if (tempArr != null && index != null && tempArr.size() > index) {
                tempObj = tempArr.get(index);
            } else if (tempMap != null) {
                tempObj = tempMap.get(key);
            }

            if (isLastKey == true) {
                return tempObj;
            }
        }
        return null;
    }

    /**
     * Adds value to the map
     * @param  path  { String }
     * @param  value { Any }
     */
    public void putValue (String path, Object value) {
        putValue(path.split('\\.'), value);
    }

    /**
     * Adds value to the map
     * @param  path  { String[] }
     * @param  value { Any }
     */
    public void putValue(List<String> path, Object value) {
        List<String> currentKeys = path;
        Object tempObj = this.data;
        String pathHistory = '';

        while (!currentKeys.isEmpty()) {
            if (tempObj == null) {
                return;
            }
            
            String key = currentKeys.remove(0);
            pathHistory += key + '.';
            Integer index = isListIndex(key);
            Boolean isLastKey = currentKeys.isEmpty();

            if (isLastKey) {
                if (index != null) {
                    List<Object> tempArr = (List<Object>) tempObj;
                    if (tempArr.size() > index ) {
                        tempArr.set(index, value);
                    } else if (tempArr.size() == index) {
                        tempArr.add(value);
                    } else {
                        throw new Libak_MapException('List index out of bounds: ' + index + '. Error Path: "' + pathHistory.removeEnd('.') + '"');
                    }
                } else {
                    Map<String, Object> tempMap = (Map<String, Object>) tempObj;
                    tempMap.put(key, value);
                }
            } else {
                if (tempObj instanceof List<Object> && index != null) {
                    List<Object> tempArr = (List<Object>) tempObj;
                    if (tempArr.size() > index) {
                        tempObj = tempArr.get(index);
                    } else if (tempArr.size() == index && isListIndex(currentKeys.get(0)) != null)  {
                        tempArr.add(new List<Object>());
                        tempObj = tempArr.get(index);
                    } else if (tempArr.size() == index && isListIndex(currentKeys.get(0)) == null)  {
                        tempArr.add(new Map<String, Object>());
                        tempObj = tempArr.get(tempArr.size() - 1);
                    } else {
                        throw new Libak_MapException('List index out of bounds: ' + index + '. Error Path: "' + pathHistory.removeEnd('.') + '"');
                    }
                } else if (tempObj instanceof Map<String, Object>) {
                    Map<String, Object> tempMap = (Map<String, Object>) tempObj;
                    if (!tempMap.containsKey(key)) {
                        tempMap.put(key, new Map<String, Object>());
                    }
                    tempObj =  tempMap.get(key);
                }
            }
        }
    }
    // throw new Libak_MapException('Map key cannot be a number. ' + 'Error Path: "' + pathHistory.removeEnd('.') + '"');
    /**
     * Cheks is there path in map
     * @param  path { String }
     * @return      { Boolean }
     */
    public Boolean hasPath(String path) {
        return this.value(path) != null;
    }

    /**
     * Define is key matches to Integer type
     * @param  key { String }
     * @return     { Integer | null }
     */
    private Integer isListIndex(String key) {
        Matcher arrayMatcher = this.ARRAY_NOTATION.matcher(key);
        Boolean isArrayKey = arrayMatcher.matches();
        Integer index = isArrayKey ? Integer.valueOf(key) : null;
        return index;
    }

    class Libak_MapException extends Exception{}
}