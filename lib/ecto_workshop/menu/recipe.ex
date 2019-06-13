defmodule EctoWorkshop.Menu.Recipe do
  use Ecto.Schema
  import Ecto.Changeset

  schema "recipes" do
    field :calories, :integer
    field :cook_time, :integer
    field :description, :string
    field :prep_time, :integer
    field :title, :string

    timestamps()
  end

  @doc false
  def changeset(recipe, attrs) do
    recipe
    |> cast(attrs, [:title, :description, :prep_time, :cook_time, :calories])
    |> validate_required([:title, :description, :prep_time, :cook_time, :calories])
  end
end
