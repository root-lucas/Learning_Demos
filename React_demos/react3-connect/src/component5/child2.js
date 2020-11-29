import React, { Component } from "react";
import emitter from "./events"

export default class Child2 extends Component {

    callback(msg) {
        console.log('msg = ', msg)
        emitter.emit("callMe", "我是2号儿子组件传过来的数据")
    }

    render() {
        // const cb = (msg) => {
        //     return () => {
        //         console.log('msg = ', msg)
        //         // 触发自定义事件,数据传递至兄弟组件
        //         emitter.emit("callMe", "我是2号儿子组件传过来的数据")
        //     }
        // }
        return (
            <div>
                <h1>我是2号儿子组件</h1>
                {/* <button onClick = { cb("blue") }>点击我</button> */}
                <button onClick={() => this.callback('hello lucas')}>点击我</button>
            </div>
        );
    }
}