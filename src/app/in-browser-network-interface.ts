import { execute } from 'graphql';

class InBrowserNetworkInterface {
  schema: any;

  constructor({ schema }) {
    this.schema = schema;
  }

  query(request) {
    return execute(
      this.schema,
      request.query,
      {},
      {},
      request.variables,
      request.operationName);
  }
}

export default InBrowserNetworkInterface;