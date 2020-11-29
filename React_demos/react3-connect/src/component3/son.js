import React, { Component } from "react";
import PropTypes from "prop-types";

export default class SubSub extends Component {
    // 子组件声明自己需要使用 context 的哪些属性
    static contextTypes = {
        color: PropTypes.string,
        callback2: PropTypes.func,
    }

    render() {
        const style = { color: this.context.color }
        // const cb = (msg) => {
        //     return () => {
        //         this.context.callback(msg);
        //     }
        // }
        return (
            <div style={style}>
                <h1>Im is Son: my color from parent!</h1>
                <button onClick={() => this.context.callback2("Im from son!")}>Click Me!</button>
            </div>
        );
    }
}