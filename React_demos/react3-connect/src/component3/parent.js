import React, { Component } from 'react'
import PropTypes from "prop-types";
import Sub from "./child";

export default class App extends Component {
    constructor(props) {
        super(props)
        this.state = {
            msgs: 10
        }
    }

    // 父组件声明自己支持 context
    static childContextTypes = {
        color: PropTypes.string,
        callback2: PropTypes.func,
    }

    // 父组件提供一个函数，用来返回相应的 context 对象
    getChildContext() {
        return {
            color: "red",
            callback2: this.callback2.bind(this)
        }
    }

    callback2(content) {
        console.log('Im is parent = ', content)
        this.setState({
            msgs: content
        })
    }

    render() {
        return (
            <div>
                <h1>Im is Parent： {this.state.msgs}</h1>
                <Sub></Sub>
            </div>
        );
    }
} 