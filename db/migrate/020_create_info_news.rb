class CreateInfoNews < ActiveRecord::Migration
  def self.up
    create_table :info_news do |t|
      t.column :titulo, :string
      t.column :descripcion, :string
      t.column :url_noticia, :string
      t.column :categoria, :string
      t.column :fecha, :date
      t.column :mostrar, :boolean
    end
    add_index :info_news, :fecha 
  end

  def self.down
    drop_table :info_news
  end
end
