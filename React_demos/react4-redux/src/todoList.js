import React from 'react'
import Store from './store/index'
import { change_action, add_action, remove_action } from './store/actions'
import TodoListUI from './todoListUI.js'

// 对UI组件和业务组件进行分类
export default class TodoList extends React.Component {
    constructor(props) {
        super(props)
        // 获取仓库状态
        this.state = Store.getState()

        this.changeInput = this.changeInput.bind(this)
        this.handleChange = this.handleChange.bind(this)
        this.addTodo = this.addTodo.bind(this)

        // 接收到变化后触发
        Store.subscribe(this.handleChange)
        console.log('Store = ', Store.getState())
    }

    removeTodo(index) {
        Store.dispatch(remove_action(index))
    }

    addTodo(e) {
        // 传回reducer.js中
        Store.dispatch(add_action())
    }

    handleChange() {
        // console.log('我接收到了Store状态变化的监听')
        this.setState(Store.getState())
    }

    changeInput(e) {
        // 在本组件中发出action动作传到reducer.js中
        Store.dispatch(change_action(e.target.value))
    }

    render() {
        // 父向子组件通信
        return (
            <TodoListUI
                // inputValue redux设置初始值
                value={this.state.inputValue}
                changeVal={this.changeInput}
                add={this.addTodo}
                dataSource={this.state.list}
                remove={this.removeTodo}
            />
        )
    }
}