defmodule EctoWorkshop.Repo.Migrations.CreateRecipes do
  use Ecto.Migration

  def change do
    create table(:recipes) do
      add :title, :string
      add :description, :string
      add :prep_time, :integer
      add :cook_time, :integer
      add :calories, :integer

      timestamps()
    end

  end
end
