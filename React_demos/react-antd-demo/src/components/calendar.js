import React, { Component } from 'react'
import { Calendar } from 'antd';

class MyCalendar extends Component {

    // onPanelChange = (value, mode) => {
    //     // console.log(value.format('YYYY-MM-DD'), mode);
    // }

    dateCellRender = (value) => {
        return <div>自定义日数据 {value._d.getDate()}</div>
    }

    monthCellRender = (value) => {
        return <div>自定义月数据 {value._d.getMonth()+1}</div>
    }

    render() {
        return (
            <Calendar dateCellRender={this.dateCellRender} monthCellRender={this.monthCellRender} />
        )
    }
}

export default MyCalendar