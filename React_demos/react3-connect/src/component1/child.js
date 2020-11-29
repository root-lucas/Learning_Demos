import React from "react";

const Sub = (props) => {
    let value = '我是子组件传回来的!'

    const cb = (msg) => {
        return () => {
            props.callback(msg)
        }
    }

    return (
        <div>
            <h1>{props.args}</h1>
            <button onClick={cb(value)}>点击我</button>
        </div>
    )
}

export default Sub;