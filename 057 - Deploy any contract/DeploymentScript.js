// JavaScript deployment script using Hardhat

const { ethers } = require('hardhat');

async function deployProxy() {
    const Proxy = await ethers.getContractFactory('Proxy');
    const proxy = await Proxy.deploy();
    await proxy.deployed();
    console.log('Proxy contract deployed to:', proxy.address);
    return proxy;
}

async function deployContracts(proxy) {
    const Helper = await ethers.getContractFactory('Helper');
    const helper = await Helper.deploy();
    await helper.deployed();
    // deploy TestContract1 using proxy contract
    const bytecode1 = await helper.getBytecode1();
    await proxy.deploy(bytecode1);
    // deploy TestContract2 using proxy contract with parameters 100 and 200
    const bytecode2 = await helper.getBytecode2(100, 200);
    await proxy.deploy(bytecode2);
    console.log('Contracts deployed via Proxy.');
}