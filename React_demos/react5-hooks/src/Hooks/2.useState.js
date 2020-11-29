import React, { useState } from 'react'

export default function useCount() {
    // count是初始0的变量,setCount是函数,用来更新状态的,规定加的set关键字
    const [count, setCount] = useState(0)

    return (
        <div>
            <div>Your count: {count}</div>
            <button onClick={() => setCount(() => count + 1)}>Add</button>
        </div>
    )
}

// useState()只用于为函数组件引入状态,使用下面的类写法会报错
// export default class Example1 extends Component {
//     render() {
//         const [count, setCount] = useState(0)

//         return (
//             <div>
//                 <div>Your count: {count}</div>
//                 <button onClick={() => setCount(count + 1)}>Add</button>
//             </div>
//         )
//     }
// }
