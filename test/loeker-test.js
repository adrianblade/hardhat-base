const { expect } = require("chai");
const { ethers } = require("hardhat");

describe("Loeker", function () {
  it("Should return empty list", async function () {
    const [owner, addr1, addr2] = await ethers.getSigners();

    const Loeker = await ethers.getContractFactory("Loeker");
    const loekerContract = await Loeker.deploy("LKR", "Loeker");
    await loekerContract.deployed();

    expect(await loekerContract.balanceOf(owner.address)).to.equal(10000);
    expect(await loekerContract.balanceOf(addr1.address)).to.equal(0);

    await loekerContract.transfer(addr1.address, 3);
    expect(await loekerContract.balanceOf(addr1.address)).to.equal(3);
  });
});
