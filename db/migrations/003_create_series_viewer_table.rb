Sequel.migration do
# what we want to do
  change do
    create_table(:series_viewers) do
      primary_key :id
      foreign_key :viewer_id, :viewers, :null => false, :key => [:id]
      foreign_key :series_id, :series, :null => false, :key => [:id]
    end
  end

end
