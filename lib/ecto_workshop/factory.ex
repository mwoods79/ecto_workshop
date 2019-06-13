defmodule EctoWorkshop.Factory do
  use ExMachina.Ecto, repo: EctoWorkshop.Repo

  alias EctoWorkshop.Menu.Recipe

  def recipe_factory do
    %Recipe{
      title: Faker.Food.dish(),
      description: Faker.Food.description(),
      calories: Faker.Random.Elixir.random_between(150, 2500),
      cook_time: Faker.Random.Elixir.random_between(10, 45),
      prep_time: Faker.Random.Elixir.random_between(10, 45)
    }
  end
end
