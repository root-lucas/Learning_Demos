import React, { Component } from 'react';
import Sub from "./child.js";

export default class App extends Component {
    constructor(props) {
        super()
        this.state = { msgs: '点击传值' }
    }

    callback(msg) {
        console.log(msg);
        this.setState({ msgs: msg })
    }

    render() {
        return (
            <div>
                <h1>{this.state.msgs}</h1>
                <Sub args="我是父组件传过来的!" callback2={this.callback.bind(this)} />
            </div>
        )
    }
}