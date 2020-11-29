import { CHANGE_INPUT, ADD_TODO, REMOVE_TODO } from './actionType'

const defaultState = {
    inputValue: '',
    list: []
}

const reducer = (state = defaultState, action) => {
    // console.log('修改前的defaultState对象：', state)
    console.log('dispatch值传到这里：', action)
    if (action.type === CHANGE_INPUT) {
        // 下面这句不可以直接修改原状态，应返回新状态
        // state.inputValue = action.value
        let newState = JSON.parse(JSON.stringify(state))
        newState.inputValue = action.value    // 这里修改defaultState对象
        // 虽然仓库中状态发生了变化，但是不会自动更新组件
        return newState
    } else if (action.type === ADD_TODO) {
        let newState = JSON.parse(JSON.stringify(state))
        newState.list.push(state.inputValue)
        newState.inputValue = ''

        return newState
    } else if (action.type === REMOVE_TODO) {
        let newState = JSON.parse(JSON.stringify(state))
        // state.list.splice(action.index, 1)  // 为了避免出错，不要使用这个
        newState.list.splice(action.index, 1)
        return newState
    }
    return state
}

export default reducer