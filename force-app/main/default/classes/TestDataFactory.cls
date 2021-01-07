/**
 * @author Andrew Kohanovskij <akohan91@gmail.com>
 * Class wrapped "Map" class and extends its functionality
 */
public with sharing class TestDataFactory {
	private User userWithoutAccess;

	public User createLibakTestsUser() {
		User result = new User();
		Profile profile = [
			SELECT Id
			FROM Profile
			WHERE Name = 'Libak Tests'
			WITH SECURITY_ENFORCED
		];

		if ( this.userWithoutAccess != null ) {
			result = this.userWithoutAccess;
		} else {
			result = new User(
				Alias = 'testU',
				Email = 'test@without.com',
				EmailEncodingKey = 'UTF-8',
				LastName = 'Test',
				LanguageLocaleKey = UserInfo.getLanguage(),
				LocaleSidKey = UserInfo.getLocale(),
				ProfileId = profile.Id,
				Country = 'United States',
				TimeZoneSidKey = UserInfo.getTimeZone().getID(),
				UserName = getUniqueKey() + 'test@without.com.testWithout'
			);
			new SobjectCollection(result).insertRecords();
		}
		return result;
	}

	private String getUniqueKey(){
		Blob b = Crypto.GenerateAESKey(128);
		String hex = EncodingUtil.ConvertTohex(b);
		String uid = hex.SubString(0,8);
		return uid;
	}
}