// JavaScript interaction script

async function interactionWithContracts(proxy) {
    // set the owner of TestContract1 using the Proxy contract
    const ownerAddress = '0x123...'; // replace with desired address
    const calldata = await helper.getCalldata(ownerAddress);
    await proxy.execute(testContract1Address, calldata);
    // call a function on TestContract2 using the Proxy contract
    const contract2FunctionSignature = 'functionName(uint256)';
    const encodedArgs = ethers.utils.defaultAbiCoder.encode(['uint256'], [42]);
    const fullCalldata = ethers.utils.hexDataSlice(
        ethers.utils.keccak256(ethers.utils.toUtf8Bytes(contract2FunctionSignature)),
        0,
        4
    ) + encodedArgs.substr(2);
    await proxy.execute(testContract2Address, fullCalldata);
    console.log('Contracts interacted voa Proxy.');
}