Sequel.migration do
# what we want to do
  change do
    create_table(:dvrs_viewers) do
      primary_key :id
      foreign_key :dvr_id, :dvrs, :null => false, :key => [:id]
      foreign_key :viewer_id, :viewers, :null => false, :key => [:id]
    end
  end

end
