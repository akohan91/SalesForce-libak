/**
 * @author Andrew Kohanovskij
 */
public class Libak_Map {
    protected Map<String, Object> sourceMap;
    private final Pattern ARRAY_NOTATION = Pattern.compile('\\d+');

    /********************************************************************************
     *                             CONSTRUCTORS
     *******************************************************************************/

    public Libak_Map() {
        this.sourceMap = new Map<String, Object>();
    }

    public Libak_Map(Map<String, Object> sourceMap) {
        this.sourceMap = sourceMap;
    }

    public Libak_Map(String sourceJSON) {
        this.sourceMap = (Map<String, Object>) JSON.deserializeUntyped(sourceJSON);
    }

    /********************************************************************************
     *                             PUBLIC METHODS
     *******************************************************************************/

    /**
     * Returns the value from map by path
     * @param path { String }
     * @return value { Object || null }
     */
    public Object value(String path) {
        return value(path.split('\\.'));
    }

    /**
     * Returns the value from Map by path
     * @param path { String[] }
     * @return value { Object || null }
     */
    public Object value(List<String> path) {
        List<String> currentKeys = path;
        Map<String, Object> tempMap = this.sourceMap;
        List<Object> tempArr = null;

        while (!currentKeys.isEmpty()) {
            if (tempMap == null && tempArr == null) {
                return null;
            }

            String key = currentKeys.remove(0);
            Boolean isLastKey = currentKeys.isEmpty();

            Integer index = this.isListIndex(key);

            if(index != null && (tempArr == null || tempArr.size() <= index)){
                return null;
            }
        
            Object value = index != null  ? tempArr.get(index) : tempMap.get(key);
            if (isLastKey == true) {
                return value;
            } else {
                if(value instanceof List<Object>){
                    tempArr = (List<Object>) value;
                } else {
                    tempMap = index != null  ?
                        (Map<String, Object>)tempArr.get(index) :
                        (Map<String, Object>)tempMap.get(key);
                    tempArr = null;
                }
            }
        }
        return null;
    }

    /**
     * Adds value to the map
     * @param path { String }
     * @param valus { Any }
     */
    public void putValue (String path, Object value) {
        putValue(path.split('\\.'), value);
    }

    /**
     * Adds value to the map
     * @param path { String[] }
     * @param valus { Any }
     */
    public void putValue(List<String> path, Object value) {
        List<String> currentKeys = path;
        Object tempObj = this.sourceMap;

        while (!currentKeys.isEmpty()) {
            if (tempObj == null) {
                return;
            }
            
            String key = currentKeys.remove(0);
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
                        System.debug('Something Wrong 1'); // TODO: Implemets handle Exception
                        return;
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
                        System.debug('Something Wrong 2'); // TODO: Implemets handle Exception
                        return;
                    }
                } else if (tempObj instanceof Map<String, Object>) {
                    Map<String, Object> tempMap = (Map<String, Object>) tempObj;
                    if (!tempMap.containsKey(key) && isListIndex(currentKeys.get(0)) != null) {
                        tempMap.put(key, new List<Object>());
                    } else if (!tempMap.containsKey(key) && isListIndex(currentKeys.get(0)) == null) {
                        tempMap.put(key, new Map<String, Object>());
                    }
                    tempObj =  tempMap.get(key);
                }
            }
        }
    }

    /**
     * Define is key matches to Integer type
     * @param key { String }
     * @return index { Integer | null }
     */
    private Integer isListIndex(String key) {
        Matcher arrayMatcher = this.ARRAY_NOTATION.matcher(key);
        Boolean isArrayKey = arrayMatcher.matches();
        Integer index = isArrayKey ? Integer.valueOf(key) : null;
        return index;
    }
}
