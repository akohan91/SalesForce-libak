public class DemoRestService extends RestProcessor {
	public override RestResponseData handleGet(RestRequestData request) {
		Account acc = [
			SELECT Id, Name, Phone
			FROM Account
			WHERE Id =: (Id) request.params.get('id')
		];

		return new RestResponseData(
			new Map < String, Object > {
				'account' => acc
			}
		);
	}

	public override RestResponseData handlePatch(RestRequestData request) {
		Account acc = [
			SELECT Id, Phone
			FROM Account
			WHERE Id =: (Id) request.params.get('id')
		];

		acc.Phone = (String) request.value('phone');

		update acc;

		return new RestResponseData(
			new Map < String, Object > {
				'account' => acc
			},
			'Account has been successfully updated.'
		);
	}

	public override RestResponseData handlePost(RestRequestData request) {
		throw new RestProcessorException('POST Method is not awailable.');
	}

	public override RestResponseData handlePut(RestRequestData request) {
		throw new RestProcessorException('PUT Method is not awailable.');
	}

	public override RestResponseData handleDelete(RestRequestData request) {
		throw new RestProcessorException('DELETE Method is not awailable.');
	}
}