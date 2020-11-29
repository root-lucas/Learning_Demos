import React, { Component } from 'react'
import MyTable from './table'
import MyChart from './chart'
import MyCalendar from './calendar'
import MyForm from './form'
import MyAnimate from './animate'
import MyCard from './myCard'

export default class ClickShow extends Component {
    constructor(props) {
        super(props)
        this.state = {}
    }

    render() {
        console.log('子组件 = ', this.props.path)
        switch (this.props.path) {
            case '/myTable':
                return (<MyTable />)
            case '/myChart':
                return (<MyChart />)
            case '/myCalendar':
                return (<MyCalendar />)
            case '/myForm':
                return (<MyForm />)
            case '/myAnimate':
                return (<MyAnimate />)
            case '/myCard':
                return (<MyCard />)
            default:
                return (<h1>暂无数据</h1>)
        }

    }
}