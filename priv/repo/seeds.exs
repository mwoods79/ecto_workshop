# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     EctoWorkshop.Repo.insert!(%EctoWorkshop.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

Enum.map(1..20, fn _iteration ->
  EctoWorkshop.Factory.insert(:recipe)
end)
