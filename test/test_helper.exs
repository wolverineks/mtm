ExUnit.start

Mix.Task.run "ecto.create", ~w(-r Mtm.Repo --quiet)
Mix.Task.run "ecto.migrate", ~w(-r Mtm.Repo --quiet)
Ecto.Adapters.SQL.begin_test_transaction(Mtm.Repo)

