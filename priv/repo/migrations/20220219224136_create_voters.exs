defmodule Election.Repo.Migrations.CreateVoters do
  use Ecto.Migration

  def change do
    create table(:voters) do
      add :first, :string
      add :middle, :string
      add :last, :string
      add :street, :string
      add :city, :string
      add :county, :string
      add :precinct, :string
      add :zip, :integer
      add :age, :integer
      add :v_2014, :boolean, default: false, null: false
      add :v_2016, :boolean, default: false, null: false
      add :v_2018, :boolean, default: false, null: false
      add :v_2020, :boolean, default: false, null: false
    end
  end
end
