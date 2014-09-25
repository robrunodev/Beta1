class ResidencesController < ApplicationController

	def create
		residence = Residence.new(residence_params[:residence])

		residence.create_residence_info(residence_params[:residence_info])
		
		
		if residence.valid?
		    #residence.client_id = Client.where(cpf: params[:cpf]).first.id
		    pos = residence.position
			residence.address = "#{pos[:lat]}|#{pos[:lng]}"
			residence.save
			status = "window.location = '/residences/#{residence.id}'"
		else
			status = %Q{ $(".alert-box").slideDown();}
		end

		render js: status
	end

	def index

		if params[:residence_type] != ""
			residences = Residence.where("address is not NULL")
			@residence_geo = []
			residences.map {|res| @residence_geo.push res.geo}
			@residence_geo
		end
	end

	def show
		@residence = Residence.find(params[:id])
	end

	def list

	end

	def new
		@residence = Residence.new
		@residence_info = ResidenceInfo.new
	end

	protected
	def residence_params
		params.permit(
			residence:[
				:status,
				:residence_type,
				:cep,
				:street,
				:neighbourhood,
				:city,
				:state,
				:number
			],
			residence_info:[
				:residence_code,
				:sell_value,
				:rent_value,
				:condominium_value,
				:iptu_value,
				:area_total,
				:scritura_definitiva,
				:escritura_alienada,
				:estritura_inventario,
				:qdt_dormitorio,
				:qtd_dormitorio,
				:qtd_suite,
				:iqtd_banheiro,
				:iqtd_garage
			]
		)
	end
end