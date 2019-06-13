defmodule EctoWorkshop.Menu do
  @moduledoc """
  The Menu context.
  """

  import Ecto.Query, warn: false
  alias EctoWorkshop.Repo

  alias EctoWorkshop.Menu.Recipe

  def list_recipes(search_query) do
    query = search(search_query)
    Repo.all(query)
  end

  def search(search_query) do
    query = from(r in Recipe)
    Enum.reduce(search_query, query, &search(&1, &2))
  end

  defp search({:title, value}, query) do
    pattern = "%#{value}%"
    from q in query, where: ilike(q.title, ^pattern)
  end

  defp search({:prep_time, value}, query) do
    from q in query, where: q.prep_time < ^value
  end

  defp search({:cook_time, value}, query) do
    from q in query, where: q.cook_time < ^value
  end

  defp search({:calories, value}, query) do
    from q in query, where: q.calories < ^value
  end

  @doc """
  Gets a single recipe.

  Raises `Ecto.NoResultsError` if the Recipe does not exist.

  ## Examples

      iex> get_recipe!(123)
      %Recipe{}

      iex> get_recipe!(456)
      ** (Ecto.NoResultsError)

  """
  def get_recipe!(id), do: Repo.get!(Recipe, id)

  @doc """
  Creates a recipe.

  ## Examples

      iex> create_recipe(%{field: value})
      {:ok, %Recipe{}}

      iex> create_recipe(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_recipe(attrs \\ %{}) do
    %Recipe{}
    |> Recipe.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a recipe.

  ## Examples

      iex> update_recipe(recipe, %{field: new_value})
      {:ok, %Recipe{}}

      iex> update_recipe(recipe, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_recipe(%Recipe{} = recipe, attrs) do
    recipe
    |> Recipe.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Recipe.

  ## Examples

      iex> delete_recipe(recipe)
      {:ok, %Recipe{}}

      iex> delete_recipe(recipe)
      {:error, %Ecto.Changeset{}}

  """
  def delete_recipe(%Recipe{} = recipe) do
    Repo.delete(recipe)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking recipe changes.

  ## Examples

      iex> change_recipe(recipe)
      %Ecto.Changeset{source: %Recipe{}}

  """
  def change_recipe(%Recipe{} = recipe) do
    Recipe.changeset(recipe, %{})
  end
end
