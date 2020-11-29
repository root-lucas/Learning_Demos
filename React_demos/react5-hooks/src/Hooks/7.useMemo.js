import React, { useMemo, useState } from 'react'

// useMemo 类似于vue中的watch和computed属性
// useMemo和useEffect都是组件渲染时执行。区别是useMemo是在DOM更新前触发的，useEffect只能在DOM更新后再触发
// 俩着都是依赖改动某变量属性才会执行, 而useMemo会返回值赋给变量
// 如果其依赖项数组中的元素为空则仅在组件刷新后才会执行

// 实例1
// export default function WithMemo() {
//     const [count, setCount] = useState(1);
//     const [input, setInput] = useState('');
//     const expensive = useMemo(() => {
//         console.log('compute value');
//         let sum = 0;
//         for (let i = 0; i < count; i++) {
//             sum += i;
//         }
//         console.log('sum=', sum)
//         return sum;
//     }, [count]);  // 监听count变量属性

//     return (
//         <div>
//             <h4>{count}-{input}-{expensive}</h4>
//             {input}
//             <div>
//                 <button onClick={() => setCount(count + 1)}>+1</button>
//                 <input value={input} onChange={event => setInput(event.target.value)} />
//             </div>
//         </div>
//     )
// }

// 实例2， useMemo在用户每次刷新页面会更新一次，如果依赖项是空值则仅执行一次
// 需求：每次count等于10的时候执行一次useMemo函数怎么设置
export default function UseMemoExample() {
    const [count, setCount] = useState(0)
    const memorizedText = useMemo(() => {
        console.log('run useMemo function')
        return `this is a memorized text ${Date.now()}`;
    }, [Math.floor(count / 10)]) // 每次count增加10就执行一次函数并获得新时间

    return (
        <div>
            {memorizedText}
            <p>You clicked {count} times</p>
            <button onClick={() => setCount(count + 1)}>Click me</button>
        </div>
    )

}