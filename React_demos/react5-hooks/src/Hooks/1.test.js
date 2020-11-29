import React, { Component } from 'react'
export default class Test extends Component {
    constructor(props) {
        super(props)
        this.state = {
            isRed: true,
            count: 0
        }
    }

    handleClick1(i) {
        this.setState(function () {
            console.log("setState:");
            console.log(this.state);
            return { isRed: !this.state.isRed, count: this.state.count + i }
        });

    }

    // handleClick2() {
    //     this.replaceState({ count: 111 }, function () {
    //         console.log("replaceState:");
    //         // console.log(this.state);
    //     });
    // }

    render() {
        // let { clickCount } = this.state
        var redStyle = {
            color: 'red'
        };
        var blueStyle = {
            color: 'blue'
        };
        let btn = (
            <div>
                <h1 style={this.state.isRed ? redStyle : blueStyle}>Hello lucas！</h1>
                <button onClick={this.handleClick1.bind(this, 1)}>点击切换颜色</button>
                {/* <button onClick={this.handleClick2.bind(this)}>点击次数：{this.state.count}</button> */}
            </div>
        )

        return (
            <ul>{btn}</ul>
        )
    }
}
