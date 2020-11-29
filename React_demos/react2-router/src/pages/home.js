import React, { Component } from 'react'
import Tabbar from '../components/tabbar'

class Home extends Component {
    render() {
        return (
            <div>
                <img className='bg' src={require('../static/images/home.png')} alt="" />
            </div >
        )
    }
}

// export default () => (
//     <div>
//         Home Page123
//     </div>
// )

// function Home() {
//     return (
//         <div>
//             Home Page
//         </div>
//     )
// }

export default Tabbar(Home)