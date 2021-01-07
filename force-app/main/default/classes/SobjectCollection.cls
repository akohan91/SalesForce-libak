
/**
 * @author Andrew Kohanovskij <akohan91@gmail.com>
 * Class wrapped "Map" class and extends its functionality
 */
global with sharing class SobjectCollection {

    private List<SObject> records;

    /********************************************************************************
	 *                             CONSTRUCTORS
	 *******************************************************************************/

    global SobjectCollection(SObject record) {
        this.records = new List<SObject>{record};
    }

    global SobjectCollection(List<SObject> records) {
        this.records = records;
    }

    /********************************************************************************
	 *                             PUBLIC METHODS
	 *******************************************************************************/

    /**
     * Checks the 'isCreatable' flag of sObject and fields
     * if true insert records
     * else throw a SobjectCollectionException error
     * @return   { List<Database.SaveResult> }
     */
    global List<Database.SaveResult> insertRecords() {
        Set<String> processedObjects = new Set<String>();

        for (SObject record : this.records) {
            Schema.DescribeSObjectResult sobjectDescribe = record.getSObjectType().getDescribe();
            if (processedObjects.contains(sobjectDescribe.getName())) {
                continue;
            } else {
                processedObjects.add(sobjectDescribe.getName());
            }

            if (!sobjectDescribe.isCreateable()) {
                throw new SobjectCollectionException(
                    String.format('SObject "{0}" is not creatable!',
                    new List<String>{sobjectDescribe.getName()})
                );
            } else {
                this.checkFieldsIsCreateable(record);
            }
        }

        return Database.insert(this.records);
    }

    /********************************************************************************
	 *                             PUBLIC METHODS
	 *******************************************************************************/

    /**
     * Checks the 'isCreatable' flag of sObject fields
     * if false throw a SobjectCollectionException error
     * @param  record {SObject}
     */
    private void checkFieldsIsCreateable(SObject record) {
        Schema.DescribeSObjectResult sobjectDescribe = record.getSObjectType().getDescribe();
        Set<String> populatedFields = record.getPopulatedFieldsAsMap().keySet();
        for (string fieldName : populatedFields) {
            if (fieldName == 'Id') {
                continue;
            } else if (!sobjectDescribe.fields.getMap().get(fieldName).getDescribe().isCreateable()) {
                throw new SobjectCollectionException(
                    String.format('Field "{0}" of SObject "{1}" is not editable!',
                    new List<String>{fieldName, sobjectDescribe.getName()})
                );
            }
        }
    }

    global class SobjectCollectionException extends Exception{}
}