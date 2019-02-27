defmodule Tracker.Users do
  import Ecto.Query, warn: false
  alias Tracker.Repo
  alias Tracker.Users.User

  # list all users
  def list_users do
    Repo.all(User) 
    |> Enum.map(&{&1.name, &1.id})
  end

  # retreive user by ID
  def get_user!(id), do: Repo.get!(User, id)

  def get_user(id) do
    Repo.one from u in User,
      where: u.id == ^id
  end
  
  # get user by their email
  def get_user_by_email(email) do
    Repo.get_by(User, email: email)
  end

  # get user by their name
  def get_user_by_name(name) do
    Repo.get_by(User, name: name)  
  end

  # create a user
  def create_user(attrs \\ %{}) do
    %User{}
    |> User.changeset(attrs)
    |> Repo.insert()
  end

  # update a user
  def update_user(%User{} = user, attrs) do
    user
    |> User.changeset(attrs)
    |> Repo.update()
  end

  # delete a user
  def delete_user(%User{} = user) do
    Repo.delete(user)
  end

  def change_user(%User{} = user) do
    User.changeset(user, %{})
  end

end
