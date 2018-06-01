const FarwestNFTokenContract = artifacts.require('./tokens/FarwestNFToken.sol');

module.exports = function(deployer) {
  deployer.deploy(FarwestNFTokenContract, 'FarwestNFToken', 'FWNFT');
};