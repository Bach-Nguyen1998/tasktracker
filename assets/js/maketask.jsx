import React from 'react';
import { connect } from 'react-redux';
import _ from 'lodash';
import api from './api';

function maketask(ev) {
  ev.preventDefault();
  let title = $('#title').val();
  let desc = $('#desc').val();
  let time_spent = $('#time').val();
  let user = $('#user').val();
  let complete = $('#completed').prop("checked");
  api.create_task(title, desc, time_spent, user, complete);
}



export default connect(({users}) => {return {users};})((props) => {

  $('#time').keypress(function (ev) {ev.preventDefault();});
  let rows = _.map(props.users, (uu) => <SelectUser key={uu.id} user={uu} />);
  return <form>
    <label>Title</label> <br/>
    <input id="title" type="text" placeholder="Task Title" required/> <br/>
    <label>Description</label> <br/>
    <textarea id="desc" rows="5" cols="30" placeholder="Describe your task here" required/> <br/>
    <input type="number" id="time" min="0" step="15" defaultValue="0" required/><br/>
    <select id="user">{rows}</select><br/>
    <input type="checkbox" id="completed"/> Completed? <br/>
    <button type="submit" className="btn btn-primary" onClick={maketask}>Create Task </button>
  </form>;

});

function SelectUser(props) {
  let {user} = props;
  return <option id={user.id} value={user.id}> {user.email} </option>;
  
}

