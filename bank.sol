pragma solidity^0.4.0;

contract Bank {
	uint totalDeposit;
	mapping(address=> uint) balanceOf;
	
	function deposit() payable {
		balanceOf[msg.sender] += msg.value;
		totalDeposit += msg.value;
	}
	
	function withdraw(uint _amount) payable {		
		balanceOf[msg.sender] -= _amount;
		totalDeposit -= _amount;
		msg.sender.call.value(_amount)();
	}
	
	function getTotalBalance() constant returns(uint){
	    return totalDeposit;
	}
	
	function getBalance(address _account) constant returns(uint){
	    return balanceOf[_account];
	}
}
