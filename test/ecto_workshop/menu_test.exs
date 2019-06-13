defmodule EctoWorkshop.MenuTest do
  use EctoWorkshop.DataCase

  alias EctoWorkshop.Menu

  describe "recipes" do
    alias EctoWorkshop.Menu.Recipe

    @valid_attrs %{calories: 42, cook_time: 42, description: "some description", prep_time: 42, title: "some title"}
    @update_attrs %{calories: 43, cook_time: 43, description: "some updated description", prep_time: 43, title: "some updated title"}
    @invalid_attrs %{calories: nil, cook_time: nil, description: nil, prep_time: nil, title: nil}

    def recipe_fixture(attrs \\ %{}) do
      {:ok, recipe} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Menu.create_recipe()

      recipe
    end

    test "list_recipes/0 returns all recipes" do
      recipe = recipe_fixture()
      assert Menu.list_recipes() == [recipe]
    end

    test "get_recipe!/1 returns the recipe with given id" do
      recipe = recipe_fixture()
      assert Menu.get_recipe!(recipe.id) == recipe
    end

    test "create_recipe/1 with valid data creates a recipe" do
      assert {:ok, %Recipe{} = recipe} = Menu.create_recipe(@valid_attrs)
      assert recipe.calories == 42
      assert recipe.cook_time == 42
      assert recipe.description == "some description"
      assert recipe.prep_time == 42
      assert recipe.title == "some title"
    end

    test "create_recipe/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Menu.create_recipe(@invalid_attrs)
    end

    test "update_recipe/2 with valid data updates the recipe" do
      recipe = recipe_fixture()
      assert {:ok, %Recipe{} = recipe} = Menu.update_recipe(recipe, @update_attrs)
      assert recipe.calories == 43
      assert recipe.cook_time == 43
      assert recipe.description == "some updated description"
      assert recipe.prep_time == 43
      assert recipe.title == "some updated title"
    end

    test "update_recipe/2 with invalid data returns error changeset" do
      recipe = recipe_fixture()
      assert {:error, %Ecto.Changeset{}} = Menu.update_recipe(recipe, @invalid_attrs)
      assert recipe == Menu.get_recipe!(recipe.id)
    end

    test "delete_recipe/1 deletes the recipe" do
      recipe = recipe_fixture()
      assert {:ok, %Recipe{}} = Menu.delete_recipe(recipe)
      assert_raise Ecto.NoResultsError, fn -> Menu.get_recipe!(recipe.id) end
    end

    test "change_recipe/1 returns a recipe changeset" do
      recipe = recipe_fixture()
      assert %Ecto.Changeset{} = Menu.change_recipe(recipe)
    end
  end
end
