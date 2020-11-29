import React, { Component } from 'react'
import Son from './son'

export default class Child extends Component {
    constructor(props, context) {
        super(props, context)
        this.state = {}
    }

    render() {
        return (
            <div>
                <h1>我是儿子组件</h1>
                <Son></Son>
            </div>
        )
    }
}