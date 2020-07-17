export const RECEIVE_TODOS = "RECEIVE_TODOS";
export const RECEIVE_TODO = "RECEIVE_TODO";
// export const ADD_TODO = "ADD_TODO";

export const receiveTodos = (todos) => {
    // debugger
    return {
        type: RECEIVE_TODOS,
        todos
    }
}

export const receiveTodo = (todo) => {
    // debugger
    return {
        type: RECEIVE_TODO,
        todo
    }
}
