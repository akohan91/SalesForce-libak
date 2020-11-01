public class DemoRestService extends Libak_RestProcessor {
	public override Libak_RestResponse handleGet(Libak_RestRequest request) {
		Account acc = [
			SELECT Id, Name, Phone
			FROM Account
			WHERE Id =: (Id) request.params.get('id')
		];

		return new Libak_RestResponse(
			new Map < String, Object > {
				'account' => acc
			}
		);
	}

	public override Libak_RestResponse handlePatch(Libak_RestRequest request) {
		Account acc = [
			SELECT Id, Phone
			FROM Account
			WHERE Id =: (Id) request.params.get('id')
		];

		acc.Phone = (String) request.value('phone');

		update acc;

		return new Libak_RestResponse(
			new Map < String, Object > {
				'account' => acc
			},
			'Account has been successfully updated.'
		);
	}

	public override Libak_RestResponse handlePost(Libak_RestRequest request) {
		throw new Libak_RestProcessorException('POST Method is not awailable.');
	}

	public override Libak_RestResponse handlePut(Libak_RestRequest request) {
		throw new Libak_RestProcessorException('PUT Method is not awailable.');
	}

	public override Libak_RestResponse handleDelete(Libak_RestRequest request) {
		throw new Libak_RestProcessorException('DELETE Method is not awailable.');
	}
}