const { expect } = require("chai");
const { ethers } = require("hardhat");

describe("GetterAndSetterInSmartContract", function () {
  it("Should return the new name and age", async function () {
    const expectedName = "Adrian";
    const expectedAge = 30;
    const ContractWithGettersAndSetters = await ethers.getContractFactory(
      "GettersAndSettersContract"
    );
    const contract = await ContractWithGettersAndSetters.deploy();
    await contract.deployed();

    expect(await contract.getName()).to.equal("");
    expect(await contract.getAge()).to.equal(0);

    const setNameTx = await contract.setName(expectedName);
    const setAgeTx = await contract.setAge(expectedAge);

    // wait until the transaction is mined
    await setNameTx.wait();
    await setAgeTx.wait();

    expect(await contract.getName()).to.equal(expectedName);
    expect(await contract.getAge()).to.equal(expectedAge);
  });
});
