import React from 'react';
import { connect } from 'react-redux'
import _ from 'lodash';

export default connect(({users}) => {return {users};})((props) => {
  let rows = _.map(props.users, (uu) => <User key={uu.id} user={uu} />);
  return <div className="row">
      <table className="table table-hover">
        <thead>
          <tr>
            <td> ID </td>
            <td> Email </td>
          </tr>
        </thead>
        <tbody>
          {rows}
        </tbody>
      </table>
    </div>;
});

function User(props) {
  let {user} = props;
  return <tr><td>{user.id}</td><td>{user.email}</td></tr>;
}

