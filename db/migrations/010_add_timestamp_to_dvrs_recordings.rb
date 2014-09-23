Sequel.migration do
# what we want to do
  change do
    alter_table(:dvrs_recordings) do
    add_column :time_stamp, DateTime
    end
  end

end
