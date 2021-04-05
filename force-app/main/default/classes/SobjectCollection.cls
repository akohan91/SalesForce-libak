
/**
 * @author Andrew Kohanovskij <akohan91@gmail.com>
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

	/**
	 * Checks the 'isUpdateable' flag of sObject and fields
	 * if true update records
	 * else throw a SobjectCollectionException error
	 * @return   { List<Database.SaveResult> }
	 */
	global List<Database.SaveResult> updateRecords() {
		Set<String> processedObjects = new Set<String>();

		for (SObject record : this.records) {
			Schema.DescribeSObjectResult sobjectDescribe = record.getSObjectType().getDescribe();
			if (processedObjects.contains(sobjectDescribe.getName())) {
				continue;
			} else {
				processedObjects.add(sobjectDescribe.getName());
			}

			if (!sobjectDescribe.isUpdateable()) {
				throw new SobjectCollectionException(
					String.format('SObject "{0}" is not updateable!',
					new List<String>{sobjectDescribe.getName()})
				);
			} else {
				this.checkFieldsIsUpdateable(record);
			}
		}

		return Database.insert(this.records);
	}

	/********************************************************************************
	 *                             PRIVATE METHODS
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
					String.format('Field "{0}" of SObject "{1}" is not createable!',
					new List<String>{fieldName, sobjectDescribe.getName()})
				);
			}
		}
	}

	/**
	 * Checks the 'isUpdateable' flag of sObject fields
	 * if false throw a SobjectCollectionException error
	 * @param  record {SObject}
	 */
	private void checkFieldsIsUpdateable(SObject record) {
		Schema.DescribeSObjectResult sobjectDescribe = record.getSObjectType().getDescribe();
		Set<String> populatedFields = record.getPopulatedFieldsAsMap().keySet();
		for (string fieldName : populatedFields) {
			if (fieldName == 'Id') {
				continue;
			} else if (!sobjectDescribe.fields.getMap().get(fieldName).getDescribe().isUpdateable()) {
				throw new SobjectCollectionException(
					String.format('Field "{0}" of SObject "{1}" is not updateable!',
					new List<String>{fieldName, sobjectDescribe.getName()})
				);
			}
		}
	}

	global class SobjectCollectionException extends Exception{}
}