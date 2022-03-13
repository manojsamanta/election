defmodule Election.Voting.Voter do
  use Ecto.Schema
  import Ecto.Changeset

  schema "voters" do
    field :first, :string
    field :middle, :string
    field :last, :string
    field :street, :string
    field :city, :string
    field :county, :string
    field :precinct, :string
    field :v_2014, :boolean, default: false
    field :v_2016, :boolean, default: false
    field :v_2018, :boolean, default: false
    field :v_2020, :boolean, default: false
  end
end
