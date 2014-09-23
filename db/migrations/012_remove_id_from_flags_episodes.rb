Sequel.migration do
# what we want to do
  change do
    alter_table(:flags_episodes) do
      drop_column :id
    end
  end
end
