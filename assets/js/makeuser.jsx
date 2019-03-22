import React from 'react';
import { connect } from 'react-redux'
import _ from 'lodash';
import api from './api';
import { Link, BrowserRouter as Router, Route, Redirect } from 'react-router-dom';


function makeuser(ev) {
  ev.preventDefault();
  let email = $('#createemail').val();
  let pass = $('#createpass').val();
  api.fetch_new_user(email, pass);
}

function MakeUser(props) {
  return <form>
          <label>Email Address</label> <br/>
          <input id="createemail" type="email" placeholder="email" />
          <br/> <label> Password </label> <br/>
          <input id="createpass"type="password" placeholder="password" /> <br/> <br/>
          <button type="submit" className="btn btn-primary" onClick={makeuser}>Create Account</button>
          </form>; 

}

function state2props(state) {
  return { session: state.session };
}

export default connect(state2props)(MakeUser);

