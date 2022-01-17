defmodule Join.Repo.Migrations.ChangeLatitudeToFloat do
  use Ecto.Migration

  def change do
    alter table("shops") do
      modify :latitude, :float
    end
  end
end
