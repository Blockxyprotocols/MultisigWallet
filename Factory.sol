/ SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract Factory {
  event ContractInstantiation(address sender, address instantiation);



  mapping(address => bool) public isInstantiated;
  mapping(address => address[]) public instantiationsByCreator;



  function getInstantiationCount(address creator) public view returns (uint) {
    return instantiationsByCreator[creator].length;
  }



  function register(address instantiation) internal {
    isInstantiated[instantiation] = true;
    instantiationsByCreator[msg.sender].push(instantiation);
    emit ContractInstantiation(msg.sender, instantiation);
  }
}
