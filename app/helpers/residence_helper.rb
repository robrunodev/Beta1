# encoding: UTF-8
module ResidenceHelper
	def residence_status
		[
			['Selecione',''],
			['Venda','3'],
			#['Compra','1'],
			['Locação','2']
		]
	end

	def residence_type
		[
			['Selecione', ''],
			['Residencial','1'],
			['Comercial','2']
		]
	end
	
	def self.status_name
        {
          "3" => "Venda",
       #   "1" => "Compra",
          "2" => "Locação"
        }
    end
    
    def self.type_name
        {
          "1" => "Residencial",
          "2" => "Comercial"
        }
    end
end
