class ActualizarJubilacionCargosRubros < ActiveRecord::Migration
  def self.up
    parametro_tope_jubilacion = RevenueParameter.find(:all, :conditions => "name = 'SUELDO_TOPE_PARA_JUBILACION' ")
    RevenueParameterDetail.update_all "value=9351.27", "revenue_parameter_id=#{parametro_tope_jubilacion[0].id} " 
    
    SpecialDiscount.delete_all true 
    MonthlySalary.delete_all true 
    Salary.delete_all true 
    
    Salary.create(:cantidad_hijos => 0, :otras_cargas => 0 , :anio_fiscal => 2010, :cargo=>"Analista Programador Java", :rubro_empresa=>"Salud", :experiencia=>0, :fecha_calculo=> "06/06/2010")
    Salary.create(:cantidad_hijos => 0, :otras_cargas => 0 , :anio_fiscal => 2010, :cargo=>"Analista Programador C#", :rubro_empresa=>"Alimentos", :experiencia=>0, :fecha_calculo=> "06/06/2010")
    Salary.create(:cantidad_hijos => 0, :otras_cargas => 0 , :anio_fiscal => 2010, :cargo=>"Analista Programador VB.NET", :rubro_empresa=>"Sistemas y Tecnologia", :experiencia=>0, :fecha_calculo=> "06/06/2010")
    Salary.create(:cantidad_hijos => 0, :otras_cargas => 0 , :anio_fiscal => 2010, :cargo=>"Analista Programador PHP", :rubro_empresa=>"Bancos y Financieras", :experiencia=>0, :fecha_calculo=> "06/06/2010")
    Salary.create(:cantidad_hijos => 0, :otras_cargas => 0 , :anio_fiscal => 2010, :cargo=>"Analista Programador .NET", :rubro_empresa=>"Energia y Petroleo", :experiencia=>0, :fecha_calculo=> "06/06/2010")
    Salary.create(:cantidad_hijos => 0, :otras_cargas => 0 , :anio_fiscal => 2010, :cargo=>"Analista Programador Ruby/Python/Perl", :rubro_empresa=>"Transporte", :experiencia=>0, :fecha_calculo=> "06/06/2010")
    Salary.create(:cantidad_hijos => 0, :otras_cargas => 0 , :anio_fiscal => 2010, :cargo=>"Administrador Unix/Linux", :rubro_empresa=>"Seguros", :experiencia=>0, :fecha_calculo=> "06/06/2010")
    Salary.create(:cantidad_hijos => 0, :otras_cargas => 0 , :anio_fiscal => 2010, :cargo=>"Administrador Windows", :rubro_empresa=>"Comercializacion", :experiencia=>0, :fecha_calculo=> "06/06/2010")
    Salary.create(:cantidad_hijos => 0, :otras_cargas => 0 , :anio_fiscal => 2010, :cargo=>"Administrador de base de datos", :rubro_empresa=>"Retailing y Supermercados", :experiencia=>0, :fecha_calculo=> "06/06/2010")
    Salary.create(:cantidad_hijos => 0, :otras_cargas => 0 , :anio_fiscal => 2010, :cargo=>"Administrativo Contable", :rubro_empresa=>"Marketing/Publicidad", :experiencia=>0, :fecha_calculo=> "06/06/2010")
    Salary.create(:cantidad_hijos => 0, :otras_cargas => 0 , :anio_fiscal => 2010, :cargo=>"Empleado Administrativo", :rubro_empresa=>"Turismo y Hoteleria", :experiencia=>0, :fecha_calculo=> "06/06/2010")
    Salary.create(:cantidad_hijos => 0, :otras_cargas => 0 , :anio_fiscal => 2010, :cargo=>"Analista de impuestos", :rubro_empresa=>"Estudigo Contable", :experiencia=>0, :fecha_calculo=> "06/06/2010")
    Salary.create(:cantidad_hijos => 0, :otras_cargas => 0 , :anio_fiscal => 2010, :cargo=>"Analista de Costos", :rubro_empresa=>"Estudio Juridico/Abogados", :experiencia=>0, :fecha_calculo=> "06/06/2010")
    Salary.create(:cantidad_hijos => 0, :otras_cargas => 0 , :anio_fiscal => 2010, :cargo=>"Comercial/Vendedor", :rubro_empresa=>"Estudio Arquitectura", :experiencia=>0, :fecha_calculo=> "06/06/2010")
    Salary.create(:cantidad_hijos => 0, :otras_cargas => 0 , :anio_fiscal => 2010, :cargo=>"Contador", :rubro_empresa=>"Consultoria Contable/Impositiva/Legal", :experiencia=>0, :fecha_calculo=> "06/06/2010")
    Salary.create(:cantidad_hijos => 0, :otras_cargas => 0 , :anio_fiscal => 2010, :cargo=>"Arquitecto", :rubro_empresa=>"Industria", :experiencia=>0, :fecha_calculo=> "06/06/2010")
    Salary.create(:cantidad_hijos => 0, :otras_cargas => 0 , :anio_fiscal => 2010, :cargo=>"Gerente General", :rubro_empresa=>"Laboratorio Medicinal", :experiencia=>0, :fecha_calculo=> "06/06/2010")
    Salary.create(:cantidad_hijos => 0, :otras_cargas => 0 , :anio_fiscal => 2010, :cargo=>"Gerente de Sistemas", :rubro_empresa=>"Agro", :experiencia=>0, :fecha_calculo=> "06/06/2010")
    Salary.create(:cantidad_hijos => 0, :otras_cargas => 0 , :anio_fiscal => 2010, :cargo=>"Lider de proyecto", :rubro_empresa=>"TV/Publicidad/Medios", :experiencia=>0, :fecha_calculo=> "06/06/2010")
    Salary.create(:cantidad_hijos => 0, :otras_cargas => 0 , :anio_fiscal => 2010, :cargo=>"Gerente de proyecto", :rubro_empresa=>"Textil", :experiencia=>0, :fecha_calculo=> "06/06/2010")
    Salary.create(:cantidad_hijos => 0, :otras_cargas => 0 , :anio_fiscal => 2010, :cargo=>"Analista Funcional", :rubro_empresa=>"Calzado", :experiencia=>0, :fecha_calculo=> "06/06/2010")
    Salary.create(:cantidad_hijos => 0, :otras_cargas => 0 , :anio_fiscal => 2010, :cargo=>"Analista Funcional SAP", :rubro_empresa=>"Automotriz", :experiencia=>0, :fecha_calculo=> "06/06/2010")
    Salary.create(:cantidad_hijos => 0, :otras_cargas => 0 , :anio_fiscal => 2010, :cargo=>"Programador SAP", :rubro_empresa=>"Comercio Exterior", :experiencia=>0, :fecha_calculo=> "06/06/2010")
    Salary.create(:cantidad_hijos => 0, :otras_cargas => 0 , :anio_fiscal => 2010, :cargo=>"Analista de Negocios", :rubro_empresa=>"Construccion", :experiencia=>0, :fecha_calculo=> "06/06/2010")
    Salary.create(:cantidad_hijos => 0, :otras_cargas => 0 , :anio_fiscal => 2010, :cargo=>"Bioquimico", :rubro_empresa=>"Gastronomia y Restaurants", :experiencia=>0, :fecha_calculo=> "06/06/2010")
    Salary.create(:cantidad_hijos => 0, :otras_cargas => 0 , :anio_fiscal => 2010, :cargo=>"Camarero", :rubro_empresa=>"Farmacia", :experiencia=>0, :fecha_calculo=> "06/06/2010")
    Salary.create(:cantidad_hijos => 0, :otras_cargas => 0 , :anio_fiscal => 2010, :cargo=>"Cocinero", :rubro_empresa=>"RRHH", :experiencia=>0, :fecha_calculo=> "06/06/2010")
    Salary.create(:cantidad_hijos => 0, :otras_cargas => 0 , :anio_fiscal => 2010, :cargo=>"Analista de Recursos Humanos (RRHH)", :rubro_empresa=>"Logistica", :experiencia=>0, :fecha_calculo=> "06/06/2010")
    Salary.create(:cantidad_hijos => 0, :otras_cargas => 0 , :anio_fiscal => 2010, :cargo=>"Gerente de ventas", :rubro_empresa=>"Transporte de carga", :experiencia=>0, :fecha_calculo=> "06/06/2010")
    Salary.create(:cantidad_hijos => 0, :otras_cargas => 0 , :anio_fiscal => 2010, :cargo=>"Jefe de ventas", :rubro_empresa=>"Telecomunicaciones", :experiencia=>0, :fecha_calculo=> "06/06/2010")
    Salary.create(:cantidad_hijos => 0, :otras_cargas => 0 , :anio_fiscal => 2010, :cargo=>"Jefe de compras", :rubro_empresa=>"Seguridad", :experiencia=>0, :fecha_calculo=> "06/06/2010")
    Salary.create(:cantidad_hijos => 0, :otras_cargas => 0 , :anio_fiscal => 2010, :cargo=>"Recepcionista", :rubro_empresa=>"Metalurgia", :experiencia=>0, :fecha_calculo=> "06/06/2010")
    Salary.create(:cantidad_hijos => 0, :otras_cargas => 0 , :anio_fiscal => 2010, :cargo=>"Asistente Gerencial / secretaria", :rubro_empresa=>"Educación", :experiencia=>0, :fecha_calculo=> "06/06/2010")
    Salary.create(:cantidad_hijos => 0, :otras_cargas => 0 , :anio_fiscal => 2010, :cargo=>"asistente comercial", :rubro_empresa=>"Telemarketing", :experiencia=>0, :fecha_calculo=> "06/06/2010")
    Salary.create(:cantidad_hijos => 0, :otras_cargas => 0 , :anio_fiscal => 2010, :cargo=>"Operador / Data Entry", :rubro_empresa=>"Servicios generales", :experiencia=>0, :fecha_calculo=> "06/06/2010")
    Salary.create(:cantidad_hijos => 0, :otras_cargas => 0 , :anio_fiscal => 2010, :cargo=>"Asistente de mesa de ayuda / office", :rubro_empresa=>"Transporte de cargas", :experiencia=>0, :fecha_calculo=> "06/06/2010")
    Salary.create(:cantidad_hijos => 0, :otras_cargas => 0 , :anio_fiscal => 2010, :cargo=>"Cajero", :rubro_empresa=>"Transporte de cargas", :experiencia=>0, :fecha_calculo=> "06/06/2010")
    Salary.create(:cantidad_hijos => 0, :otras_cargas => 0 , :anio_fiscal => 2010, :cargo=>"Consultor en procesos", :rubro_empresa=>"Grafica", :experiencia=>0, :fecha_calculo=> "06/06/2010")
    Salary.create(:cantidad_hijos => 0, :otras_cargas => 0 , :anio_fiscal => 2010, :cargo=>"Arquitecto de Software / Sistemas", :rubro_empresa=>"", :experiencia=>0, :fecha_calculo=> "06/06/2010")
    Salary.create(:cantidad_hijos => 0, :otras_cargas => 0 , :anio_fiscal => 2010, :cargo=>"Consultor en Seguridad informatica", :rubro_empresa=>"", :experiencia=>0, :fecha_calculo=> "06/06/2010")
    Salary.create(:cantidad_hijos => 0, :otras_cargas => 0 , :anio_fiscal => 2010, :cargo=>"Consultor en Redes / infraestructura y tecnologia", :rubro_empresa=>"", :experiencia=>0, :fecha_calculo=> "06/06/2010")
    Salary.create(:cantidad_hijos => 0, :otras_cargas => 0 , :anio_fiscal => 2010, :cargo=>"Tester / Analista de testing", :rubro_empresa=>"", :experiencia=>0, :fecha_calculo=> "06/06/2010")
    Salary.create(:cantidad_hijos => 0, :otras_cargas => 0 , :anio_fiscal => 2010, :cargo=>"Director", :rubro_empresa=>"", :experiencia=>0, :fecha_calculo=> "06/06/2010")
    Salary.create(:cantidad_hijos => 0, :otras_cargas => 0 , :anio_fiscal => 2010, :cargo=>"Ingeniero en petroleo", :rubro_empresa=>"", :experiencia=>0, :fecha_calculo=> "06/06/2010")
    Salary.create(:cantidad_hijos => 0, :otras_cargas => 0 , :anio_fiscal => 2010, :cargo=>"Jefe administrativo", :rubro_empresa=>"", :experiencia=>0, :fecha_calculo=> "06/06/2010")
    Salary.create(:cantidad_hijos => 0, :otras_cargas => 0 , :anio_fiscal => 2010, :cargo=>"Gerente de Recursos Humanos (RRHH)", :rubro_empresa=>"", :experiencia=>0, :fecha_calculo=> "06/06/2010")
    Salary.create(:cantidad_hijos => 0, :otras_cargas => 0 , :anio_fiscal => 2010, :cargo=>"Gerente de Publicidad / Marketing", :rubro_empresa=>"", :experiencia=>0, :fecha_calculo=> "06/06/2010")
    Salary.create(:cantidad_hijos => 0, :otras_cargas => 0 , :anio_fiscal => 2010, :cargo=>"Diseñador WEB", :rubro_empresa=>"", :experiencia=>0, :fecha_calculo=> "06/06/2010")
    
    
  end

  def self.down
    
    parametro_tope_jubilacion = RevenueParameter.find(:all, :conditions => "name = 'SUELDO_TOPE_PARA_JUBILACION' ")
    RevenueParameterDetail.update_all "value=7800.00", "revenue_parameter_id=#{parametro_tope_jubilacion[0].id} " 
       
    SpecialDiscount.delete_all true 
    MonthlySalary.delete_all true 
    Salary.delete_all true 
  end
end
