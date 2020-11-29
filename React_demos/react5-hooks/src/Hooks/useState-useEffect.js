import React, { useState, useEffect } from 'react'

// 封装使用，行为（UI）和状态分离更便于维护和复用
function useCount(initialValue) {
    const [count, setCount] = useState(initialValue)

    return [count, () => { setCount(count + 1) }]
}

function log(countValue) {
    console.log(`Your Click count ${countValue} times`)
}

export default () => {
    // addCount1是setCount的封装
    const [count, addCount1] = useCount(0)
    // const [count, addCount2] = useCount(0)

    // 只要本函数被调用就会重新更新
    // 读作：依赖【变化】变化的作用
    useEffect(log.bind(this, count))

    return (
        <div>

            <div>Your count: {count}</div>
            {/* 用户触发UI行为 */}
            <button onClick={() => addCount1()}>Add</button>
        </div>
    )
}