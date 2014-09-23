Sequel.migration do
# what we want to do
  change do
    create_table(:genres_series) do
      primary_key :id
      foreign_key :genres_id, :genres, :null => false, :key => [:id]
      foreign_key :series_id, :series, :null => false, :key => [:id]
    end
  end

end
