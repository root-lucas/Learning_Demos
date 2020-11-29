import React, { useState, useEffect } from 'react'

// 如果依赖项数组是空,则组件被渲染时只会执行一次
// 最常见的就是向服务器请求数据，类比生命周期componentDidMount方法
// 每次组件被渲染，就会执行useEffect()

// 实例1：频繁 生成/销毁 定时器带来了一定性能负担

export default function Example() {
    const [count, setCount] = useState(0)
    useEffect(() => {
        // setInterval还是setTimeout都是一样
        const ID = setTimeout(() => {
            console.log(count)
            setCount((count) => count + 1)
            // 推荐使用解耦更新
            //  dispatch({ type: "tick" }); // Instead of setCount(c => c + step);
        }, 1000)
        // 必须回收
        return () => clearTimeout(ID)
    }, [count]) // 因为每次都会产生一个新的count，所以每过一秒钟都会被执行

    return (
        <div>
            <p>Your Clicked {count} times</p>
            <button
                onClick={() => {
                    setCount(count + 1)
                }}
            >
                Click
            </button>
        </div>
    )
}

// 实例2
// export default function Counter() {
//     const [count, setCount] = useState(0);

//     useEffect(() => {
//         // 只要count变量产生改变那么也会连锁效应
//         document.title = `You clicked ${count} times`;
//     }, [count]);  // 此参数告诉 React 用到了哪些外部变量,count变量改变才会再度执行函数

//     return (
//         <div>
//             <p>You clicked {count} times</p>
//             <button onClick={() => setCount(count + 1)}>Click me</button>
//         </div>
//     );
// }
