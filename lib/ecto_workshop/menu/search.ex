defmodule EctoWorkshop.Menu.Search do
  use Ecto.Schema
  import Ecto.Changeset

  alias __MODULE__

  # notice we do not include timestamps or description
  embedded_schema do
    field :calories, :integer
    field :cook_time, :integer
    field :prep_time, :integer
    field :title, :string
  end

  def new(attrs) do
    changeset = attrs |> changeset()
    changeset.changes
  end

  @doc false
  def changeset(attrs) do
    changeset(%Search{}, attrs)
  end

  @doc false
  def changeset(recipe, attrs) do
    recipe
    |> cast(attrs, [:title, :prep_time, :cook_time, :calories])
  end
end
