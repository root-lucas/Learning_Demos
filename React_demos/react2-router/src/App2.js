// 路由嵌套学习
import React from 'react'
import { BrowserRouter as Router, Route, Link, HashRouter } from 'react-router-dom'
import logo from './logo.svg'

function Home() {
    return <div>Home Pages</div>
}

function About() {
    return <div>About Pages</div>
}

const Topic = ({ match }) => {
    // 如果用类写的话读取则使用this.props.match.params
    console.log('match2 = ', match)
    // 增加判断
    if (match.params.id === 'rendering1') {
        return (
            <div>
                <img src={logo} />
            </div>
        )
    } else {
        return (
            <div>
                {match.params.id}
            </div>
        )
    }
}

// const Rendering1 = () => {
//     return (
//         <div>Rendering Page1</div>
//     )
// }

// const Rendering2 = () => {
//     return (
//         <div>Rendering Page2</div>
//     )
// }

// const Rendering3 = () => {
//     return (
//         <div>Rendering Page3</div>
//     )
// }

function Topics({ match }) {
    return (
        <div>
            <h1>Topics</h1>
            <ul>
                <li><Link to={`${match.url}/rendering1`}>rendering 1</Link></li>
                <li><Link to={`${match.url}/rendering2`}>rendering 2</Link></li>
                <li><Link to={`${match.url}/rendering3`}>rendering 3</Link></li>
            </ul>
            <Route path={`${match.path}/:id`} component={Topic}></Route>
            {/* <Route path={`${match.path}/rendering2`} component={Rendering2}></Route> */}
            {/* <Route path={`${match.path}/rendering3`} component={Rendering3}></Route> */}
            <Route path={`${match.path}/`} exact component={() => <div>Please select a topic</div>}></Route>
        </div>
    )
}

// 导出的是这个
export default class App extends React.Component {
    constructor(props) {
        super(props)
        this.state = {

        }
    }

    render() {
        return (
            <Router>
                <div>
                    <h1>导航列表</h1>
                    <ul>
                        <li><Link to="/home">home</Link></li>
                        <li><Link to="/about">about</Link></li>
                        <li><Link to="/topics">topics</Link></li>
                    </ul>
                </div>
                <Route path='/home' component={Home}></Route>
                <Route path='/about' component={About}></Route>
                <Route path='/topics' component={Topics}></Route>
            </Router>
        )
    }
}