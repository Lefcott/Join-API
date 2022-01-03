defmodule JoinWeb.ShopView do
  use JoinWeb, :view
  alias JoinWeb.ShopView

  def render("index.json", %{shops: shops}) do
    %{data: render_many(shops, ShopView, "shop.json")}
  end

  def render("show.json", %{shop: shop}) do
    %{data: render_one(shop, ShopView, "shop.json")}
  end

  def render("shop.json", %{shop: shop}) do
    %{
      id: shop.id,
      name: shop.name,
      type: shop.type,
      main_photo_url: shop.main_photo_url,
      latitude: shop.latitude,
      longitude: shop.longitude
    }
  end
end
