import React from 'react';
import ReactDOM from 'react-dom';

function User() {
    return (
        // templates here...
        <div>Hello</div>
    );
}

export default User;

// DOM Element
if (document.getElementById('user')) {
    ReactDOM.render(<User />, document.getElementById('user'));
}

console.log('do something');