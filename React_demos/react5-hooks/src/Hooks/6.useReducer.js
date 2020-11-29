import React, { useReducer } from 'react'

function myReducer(state, action) {
    switch (action.type) {
        // 圆括号根据个人习惯写
        case 'add':
            return {
                ...state,
                count: state.count + action.value
            }
        case ('sub'): {
            console.log('state = ', state)
            if (state.count <= 0) { return state }
            return {
                ...state,   // 必需展开返回，否则 h1 标签无法读取值
                count: state.count - action.value
            }
        }
        default:
            return state
    }
}

function Count() {
    // state 就是右边的对象
    const [state, dispatch] = useReducer(myReducer, { count: 0, msg: 'hello lucas' })
    console.log(state)
    return (
        <div className="App">
            <h1>{state.msg}</h1>
            <button onClick={() => dispatch({ type: 'add', value: 1 })}>加1</button>
            <button onClick={() => dispatch({ type: 'sub', value: 1 })}>减1</button>
            <p>Count: {state.count}</p>
        </div>
    );
}

export default Count