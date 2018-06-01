
const Web3 = require('web3');
const web3 = new Web3(new Web3.providers.HttpProvider('http://127.0.0.1:8545'));
const ownerAddress = '0xcAb6aD272D18A52ECd8fc1F37398AbA675145990';
const ownerPassword = 'viral123'

web3.personal.unlockAccount(ownerAddress, ownerPassword, 99999);

module.exports = {
    networks: {
        development: {
            host: 'localhost',
            port: 8545,
            network_id: '*',
            gas: 4000000,
            gasPrice: 180e9,

            from: ownerAddress
        }
    }
};
