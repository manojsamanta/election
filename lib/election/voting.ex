defmodule Election.Voting do
  @moduledoc """
  The Voting context.
  """

  import Ecto.Query, warn: false
  alias Election.Repo
  import Ecto.Changeset

  alias Election.Voting.Voter

  def changeset(voting, params \\ %{}) do
    voting
    |> cast(params, [:first, :last])
  end

  def list_voters do
    Repo.all(Voter)
  end

  def list_voters_name(%{"first" => first, "last" => last}) do
    from(v in Voter, where: v.first == ^String.upcase(first) and v.last==^String.upcase(last), select: v)
    |> Repo.all()
  end

  def list_voters_address(%{"street" => street, "city" => city}) do

    tokens = String.split(street) |> Enum.map(&String.trim/1) |> Enum.join("&")

    from(v in Voter, 
      where: fragment("ts @@ to_tsquery(?)", ^tokens)
      and v.city==^String.upcase(city), 
      select: v)
    |> Repo.all()
  end
    
  def get_voter!(id), do: Repo.get!(Voter, id)

end
