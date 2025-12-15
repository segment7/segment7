// SPDX-License-Identifier: AGPL-3.0
pragma solidity ^0.8.31;

import "@openzeppelin/contracts/utils/Strings.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract README is Ownable(msg.sender) {
    using Strings for uint256;
    using Strings for address;
    
    string private greeting;
    
    function setGreeting(string memory _new) onlyOwner public {
        greeting = _new;
    }

    function getGreeting() public {
        string memory _Greeting = string(abi.encodePacked(
            "At timestamp ", 
            block.timestamp.toString(), 
            ", to ", 
            msg.sender.toHexString(),
            " : ", 
            greeting
        ));
        
        emit Greeting(_Greeting);
    }

    event Greeting(string message);
}