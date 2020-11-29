import React, { useState, useCallback, useEffect } from 'react';

// useCallback跟useMemo比较类似，但它返回的是缓存的函数

// 应用场景：父组件中包含子组件，子组件接收一个函数作为props，通常而言，如果父组件更新了，
// 子组件也会执行更新；但是大多数场景下，更新是没有必要的，我们可以借助useCallback来返回函数，
// 然后把这个函数作为props传递给子组件；这样，子组件就能避免不必要的更新。
// React.memo 和 React.useCallback 一定记得需要配对使用，缺了一个都可能导致性能不升反“降”，毕竟无意义的浅比较也是要消耗那么一点点点的性能。
// 返回值：一个回调函数

// 实例1 
export default function Parent() {
    const [count, setCount] = useState(1);
    const [val, setVal] = useState('');

    const callback = useCallback(() => {
        return count;
    }, [count]);

    return <div>
        <h1>{count}</h1>
        <Child callback={callback} />
        <div>
            <button onClick={() => setCount(count + 1)}>+</button>
            <input value={val} onChange={event => setVal(event.target.value)} />
        </div>
    </div>;
}

function Child({ callback }) {
    const [count, setCount] = useState(() => callback());

    useEffect(() => {
        setCount(callback());
    }, [callback]);

    return (
        <div>
            {count}
        </div>
    )
}