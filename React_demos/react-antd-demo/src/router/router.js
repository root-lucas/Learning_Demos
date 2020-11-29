import React, { Component } from 'react'
import { BrowserRouter, Switch, Route } from 'react-router-dom'
import Home from '../components/home'
import MyTable from '../components/table'
import MyChart from '../components/chart'
import MyCalendar from '../components/calendar'
import MyForm from '../components/form'
import MyAnimate from '../components/animate'
import MyCard from '../components/myCard'

class RouterList extends Component {
    render() {
        return (
            <BrowserRouter>
                <Switch>
                    <Route path='/' component={Home}>
                        <Route path='/' component={Home}></Route>
                        <Route path='myTable' component={MyTable}></Route>
                        <Route path='myChart' component={MyChart}></Route>
                        <Route path='myCalendar' component={MyCalendar}></Route>
                        <Route path='myForm' component={MyForm}></Route>
                        <Route path='myAnimate' component={MyAnimate}></Route>
                        <Route path='myCard' component={MyCard}></Route>
                    </Route>
                </Switch>
            </BrowserRouter>
        )
    }
}

export default RouterList