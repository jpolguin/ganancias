desc "Export data from tables in the current environment db to fixtures (YML format). "
namespace :db do
  namespace :fixtures do
      task :export => :environment do   
	
        ActiveRecord::Base.establish_connection(RAILS_ENV.to_sym)
        ## set directory to export
        file_base_path = File.join(RAILS_ROOT, 'doc') ## File.join(RAILS_ROOT, 'test', 'fixtures', 'export')
	
          puts "exporting to: " + file_base_path
        puts "the RAILS_ENV is " + RAILS_ENV
	
        if ENV["TABLE"] != nil
            table_names = ENV["TABLE"].to_s.split(",")
        else
            table_names = ActiveRecord::Base.connection.tables
        end
	
        table_names.each do |table_name|
        if table_name.downcase != 'schema_info'
                puts  "\n Exporting "  + table_name + "... "
                yml_file = "#{file_base_path}/#{table_name}.yml"
                i = "000000"
                File.delete(yml_file) if File.exist?(yml_file)
                File.open(yml_file, 'w' ) do |file_object|
                    begin
                        sql = "SELECT * FROM #{table_name}"
                        data = ActiveRecord::Base.connection.select_all(sql)
                        file_object.write data.inject({}) { |hash, record|
                        hash["#{table_name}_#{i.succ!}"] = record
                        hash
                        }.to_yaml
                    puts    " Status: Completed"
                    rescue
                        puts " Status: Aborted - Table #{table_name} does not exist"
                    end
                end
            end
        end
        puts "\nTask completed!"
	
    end
  end
end