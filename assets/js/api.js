import store from './store';
// fetch tasks and fetch users

class TheServer {
  fetch_path(path, callback) {
    $.ajax(path, {
      method: "get",
      dataType: "json",
      contentType: "application/json; charset=UTF-8",
      data: "",
      success: callback

    });
  }

  update_path(path, data, callback) {
    $.ajax(path, {
      method: "put",
      dataType: "json",
      contentType: "application/json; charset=UTF-8",
      data: JSON.stringify(data),
      success: callback

    });
  }

  send_post(path, data, callback) {
    $.ajax(path, {
      method: "post",
      dataType: "json",
      contentType: "application/json; charset=UTF-8",
      data: JSON.stringify(data),
      success: callback,
      // more indepth error
    });
  }

 
  fetch_users() {
    this.fetch_path(
      "/api/v1/users",
      (resp) => {
        store.dispatch({
          type: 'USER_LIST',
          data: resp.data,
        });
      }
    );
  }

  fetch_new_user(email, password) {
  this.send_post(
      "/api/v1/users",
      {email, password},
      (resp) => {
        store.dispatch({
          type: 'MAKE_USER',
          data: resp.data
        });
      }
    ); 
  }
  
  create_task(title, desc, time_spent, user, complete) {
    this.send_post(
      "api/v1/tasks",
      {title, desc, time_spent, user, complete},
      (resp) => {
        store.dispatch({
          type: 'MAKE_TASK', 
          data: resp.data
        });
      }
    );
  }

  update_task(title, desc, time_spent, user, complete, id) {
    let path = "/api/v1/tasks/" + id;
    this.update_path(path, 
            {title, desc, time_spent, user, complete},
        (resp) => {
        store.dispatch({
          type: 'UPDATE_TASK', 
          data: resp.data
        });
      }
    );
  }
  
  fetch_tasks() {
    this.fetch_path(
      "/api/v1/tasks",
      (resp) => {
        store.dispatch({
          type: 'TASK_LIST',
          data: resp.data,
        });  
      }  
    );
  }

 create_session(email, password) {
    this.send_post(
      "/api/v1/auth",
      {email, password},
      (resp) => {
        store.dispatch({
          type: 'NEW_SESSION',
          data: resp.data,
        });
      }
    ); 
  }
  
}

export default new TheServer();
