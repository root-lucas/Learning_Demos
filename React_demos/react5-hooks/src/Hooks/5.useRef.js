import React, { useRef, useState } from 'react'

export default function UseRefExample() {
    //用useRef创建了refInput对象，并将其赋给了input的ref属性。这样，就能
    // 通过访问refInput.current就可以访问到input对应的所有DOM对象方法。
    // 作用：方便地保存值

    // 实例1
    const refInput = useRef()
    return (
        <div>
            <input type="text" ref={refInput} />
            <button onClick={() => { console.log(refInput); refInput.current.focus() }}>Focus</button>
        </div>
    )

    // 实例2，保存值
    // const [counter, setCounter] = useState(0)
    // const prev = useRef(null)

    // return (
    //     <div>
    //         <p>当前值：{counter}</p>
    //         <p>之前的值：{prev.current}</p>
    //         <button
    //             onClick={() => {
    //                 prev.current = counter;
    //                 console.log(prev);
    //                 setCounter(x => x + 1)
    //             }}
    //         >add</button>
    //         <button
    //             onClick={() => {
    //                 prev.current = counter;
    //                 console.log(prev);
    //                 setCounter(x => x - 1)
    //             }}
    //         >sub</button>
    //     </div>
    // )
}