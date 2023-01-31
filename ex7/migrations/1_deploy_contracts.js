const Ex7v4 = artifacts.require('Ex7-v4');
const Ex7v8 = artifacts.require('Ex7-v8');

module.exports = function (deployer) {
  deployer.deploy(Ex7v4);
  deployer.deploy(Ex7v8);
};
