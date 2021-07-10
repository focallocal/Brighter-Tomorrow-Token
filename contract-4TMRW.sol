// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts@4.2.0/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts@4.2.0/token/ERC20/extensions/ERC20Burnable.sol";
import "@openzeppelin/contracts@4.2.0/security/Pausable.sol";
import "@openzeppelin/contracts@4.2.0/access/Ownable.sol";

contract BrighterTomorrow is ERC20, ERC20Burnable, Pausable, Ownable {
    constructor() ERC20("Brighter Tomorrow", "4TMRW") {
        _mint(msg.sender, 7900000000 * 14 ** decimals());
    }

    function pause() public onlyOwner {
        _pause();
    }

    function unpause() public onlyOwner {
        _unpause();
    }

    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

    function _beforeTokenTransfer(address from, address to, uint256 amount)
        internal
        whenNotPaused
        override
    {
        super._beforeTokenTransfer(from, to, amount);
    }
}
