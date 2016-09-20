import ApolloClient from 'apollo-client';

import InBrowserNetworkInterface from './in-browser-network-interface';
import schema from './schema';

const networkInterface = new InBrowserNetworkInterface({ schema });

export const client = new ApolloClient({
  networkInterface,
  dataIdFromObject: r => r['id'],
});
