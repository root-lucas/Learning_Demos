import React, { Component } from 'react'
import PropTypes from 'prop-types'
import Child from './child'

export default class Parent extends Component {
    constructor(props) {
        super(props)
        this.state = {
            msg: null
        }
    }

    // 声明父组件支持传递
    static childContextTypes = {
        color: PropTypes.string,
        somData: PropTypes.string,
        callback: PropTypes.func
    }

    // 要传送的数据
    getChildContext() {
        return {
            color: 'red',
            somData: '我是父组件传送过去的数据',
            callback: this.callback.bind(this)
        }
    }
    // 孙子组件触发函数后传回来的值
    callback(msg) {
        // console.log('Im parent = ', msg)
        // this.value1 = msg
        // 必需与state同名,否则报错
        this.setState({ msg })
    }

    render() {
        return (
            <div>
                <h1>我是父组件: {this.state.msg} </h1>
                <Child></Child>
            </div>
        )
    }
}