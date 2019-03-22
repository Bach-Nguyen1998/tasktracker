// two functions redux gives us
import {createStore, combineReducers} from 'redux';
import deepFreeze from 'deep-freeze';
// copy state from root component as comment to keep track
// For each component of the sate: 
//  - Function with the same name
//  - Default vaue of state is the default value of the that element.

/* Application state:
{
  users: [],
  tasks: [],
  session: null,
  add_task_forms: new Map()
}
*/

function users(state0 = [], action) {
  switch(action.type) {
  case 'USER_LIST':
    return action.data;
  case 'MAKE_USER':
    let state = state0.concat(action.data);
    return state;
  default:
    return state0;
  }
}

function tasks(state0 = [], action) {
  switch(action.type) {
  case 'TASK_LIST':
    return action.data;
  case 'MAKE_TASK':
    let state = state0.concat(action.data);
    return state;
  case 'UPDATE_TASK':
    let state1 = _.clone(state0);
    let idx = _.findIndex(state1, function(ele) { return action.data.title == ele.title });
    state1[idx] = action.data;
    return state1;
  default:
    return state0;
  }
}

function session(state0 = null, action) {
  switch(action.type) {
  case 'NEW_SESSION':
    return action.data;
  default:
    return state0;
  }
}

let login_form0 = {email: "", password: ""};
function login_form(state = login_form0, action) {
  return state;
}

function root_reducer(state0, action) {
  let reducer = combineReducers({users, tasks, session, login_form});
  let state1 = reducer(state0, action);
  return deepFreeze(state1);
}

let store = createStore(root_reducer);
export default store;

