defmodule Join.ApiTest do
  use Join.DataCase

  alias Join.Api

  describe "users" do
    alias Join.Api.User

    import Join.ApiFixtures

    @invalid_attrs %{email: nil, name: nil, password: nil, surname: nil}

    test "list_users/0 returns all users" do
      user = user_fixture()
      assert Api.list_users() == [user]
    end

    test "get_user!/1 returns the user with given id" do
      user = user_fixture()
      assert Api.get_user!(user.id) == user
    end

    test "create_user/1 with valid data creates a user" do
      valid_attrs = %{email: "some email", name: "some name", password: "some password", surname: "some surname"}

      assert {:ok, %User{} = user} = Api.create_user(valid_attrs)
      assert user.email == "some email"
      assert user.name == "some name"
      assert user.password == "some password"
      assert user.surname == "some surname"
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Api.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()
      update_attrs = %{email: "some updated email", name: "some updated name", password: "some updated password", surname: "some updated surname"}

      assert {:ok, %User{} = user} = Api.update_user(user, update_attrs)
      assert user.email == "some updated email"
      assert user.name == "some updated name"
      assert user.password == "some updated password"
      assert user.surname == "some updated surname"
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = Api.update_user(user, @invalid_attrs)
      assert user == Api.get_user!(user.id)
    end

    test "delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = Api.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> Api.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = Api.change_user(user)
    end
  end

  describe "shops" do
    alias Join.Api.Shop

    import Join.ApiFixtures

    @invalid_attrs %{latitude: nil, longitude: nil, main_photo_url: nil, name: nil, type: nil}

    test "list_shops/0 returns all shops" do
      shop = shop_fixture()
      assert Api.list_shops() == [shop]
    end

    test "get_shop!/1 returns the shop with given id" do
      shop = shop_fixture()
      assert Api.get_shop!(shop.id) == shop
    end

    test "create_shop/1 with valid data creates a shop" do
      valid_attrs = %{latitude: 42, longitude: 120.5, main_photo_url: "some main_photo_url", name: "some name", type: "some type"}

      assert {:ok, %Shop{} = shop} = Api.create_shop(valid_attrs)
      assert shop.latitude == 42
      assert shop.longitude == 120.5
      assert shop.main_photo_url == "some main_photo_url"
      assert shop.name == "some name"
      assert shop.type == "some type"
    end

    test "create_shop/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Api.create_shop(@invalid_attrs)
    end

    test "update_shop/2 with valid data updates the shop" do
      shop = shop_fixture()
      update_attrs = %{latitude: 43, longitude: 456.7, main_photo_url: "some updated main_photo_url", name: "some updated name", type: "some updated type"}

      assert {:ok, %Shop{} = shop} = Api.update_shop(shop, update_attrs)
      assert shop.latitude == 43
      assert shop.longitude == 456.7
      assert shop.main_photo_url == "some updated main_photo_url"
      assert shop.name == "some updated name"
      assert shop.type == "some updated type"
    end

    test "update_shop/2 with invalid data returns error changeset" do
      shop = shop_fixture()
      assert {:error, %Ecto.Changeset{}} = Api.update_shop(shop, @invalid_attrs)
      assert shop == Api.get_shop!(shop.id)
    end

    test "delete_shop/1 deletes the shop" do
      shop = shop_fixture()
      assert {:ok, %Shop{}} = Api.delete_shop(shop)
      assert_raise Ecto.NoResultsError, fn -> Api.get_shop!(shop.id) end
    end

    test "change_shop/1 returns a shop changeset" do
      shop = shop_fixture()
      assert %Ecto.Changeset{} = Api.change_shop(shop)
    end
  end
end
