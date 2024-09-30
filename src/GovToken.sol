// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";
import {Nonces} from "@openzeppelin/contracts/utils/Nonces.sol";
import {ERC20Permit} from "@openzeppelin/contracts/token/ERC20/extensions/ERC20Permit.sol";
import {ERC20Votes} from "@openzeppelin/contracts/token/ERC20/extensions/ERC20Votes.sol";

contract GovToken is ERC20, ERC20Permit, ERC20Votes, Ownable {
    constructor() ERC20("BoxGov", "BOXGOV") ERC20Permit("BoxGov") Ownable(msg.sender){}

    function mint(address to, uint256 amount) public onlyOwner{
        _mint(to, amount);
    }

    function burn(address account, uint256 amount) public onlyOwner{
        _burn(account, amount);
    }

    // C3 linearization inherits right to left.
    function _update(address from, address to, uint256 value) internal virtual override(ERC20, ERC20Votes) {
        super._update(from, to, value);
    }

    function nonces(address owner) public view virtual override(Nonces, ERC20Permit) returns (uint256){
        return super.nonces(owner);
    }

}
