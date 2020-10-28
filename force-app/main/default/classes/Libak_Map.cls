/**
 * @author Andrew Kohanovskij
 */
public class Libak_Map {
    private Map<String, Object> sourceMap;
    private final Pattern ARRAY_NOTATION = Pattern.compile('\\d+');

    /********************************************************************************
     *                             CONSTRUCTORS
     *******************************************************************************/

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

            Matcher arrayMatcher = this.ARRAY_NOTATION.matcher(key);
            Boolean isArrayKey = arrayMatcher.matches();
            Integer index = isArrayKey ? Integer.valueOf(key) : null;

            if(isArrayKey && (tempArr == null || index == null || tempArr.size() <= index)){
                return null;
            }
        
            Object value = isArrayKey ? tempArr.get(index) : tempMap.get(key);
            if (isLastKey == true) {
                return value;
            } else {
                if(value instanceof List<Object>){
                    tempArr = (List<Object>) value;
                } else {
                    tempMap = isArrayKey ?
                        (Map<String, Object>)tempArr.get(index) :
                        (Map<String, Object>)tempMap.get(key);
                    tempArr = null;
                }
            }
        }
        return null;
    }
}
