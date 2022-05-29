//define which compiler to use
pragma solidity ^0.8.7;

//contract name is GettersAndSettersContract
contract GettersAndSettersContract {

//create two variables.  A sting and an integer

    string private name;
    uint private age;


    function setName(string memory newName) public {
        name = newName;
    }


    function getName () public view returns (string memory) {
        return name;
    }
    

    function setAge(uint newAge) public {
        age = newAge;
        
    }


    function getAge () public view returns (uint) {
        return age;
    }
    
}