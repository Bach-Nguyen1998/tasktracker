defmodule Spatracker.Users do
  import Ecto.Query, warn: false
  alias Spatracker.Repo
  alias Spatracker.Users.User

  # list all users
  def list_users do
    Repo.all(User) 
  end

  # retreive user by ID
  def get_user!(id), do: Repo.get!(User, id)

  def get_user(id) do
    Repo.one from u in User,
      where: u.id == ^id
  end
  
  def authenticate_user(email, password) do
    Repo.get_by(User, email: email)
    |> Argon2.check_pass(password)
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
  def create_user(email, password \\ %{}) do
    attrs = %{email: email, password_hash: Argon2.add_hash(password).password_hash}
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