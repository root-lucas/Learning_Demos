import React from 'react'
import { Link } from 'react-router-dom'

function index() {
    return (
        <div style={{ width: '100vw ', height: '100vh', display: 'flex', alignContent: 'center', alignItems: 'center',textAlign:'center' }}>
            <h2><Link to='/home'>点我进入首页</Link></h2>
        </div>
    )
}

export default index
