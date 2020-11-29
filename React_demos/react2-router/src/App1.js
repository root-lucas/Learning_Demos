// 最简单的路由
import React from 'react';
import './App.css';
import { BrowserRouter as Router, Route, Link } from "react-router-dom"

// 定义组件
function Home() {
    return <div>Home page</div>
}

function My() {
    return <div>My page</div>
}

function Friend() {
    return <div>Friend page</div>
}

function About() {
    return <div>About me page</div>
}

function App() {
    return (
        <Router>
            <div className="App">
                <ul>
                    <li><Link to="/" exact>home</Link></li>
                    <li><Link to="/my">my music</Link></li>
                    <li><Link to="/friend">friend</Link></li>
                    <li><Link to="/about">about me</Link></li>
                </ul>
                <Route path="/" component={Home}></Route>
                <Route path="/my" component={My}></Route>
                <Route path="/friend" component={Friend}></Route>
                <Route path="/about" component={About}></Route>
            </div>
        </Router>
    );
}

export default App;
