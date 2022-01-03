defmodule Join.Api.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :email, :string
    field :name, :string
    field :password, :string
    field :surname, :string

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:email, :password, :name, :surname])
    |> validate_required([:email, :password, :name, :surname])
    |> unique_constraint(:email)
  end
end
