import React from 'react';
import ReactDOM from 'react-dom';
import { Provider } from 'react-redux';
import { Link, BrowserRouter as Router, Route } from 'react-router-dom';
import _ from 'lodash';
import $ from 'jquery';

// import lists and stuff here
import api from './api';
import UserList from './user_list';
import TaskList from './task_list';
import Header from './header';
import MakeUser from './makeuser';
import MakeTask from './maketask';
export default function root_init(node, store) {
  ReactDOM.render(<Provider store={store}> 
  <Root />
  </Provider>, node); //is <Root products = ... /> necessary?
};

class Root extends React.Component {
  constructor(props) {
    super(props);
    api.fetch_tasks();
    api.fetch_users();
    
  }

  render () { 
    return <div> 
      <Router>
      <div>
        <Header />
          <div className="row">
            <div className="col-8">
             <Route path="/" exact={true} render={() => <TaskList />} />
             <Route path="/users" exact={true} render={() => <UserList />} />
             <Route path="/makeuser" exact={true} render={() => <MakeUser />} />
             <Route path="/maketask" exact={true} render={() => <MakeTask users={api.fetch_users()}/>} />

            </div>
          </div>
      </div>
      </Router>  
    </div>;
  }
}







