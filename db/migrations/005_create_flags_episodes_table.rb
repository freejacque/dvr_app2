Sequel.migration do
# what we want to do
  change do
    create_table(:flags_episodes) do
      primary_key :id
      foreign_key :episode_id, :episodes, :null => false, :key => [:id]
      foreign_key :series_id, :series, :null => false, :key => [:id]
    end
  end

end
