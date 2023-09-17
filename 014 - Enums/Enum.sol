// SPDX-License-Identifier: MIT

pragma solidity ^0.8.3;

contract Enum {
    
    // Enums provide a way to define a limited number of options or states that a variable can take.
    // to represent a finite set of choices or track the state of an object with a limited number of possible values
    // Each option is assigned an implicit ordinal value, stating from '0'
    enum Status {
        Pending, // 0 
        Shipped, // 1
        Accepted, // 2
        Rejected, // 3
        Canceled // 4
    }

    // This variable holds the current shipping status of an item
    Status public status;

    // getter
    function get() public view returns (Status) {
        return status;
    }

    // setter
    function set(Status _status) public {
        status = _status;
    }

    // assign a specific enum value to a variable
    function cancel() public {
        // sets the `status` variable to the 'Canceled' value
        status = Status.Canceled;
    }

    // the `delete` keyword to reset the `status` variable to its default value
    // which is the first element (`Pending`) of the `Status` enum
    function reset() public {
        delete status;
    }

}