const { expect } = require("chai");
const { ethers } = require("hardhat");

describe("Address Book", function () {
  it("Should return empty list", async function () {
    const [owner, addr1, addr2] = await ethers.getSigners();

    const AddressBook = await ethers.getContractFactory("AddressBook");
    const addressBookContract = await AddressBook.deploy();
    await addressBookContract.deployed();

    addressBookContract.addAddress(addr1.address, "aliasOne");

    /*expect(
      await addressBookContract.getAlias(owner.address, addr1.address)
    ).to.equal("aliasOne");*/
  });
});
