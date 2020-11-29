import React, { useContext, useState, createContext } from 'react'

// 最好去看了http://www.ruanyifeng.com/blog/2019/09/react-hooks.html

// 实例1
// 必需在组件外部创建createContext
const AppContext = React.createContext({});

function Child1() {
    const { username } = useContext(AppContext)

    return (
        <div>
            Im from Child1 {username}
        </div>
    )
}

function Child2() {
    const { username } = useContext(AppContext)

    return (
        < div >
            Im from Child2 {username}
        </div >
    )
}

export default function useContextExample() {
    let counter = 100
    return (
        // 这个value值是固定的,对象必需是双括号,注意必需有主标签
        <AppContext.Provider value={{ username: counter }}>
            <div>
                <Child1 />
                <Child2 />
            </div>
        </AppContext.Provider>
    )
}




// 实例2
// const themes = {
//     light: {
//         foreground: '#000000',
//         background: '#eeeeee'
//     },
//     dark: {
//         foreground: '#ffffff',
//         background: '#222222'
//     }
// }


// const ThemeContext = React.createContext({
//     theme: themes.light,
//     toggle: () => { }
// })

// export default () => {
//     const [theme, setTheme] = useState(themes.light)
//     return (
//         <ThemeContext.Provider
//             value={{
//                 theme,
//                 toggle: () => {
//                     setTheme(theme => {
//                         setTheme(theme === themes.light ? themes.dark : themes.light)
//                     })
//                 }
//             }}
//         >
//             <Toolbar />
//         </ThemeContext.Provider>
//     )
// }

// const Toolbar = () => {
//     return <ThemedButton />
// }

// const ThemedButton = () => {
//     const context = useContext(ThemeContext)
//     return (
//         <button
//             style={{
//                 fontSize: '32px',
//                 color: context.theme.foreground,
//                 backgroundColor: context.theme.background
//             }}
//             onClick={() => {
//                 context.toggle()
//             }}
//         >
//             Click Me!
//         </button>
//     )
// }