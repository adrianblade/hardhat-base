pragma solidity ^0.8.7;


//A game where the 14th person that deposit ether wins all the ether in the contract
//the winner can claim the 14 ether

contract EtherGame {
    uint public targetAmount = 14 ether;
    address public winner;
    //need to create a balance state variable to prevent forcefully sending ether
    uint public balance;
    
    //to play you need to call the deposit function and send 1 ether
    function deposit() public payable {
        require(msg.value == 1 ether, "You can only send 1 Ether");
        
        //if the current balance is greater then the targetAmount then the game is over
        //to prevent forcefully sending eth the balance needs to be updated manually instead of just checking the balance amount
        //to prevent forcefully sending ether update the balance state variable manually
        
        balance+= msg.value;
        require(balance <= targetAmount, "Game is over");
        
        //if the balance is == to the targetAmount when the 14th person sends ether then we set the winner to the message sender
        if (balance == targetAmount) {
            winner = msg.sender;
        }
    }
    //the winner can use the claim function to claim their reward
    function claimReward() public {
        require(msg.sender == winner, "Not Winner");
        //this will send all the ether in this contract to the winner
        (bool sent, ) = msg.sender.call{value: address(this).balance}("");
        require(sent, "Failed to send Ether");
    }
    
    function getBalance() public view returns (uint) {
        return address(this).balance;
    }
}