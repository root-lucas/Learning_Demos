import React, { Component } from "react";
import emitter from "./events"

export default class Child1 extends Component {
    constructor(props) {
        super(props)
        this.state = {
            msg: "初始数据"
        }
    }

    // 组件装载完成以后生成
    componentDidMount() {
        // 声明一个自定义事件
        this.eventEmitter = emitter.addListener('callMe', (msg) => {
            this.setState({ msg })
        })
    }

    // 组件销毁前移除事件监听
    componentWillUnmount() {
        emitter.removeListener(this.eventEmitter);
    }

    render() {
        return (
            <div>
                <h1>我是1号儿子组件: {this.state.msg}</h1>
            </div>
        )
    }
}