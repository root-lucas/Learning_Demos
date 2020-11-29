import { CHANGE_INPUT, ADD_TODO, REMOVE_TODO } from './actionType'


export const change_action = (val) => {
    return {
        type: CHANGE_INPUT,
        value: val
    }
}

export const add_action = (val) => {
    return {
        type: ADD_TODO
    }
}

export const remove_action = (index) => {
    return {
        type: REMOVE_TODO,
        index: index
    }
}