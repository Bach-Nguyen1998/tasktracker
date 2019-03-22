import React from 'react';
import { connect } from 'react-redux';
import _ from 'lodash';
import api from './api';
import { Link, BrowserRouter as Router, Route } from 'react-router-dom';
import MakeTask from './maketask';
// need to filter tasks by current user

export default connect(({tasks}) => {return {tasks};})((props) => {
  let rows = _.map(props.tasks, (tt) => <Task key={tt.id} task={tt} />);
  return <div className="row">
           <Link to={"/maketask"}> Create a new task </Link>
           <table className="table table-hover">
             <thead>
               <tr><td> Title </td>
                 <td> Desc </td>
                 <td> Time Spent </td>
                 <td> User </td>
                 <td> Complete? </td></tr>
             </thead>
             <tbody>
               {rows}
             </tbody>
           </table>
         </div>;

});

function completetask(task) {
  let title = task.title;
  let desc = task.desc;
  let time_spent = task.time_spent;
  let user = task.user;
  let id = task.id;
  let complete = true;
  api.update_task(title, desc, time_spent, user, complete,id);
}

function Task(props) {
  let {task} = props;
  let complete = "complete";
  if (!task.complete) {
    complete = <button id="complete" type="submit" className="btn btn-primary" onClick={() => completetask(task)}>Complete Task</button>
  }
  return <tr><td>{task.title}</td>
           <td>{task.desc}</td>
           <td>{task.time_spent}</td>
           <td>{task.user}</td>
           <td>{complete} </td>
           <td><button type="submit" className="btn btn-success" onClick={() => addTime(task)}> + 15 min </button></td>
           <td><button type="submit" className="btn btn-danger" onClick={() => subTime(task)}> - 15 min </button></td>
</tr>;

}

function addTime(task) {
  let title = task.title;
  let desc = task.desc;
  let time_spent = task.time_spent + 15;
  let user = task.user;
  let id = task.id;
  let complete = task.complete;
  api.update_task(title, desc, time_spent, user, complete,id);
}

function subTime(task) {
  let title = task.title;
  let desc = task.desc;
  let time_spent;
  if (task.time_spent - 15 >= 0) {
    time_spent = task.time_spent - 15;
  }
  else {
    time_spent = task.time_spent;
  }
  let user = task.user;
  let id = task.id;
  let complete = task.complete;
  api.update_task(title, desc, time_spent, user, complete,id);
}

