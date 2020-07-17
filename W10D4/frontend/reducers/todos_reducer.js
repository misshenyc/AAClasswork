import { RECEIVE_TODOS, RECEIVE_TODO} from '../actions/todo_actions';

const initialState = {
    1: {
        id: 1,
        title: "wash car",
        body: "with soap",
        done: false
    },
    2: {
        id: 2,
        title: "wash dog",
        body: "with shampoo",
        done: true
    }
};


const todosReducer = (state = initialState, action) => {
    Object.freeze(state);
    switch (action.type) {
        case RECEIVE_TODOS:
            // debugger
            const newState = Object.assign({}, state)
            action.todos.forEach( (todo) => {
                newState[todo.id] = todo;
            })
            return newState;

        case RECEIVE_TODO:
            // debugger
            const nextState = Object.assign({}, state);
            nextState[action.todo.id] = action.todo;
            return nextState;

        default:
            return state;
    }
};

export default todosReducer;

const newTodos = [
    {
        id: 3,
        title: "have fun",
        body: "with redux",
        done: false
    },
    {
        id: 4,
        title: "wash elyas",
        body: "with chaim",
        done: true
    }
];