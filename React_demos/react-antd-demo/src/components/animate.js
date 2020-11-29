import React from 'react'

// 结尾组件
export default class myAnimate extends React.Component {
    constructor(props) {
        super(props)
        this.state = {}
    }
    render() {
        return (
            <div className="ani-box">
                <img src="./logo512.png" width="100" className="animate__animated animate__fadeInUp lastPic" alt='动画' />
                <span className="animated flipInX ege">我的头像</span>
            </div>
        )
    }
}