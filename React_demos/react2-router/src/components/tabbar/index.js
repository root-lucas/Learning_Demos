import React, { Component } from 'react'
import { Link } from 'react-router-dom'
import './index.css'

const tarbarArr = [
    {
        img: 'icon-home',
        text: '首页',
        link: '/home'
    },
    {
        img: 'icon-icon04',
        text: '分类',
        link: '/category'
    },
    {
        img: 'icon-gouwuche',
        text: '购物车',
        link: '/car'
    },
    {
        img: 'icon-yonghu',
        text: '我的',
        link: '/user'
    }
]

// 接收各种tabber的组件为函数参数并返回一个新的组件
const Tabbar = (WrappedComponent) => (
    class Tabbar extends Component {
        constructor(props) {
            super(props)
            this.state = {
                index: 0
            }
        }

        itemChange = (i) => {
            this.setState({
                index: i
            })
        }

        render() {
            let Url = window.location.href
            return (
                <div className='tabbar-container'>
                    <div className="tabbar-children">
                        <WrappedComponent />
                    </div>
                    <div className='tabbar'>
                        <div className="tabbar-content">
                            {
                                tarbarArr.map((v, i) => (
                                    // 1.点击选中效果（根据数字来判断）
                                    // <Link to={v.link} key={i} className={"tabbar-item" + (this.state.index === i ? ' active' : '')} onClick={() => this.itemChange(i)}>
                                    // 2.点击选中效果并跳转页面链接（根据链接来判断）
                                    <Link Link to={v.link} key={i} className={"tabbar-item " + (Url.indexOf(v.link) > -1 ? 'active' : '')} >
                                        <div className={'iconfont ' + v.img}></div>
                                        <div>{v.text}</div>
                                    </Link>
                                ))
                            }
                        </div>
                    </div>
                </div >
            )
        }
    }
)

export default Tabbar