defmodule Join.ApiFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Join.Api` context.
  """

  @doc """
  Generate a unique user email.
  """
  def unique_user_email, do: "some email#{System.unique_integer([:positive])}"

  @doc """
  Generate a user.
  """
  def user_fixture(attrs \\ %{}) do
    {:ok, user} =
      attrs
      |> Enum.into(%{
        email: unique_user_email(),
        name: "some name",
        password: "some password",
        surname: "some surname"
      })
      |> Join.Api.create_user()

    user
  end

  @doc """
  Generate a shop.
  """
  def shop_fixture(attrs \\ %{}) do
    {:ok, shop} =
      attrs
      |> Enum.into(%{
        latitude: 42,
        longitude: 120.5,
        main_photo_url: "some main_photo_url",
        name: "some name",
        type: "some type"
      })
      |> Join.Api.create_shop()

    shop
  end
end
