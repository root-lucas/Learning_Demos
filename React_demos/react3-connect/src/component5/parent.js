import React, { Component } from 'react';
import Child1 from './child1'
import Child2 from './child2'


export default class App extends Component {
    handle(e){
        console.log('e = ',e)
    }
    render() {
        return (
            <div>
                <h1>我是父组件</h1>
                <Child1></Child1>
                <Child2 cb={this.handle}></Child2>
            </div>
        );
    }
}