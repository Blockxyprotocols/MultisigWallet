// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "./Factory.sol";
import "./MultiSigWallet.sol";


abstract contract MultiSigWalletFactory is Factory 
{
function create(address[] memory _owners, uint _required) public returns (address multisig_wallet) 

{
multisig_wallet = address(new MultiSigWallet(_owners, _required));
register(address(multisig_wallet));
}

}
