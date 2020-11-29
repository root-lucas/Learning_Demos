import React, { Component } from 'react'
import PropTypes from 'prop-types'

export default class Son extends Component {
    // 孙子组件接收类型
    static contextTypes = {
        color: PropTypes.string,
        somData: PropTypes.string,
        callback: PropTypes.func
    }

    constructor(props, context) {
        super(props, context)
        this.state = {}
    }

    render() {
        let { color, somData } = this.context
        return (
            <div style={{ color }}>
                <h1>我是孙子组件: {somData}</h1>
                <button onClick={() => this.context.callback('我是孙子组件传回来的数据')}>点击我传送数据</button>
            </div >
        )
    }
}