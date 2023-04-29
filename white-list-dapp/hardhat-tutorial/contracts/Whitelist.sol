// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

contract Whitelist {
  uint8 public maxWhitelistedAddresses;
  mapping(address => bool) whitelistedAddresses;
  uint8 public numAddressesWhitelisted;

  constructor(uint8 _maxWhitelistedAddresses) {
    maxWhitelistedAddresses = _maxWhitelistedAddresses;
  }

  function addAddressToWhitelist() public {
    require(!whitelistedAddresses[msg.sender], "Sender has already been whitelisted");
    require(numAddressesWhitelisted < maxWhitelistedAddresses, "More addresses cant be added, limit reached");
    whitelistedAddresses[msg.sender] = true;
    numAddressesWhitelisted += 1;
  }
}