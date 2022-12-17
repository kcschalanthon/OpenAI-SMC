pragma solidity ^0.6.0;

import "https://github.com/OpenZeppelin/openzeppelin-solidity/contracts/math/SafeMath.sol";
import "https://github.com/OpenZeppelin/openzeppelin-solidity/contracts/token/ERC20/SafeERC20.sol";

// ERC-20 token contract that the Vault will hold and manage
contract Token {
    using SafeMath for uint256;
    using SafeERC20 for IERC20;

    IERC20 public token;

    constructor(IERC20 _token) public {
        token = _token;
    }

    function balanceOf(address _owner) public view returns (uint256 balance) {
        return token.balanceOf(_owner);
    }

    function transfer(address _to, uint256 _value) public {
        require(token.transfer(_to, _value), "Transfer failed.");
    }

    function transferFrom(address _from, address _to, uint256 _value) public {
        require(token.transferFrom(_from, _to, _value), "Transfer failed.");
    }
}

// Vault contract that holds and manages the ERC-20 tokens
contract Vault {
    using SafeMath for uint256;
    using SafeERC20 for IERC20;

    Token public token;

    constructor(IERC20 _token) public {
        token = new Token(_token);
    }

    function balanceOf(address _owner) public view returns (uint256 balance) {
        return token.balanceOf(_owner);
    }

    function transfer(address _to, uint256 _value) public {
        // Add any additional checks or logic here
        token.transfer(_to, _value);
    }

    function transferFrom(address _from, address _to, uint256 _value) public {
        // Add any additional checks or logic here
        token.transferFrom(_from, _to, _value);
    }
}
