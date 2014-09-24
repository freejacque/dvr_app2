Sequel.migration do
# what we want to do
  change do
    alter_table(:viewers) do
    add_column :salt, String, :size => 64, :null => false
    end
  end

end
