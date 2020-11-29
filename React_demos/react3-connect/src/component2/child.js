import React, { Component } from 'react'

export default class Child extends Component {

    constructor(props) {
        super(props)
        this.value = '我是子组件传回来的'  // 传给父组件的值
    }

    handleChange = function () {
        // 子传值给父
        this.props.callback2(this.value);
    }

    render() {
        return (
            <div>
                <h1>{this.props.args}</h1>
                {/* <button onClick={()=>{this.props.callback2(this.value)}}>Click Me!</button> */}
                {/* <button onClick={this.handleChange.bind(this)}>Click Me!</button> */}
                <button onClick={() => this.handleChange()}>Click Me!</button>
            </div>
        )
    }
}