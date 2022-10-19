//SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract UniswapClone {

    //State Variables

    uint256 public ethAmount;
    address payable[] private clients;

    error NoBalance();
    error NotEnoughEth();

    mapping (address => uint256) balanceOf;

    event EthSent();
    event EthStored(uint256 ethAmount);
    event BalanceUpdated(address indexed clients);

    function storeEth (uint256 _ethAmount) external payable {
        if(msg.value <= 0){
            revert NotEnoughEth();
        }
        _ethAmount = msg.value;
        balanceOf[msg.sender] += msg.value;
        clients.push(payable(msg.sender));
        emit EthStored(_ethAmount);
    }

    function sendEth (uint256 _ethAmount)public payable {
        _ethAmount = msg.value;
        if(balanceOf[msg.sender] <= 0){
            revert NoBalance();
        }
        balanceOf[msg.sender] = balanceOf[msg.sender] - _ethAmount;
        emit BalanceUpdated(msg.sender);
    }

    function getBalance() public view returns(uint256){
        return balanceOf[msg.sender];
    }
}