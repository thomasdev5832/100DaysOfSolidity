// SPDX-License-Identifier: MIT

pragma solidity ^0.8.3;

contract ABIEnconde {

    // ABI -> for Application Binary Interface
    // standardized format used to define the interface of functions
    
    // ABI Encode -> process of converting function parameters into a tightly packed byte array according to the function's signature, allowing for their transmission and execution
    // 🔹 Enable Function Call Serialization
    // 🔹 Facilitate External Contract Interaction
    // 🔹 Simplify Transaction Construction

    function encodeWithSignature(address to, uint amount) external pure returns (bytes memory) {

        // 1️⃣ Encoding with Signature 📝 -> abi.encodeWithSignature 
        // Encode the function signature `transfer(address,uint256)` along with the provided parameters into a byte array. 
        // The resulting byte array can then be used for external contract function calls.
        // Typo is not checked - "transfer(address, uint)"
        return abi.encodeWithSignature("transfer(address,uint256)", to, amount);

    }

    function encodeWithSelector(address to, uint amount) external pure returns (bytes memory) {

        // 2️⃣ Encoding with Selector ⚙️ -> abi.encodeWithSelector
        // utilize the selector of the `IERC20.transfer` function to encode the parameters.
        // The selector acts as a unique identifier for the function, ensuring that the correct function is called when the encoded data is passed to an external contract.
        // Type is not checked - (IERC20.transfer.selector, true, amount)
        return abi.encodeWithSelector(IERC20.transfer.selector, to, amount);

    }

    function encodeCall(address to, uint amount) external pure returns (bytes memory) {

        // 3️⃣ Encoding Function Calls 📞 -> abi.encodeCall
        // Takes advantage of the `IERC20.transfer` function and its expected parameter types to create the encoded byte array. 
        // enforces type safety during compilation, ensuring that any typos or type errors are caught beforehand.
        // Typo and type errors will not compile
        return abi.encodeCall(IERC20.transfer, (to, amount));

    }

}