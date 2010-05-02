class AddInitialPositions < ActiveRecord::Migration
  def self.up
    Position.delete_all   
    Position.create(:name=> "programador Java", 
                    :description => "Cargo de programador Tecnologia Java")
    
    Position.create(:name=> "programador .NET", 
                    :description => "Cargo de programador Tecnologia .NET")
                  

    Position.create(:name=> "Arquitecto", 
                    :description => "Arquitecto de tecnologia abierta")
                  
    Position.create(:name=> "Analista Funcional", 
                    :description => "Analista funcional de proyectos")

    
  end

  def self.down
    Position.delete_all
  end
end
