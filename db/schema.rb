# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 32) do

  create_table "comparacion_sueldos", :force => true do |t|
    t.decimal "salario_bruto_actual", :precision => 10, :scale => 2, :default => 0.0
    t.decimal "salario_bruto_futuro", :precision => 10, :scale => 2, :default => 0.0
    t.decimal "ticket_actual",        :precision => 6,  :scale => 2, :default => 0.0
    t.decimal "ticket_futuro",        :precision => 6,  :scale => 2, :default => 0.0
    t.decimal "bonus_actual",         :precision => 10, :scale => 2, :default => 0.0
    t.decimal "bonus_futuro",         :precision => 10, :scale => 2, :default => 0.0
    t.integer "cantidad_hijos",                                      :default => 0
    t.integer "otras_cargas",                                        :default => 0
    t.boolean "deduce_conyuge",                                      :default => false
  end

  create_table "info_news", :force => true do |t|
    t.string  "titulo"
    t.text    "descripcion"
    t.text    "url_noticia"
    t.string  "categoria"
    t.date    "fecha"
    t.boolean "mostrar"
  end

  add_index "info_news", ["fecha"], :name => "index_info_news_on_fecha"

  create_table "monthly_salaries", :force => true do |t|
    t.string  "month"
    t.decimal "gross_salary", :precision => 10, :scale => 2, :default => 0.0
    t.decimal "ticket",       :precision => 6,  :scale => 2, :default => 0.0
    t.decimal "bonus",        :precision => 10, :scale => 2, :default => 0.0
    t.integer "salary_id",                                                    :null => false
  end

  create_table "positions", :force => true do |t|
    t.string "name"
    t.string "description"
  end

  create_table "reduction_taxes", :force => true do |t|
    t.string  "month"
    t.decimal "from_salary",          :precision => 12, :scale => 2, :default => 0.0
    t.decimal "to_salary",            :precision => 12, :scale => 2, :default => 0.0
    t.decimal "reduction_percentage", :precision => 8,  :scale => 2, :default => 0.0
  end

  create_table "revenue_parameter_details", :force => true do |t|
    t.string  "month"
    t.decimal "value",                :precision => 10, :scale => 2, :default => 0.0
    t.integer "revenue_parameter_id",                                                 :null => false
  end

  create_table "revenue_parameters", :force => true do |t|
    t.integer "year"
    t.string  "name"
    t.decimal "value",      :precision => 10, :scale => 2, :default => 0.0
    t.boolean "has_detail",                                :default => false
  end

  create_table "revenue_taxes", :force => true do |t|
    t.string  "month"
    t.decimal "from_salary", :precision => 12, :scale => 2, :default => 0.0
    t.decimal "to_salary",   :precision => 12, :scale => 2, :default => 0.0
    t.decimal "tax_amount",  :precision => 12, :scale => 2, :default => 0.0
    t.decimal "tax_rate",    :precision => 8,  :scale => 2, :default => 0.0
  end

  create_table "salaries", :force => true do |t|
    t.integer "cantidad_hijos", :default => 0
    t.integer "otras_cargas",   :default => 0
    t.boolean "deduce_conyuge", :default => false
    t.integer "anio_fiscal",    :default => 2008
    t.string  "rubro_empresa"
    t.string  "cargo"
    t.integer "experiencia",    :default => 0
    t.date    "fecha_calculo"
  end

  create_table "schema_info", :id => false, :force => true do |t|
    t.integer "version"
  end

  create_table "sessions", :force => true do |t|
    t.string   "session_id"
    t.text     "data"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "special_discounts", :force => true do |t|
    t.string  "month"
    t.decimal "seguro_retiro",            :precision => 10, :scale => 2, :default => 0.0
    t.decimal "seguro_vida",              :precision => 10, :scale => 2, :default => 0.0
    t.decimal "cuota_medica",             :precision => 10, :scale => 2, :default => 0.0
    t.decimal "donacion",                 :precision => 10, :scale => 2, :default => 0.0
    t.decimal "honorario_medico",         :precision => 10, :scale => 2, :default => 0.0
    t.decimal "intereses_hipotecarios",   :precision => 10, :scale => 2, :default => 0.0
    t.decimal "personal_domestico",       :precision => 10, :scale => 2, :default => 0.0
    t.decimal "aportes_voluntarios_afjp", :precision => 10, :scale => 2, :default => 0.0
    t.integer "salary_id"
  end

end
