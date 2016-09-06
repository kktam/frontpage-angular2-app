import ApolloClient, { createNetworkInterface } from 'apollo-client';

const networkInterface = createNetworkInterface('http://localhost:8080/graphql');

export const client = new ApolloClient({
  networkInterface,
  dataIdFromObject: r => r['id'],
});
