// SPDX-License-Identifier: MIT

pragma solidity ^0.8.13;

contract Migrations {
  address public owner;
  uint public lastCompletedMigration;
  mapping(uint => address) public migrations;

  modifier restricted() {
    require(msg.sender == owner, "Only the contract owner can perform this action");
    _;
  }

  constructor() {
    owner = msg.sender;
  }

  function setCompleted(uint completed) public restricted {
    lastCompletedMigration = completed;
  }

  function addMigration(address migration, uint version) public restricted {
    migrations[version] = migration;
  }

  function upgrade(address newAddress) public restricted {
    require(migrations[lastCompletedMigration + 1] == newAddress, "Invalid migration address");
    Migrations upgraded = Migrations(newAddress);
    upgraded.setCompleted(lastCompletedMigration);
  }
}
