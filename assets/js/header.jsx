import React from 'react';
import _ from 'lodash';
import { Link } from 'react-router-dom';
import { connect } from 'react-redux';
import api from './api';
function test(ev) {
  ev.preventDefault();
  let email = $('#email').val();
  let password = $('#password').val();
  api.create_session(email, password);
}

function Header(props) {
  let {session} = props;
  let session_info;
  if (session == null) {
    session_info = <div className="form-inline">
      <input id="email" type="email" placeholder="email" />
      <input id="password" type="password" placeholder="password" />
      <button className="btn btn-secondary" onClick={test}>Login</button>
    </div>;
  }
  else {
    session_info = <div className="my-2">
      <p>Logged in as {session.user_id}</p>
    </div>
  }

  return <nav className="navbar navbar-inverse"> 
           <div className="container-fluid">
             <div className="navbar-header">
             </div>
             <ul className="nav navbar-nav">
               <li><Link to={"/users"}>Current Users</Link></li>
               <li><Link to={"/"}>Your Tasks</Link></li>
               <li><Link to={"/makeuser"}>Create Account</Link></li>
               <li> {session_info} </li>
             </ul>
           </div>
         </nav> ;
}

function state2props(state) {
  return { session: state.session };
}

export default connect(state2props)(Header);

