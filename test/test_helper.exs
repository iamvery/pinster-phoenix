Application.ensure_all_started(:hound)
ExUnit.start

Mix.Task.run "ecto.create", ~w(-r PinsterPhoenix.Repo --quiet)
Mix.Task.run "ecto.migrate", ~w(-r PinsterPhoenix.Repo --quiet)
Ecto.Adapters.SQL.begin_test_transaction(PinsterPhoenix.Repo)

