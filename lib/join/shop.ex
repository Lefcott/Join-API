defmodule Join.Shop do
  use Ecto.Schema
  import Ecto.Changeset

  schema "shops" do
    field :latitude, :integer
    field :longitude, :float
    field :main_photo_url, :string
    field :name, :string
    field :type, :string

    timestamps()
  end

  @doc false
  def changeset(shop, attrs) do
    shop
    |> cast(attrs, [:name, :type, :main_photo_url, :latitude, :longitude])
    |> validate_required([:name, :type, :main_photo_url, :latitude, :longitude])
  end
end
