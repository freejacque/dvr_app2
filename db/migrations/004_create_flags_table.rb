Sequel.migration do
# what we want to do
  change do
    create_table(:flags) do
      primary_key :id
      String :name, :size => 127, :null => false
    end
  end

end
