'use strict';
var nodes = function() {}
nodes.customNode = require('./nodeHelpers/customNode');
nodes.infuraNode = require('./nodeHelpers/infura');
nodes.metamaskNode = require('./nodeHelpers/metamask');
nodes.nodeTypes = {
    TEOt: "TEOt",
    ETH: "ETH",
    ETC: "ETC",
    Custom: "CUSTOM TAO"
};
nodes.ensNodeTypes = [nodes.nodeTypes.TEOt,nodes.nodeTypes.ETH, nodes.nodeTypes.Ropsten];
nodes.customNodeObj = {
    'name': 'CUS',
    'blockExplorerTX': '',
    'blockExplorerAddr': '',
    'type': nodes.nodeTypes.Custom,
    'eip155': false,
    'chainId': '',
    'tokenList': [],
    'abiList': [],
    'service': 'Custom',
    'lib': null
};
nodes.nodeList = {
    'teo_test': {
        'name': 'TEOt',
        'blockExplorerTX': 'https://teoexplorer.tao.ac/tx/[[txHash]]',
        'blockExplorerAddr': 'https://teoexplorer.tao.ac/account/[[address]]',
        'type': nodes.nodeTypes.TEOt,
        'eip155': true,
        'chainId': 33410,
        'tokenList': require('./tokens/teotTokens.json'),
        'abiList': require('./abiDefinitions/teotAbi.json'),
        'service': 'tao.ac',
        'lib': new nodes.customNode('https://teotest.tao.ac/', '')
    },
    'eth_mew': {
        'name': 'ETH',
        'blockExplorerTX': 'https://etherscan.io/tx/[[txHash]]',
        'blockExplorerAddr': 'https://etherscan.io/address/[[address]]',
        'type': nodes.nodeTypes.ETH,
        'eip155': true,
        'chainId': 1,
        'tokenList': require('./tokens/ethTokens.json'),
        'abiList': require('./abiDefinitions/ethAbi.json'),
        'service': 'MyEtherWallet',
        'lib': new nodes.customNode('https://api.myetherapi.com/eth', '')
    },

    'etc_epool': {
        'name': 'ETC',
        'blockExplorerTX': 'https://gastracker.io/tx/[[txHash]]',
        'blockExplorerAddr': 'https://gastracker.io/addr/[[address]]',
        'type': nodes.nodeTypes.ETC,
        'eip155': true,
        'chainId': 61,
        'tokenList': require('./tokens/etcTokens.json'),
        'abiList': require('./abiDefinitions/etcAbi.json'),
        'service': 'epool.io',
        'lib': new nodes.customNode('https://mew.epool.io', '')
    }
};
nodes.ethPrice = require('./nodeHelpers/ethPrice');
module.exports = nodes;
