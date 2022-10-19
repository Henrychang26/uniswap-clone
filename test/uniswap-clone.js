const { ethers } = require("hardhat");
const { expect } = require("chai");

describe(UniswapClone, () => {
  let client;
  let deployer;

  beforeEach(async () => {
    //setup accounts
    await ethers.getSigners();
    const deployer = accounts[0];
    const client = accounts[1];
    //deploy contract
    const UniswapClone = await ethers.getContract("UniswapClone");
    uniswapClone = UniswapClone.deploy();

    describe("store ETH", () => {
      it("stores ETH correctly", async () => {});
    });
  });
});
