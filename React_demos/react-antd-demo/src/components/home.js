import React, { Component } from 'react'
import { Link } from 'react-router-dom'
import { Menu } from 'antd'
import { AppstoreFilled, UserOutlined, SettingFilled, MailOutlined } from '@ant-design/icons'
import './home.css'
import 'animate.css/animate.min.css'
import ClickShow from '../components/clickShow'
import 'antd/dist/antd.css'

const { SubMenu } = Menu

class Home extends Component {
    render() {
        let pathName = window.location.pathname
        return (
            <div className="container">
                <div className='leftMenu'>
                    <img src="./logo192.png" alt="图标" width="50" id="logo" />
                    <Menu id='changeMenu' theme="dark" mode='inline' defaultOpenKeys={['sub1', 'sub2']} defaultSelectedKeys={['1']}>
                        <SubMenu key='sub1' icon={<MailOutlined />} title='导航一'>
                            <Menu.Item id='change'><Link to='myTable'>表格</Link></Menu.Item>
                            <Menu.Item><Link to='myForm'>表单</Link></Menu.Item>
                            <Menu.Item><Link to='myChart'>图表</Link></Menu.Item>
                            <Menu.Item><Link to='myCalendar'>日历</Link></Menu.Item>
                        </SubMenu>
                        <SubMenu key='sub2' icon={<AppstoreFilled />} title='导航二'>
                            <Menu.Item><Link to='myCard'>导航</Link></Menu.Item>
                            <Menu.Item><Link to='myAnimate'>关注</Link></Menu.Item>
                            <SubMenu key="sub2-2" title="三级导航">
                                <Menu.Item key="7-1">选项7</Menu.Item>
                                <Menu.Item key="7-2">选项8</Menu.Item>
                            </SubMenu>
                        </SubMenu>
                    </Menu>
                </div>
                <div className='rightWrap'>
                    <div className='rightUser'>
                        <Menu mode="horizontal" style={{ textAlign: 'right', width: '100' }}>
                            <SubMenu icon={<UserOutlined />} title='Lucas' >
                                <Menu.Item style={{ textAlign: 'center' }}>退出</Menu.Item>
                            </SubMenu>
                        </Menu>
                    </div>
                    <div className='rightBox'>
                        <ClickShow path={pathName} />
                    </div>
                </div>
            </div>
        )
    }
}

export default Home