import { expect } from "chai";
import { ethers } from "hardhat";
// import { Contract } from "hardhat/internal/hardhat-network/stack-traces/model";
import { SignerWithAddress } from "@nomicfoundation/hardhat-ethers/signers";
import { Contract } from '@ethersproject/contracts';
import * as chai from "chai";
const chaiAsPromised = require('chai-as-promised');
chai.use(chaiAsPromised);
import { keccak256 } from 'ethers/lib.commonjs';

function parseEther (amount: Number) {
    return ethers.parseUnits(amount.toString(), 18);
}


