class AddLinksToBrands < ActiveRecord::Migration[5.0]
  def change
    create_table(:links) do |t|
      t.column(:link, :string)
      t.column(:brand_id, :integer)

      t.timestamps()
    end
  end
end
