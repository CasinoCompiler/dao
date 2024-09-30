// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

/**
 * @title Simple contract to be controlled by DAO
 * @author CC
 */

/**
 * Imports
 */
// @Order Imports, Interfaces, Libraries, Contracts
import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";

contract Box is Ownable {
    /**
     * State Variables
     */
    uint256 private s_number;

    /**
     * Events
     */
    event NumberChanged(uint256 indexed number);

    /**
     * Constructor
     */
    constructor() Ownable(msg.sender) {}

    /**
     *   Modifiers
     * @dev onlyOwner() inherited from Ownable.sol
     */

    /**
     * Functions
     */
    function setNumber(uint256 number) public onlyOwner {
        s_number = number;
        emit NumberChanged(number);
    }

    /**
     * Getter Functions
     */
    function getNumber() public view returns (uint256) {
        return s_number;
    }
}
