# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Notifier.Repo.insert!(%Notifier.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
alias NimbleCSV.RFC4180, as: CSV
alias Notifier.Repo
alias Notifier.Organization.Memo

"priv/seed_data/memo.csv"
|> File.read!
|> CSV.parse_string
|> Enum.each(fn [_,message,title,is_draft] ->

  is_draft=String.to_existing_atom(is_draft)
  

  %Memo{message: message, title: title, is_draft: is_draft}
  |> Repo.insert
end)
