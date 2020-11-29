import React, { Component } from 'react'
import './App.css'
import './static/iconfont.css'
// import Tabbar from './components/tabbar/index'
import RouterMap from './routes/router'

class App extends Component {
    render() {
        return (
            <div>
                <RouterMap />
            </div>
        )
    }
}

export default App