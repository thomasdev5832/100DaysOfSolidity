// SPDX-License-Identifier: MIT

pragma solidity ^0.8.3;

contract Todos {

    // struct is a user-defined type that can encapsulate different data types into a single composite entity
    struct Todo {
        string text;
        bool completed;
    }

    Todo[] public todos;

    function name(string calldata _text) public {
        todos.push(Todo(_text, false));
        todos.push(Todo({text: _text, completed: false}));
        Todo memory todo;
        todo.text = _text;
        todos.push(todo);
    }

    function get(uint _index) public view returns (string memory text, bool completed) {
        Todo storage todo = todos[_index];
        return (todo.text, todo.completed);
    }

    function updateText(uint _index, string calldata _text) public {
        Todo storage todo = todos[_index];
        todo.text = _text;
    }

    function toggleCompleted(uint _index) public {
        Todo storage todo = todos[_index];
        todo.completed = !todo.completed;
    }

}