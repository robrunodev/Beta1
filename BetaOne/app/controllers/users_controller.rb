class UsersController < ApplicationController

	#post /users
	def create
		new_user = User.new(
			:name     => params[:name],
			:login    => params[:login],
			:password => params[:password],
			:adm      => params[:adm] ||= 0,
			:cpf      => params[:cpf]
		)

		if new_user.save
			status = "Registro criado com sucesso!"
		else
			status =  new_user.errors.full_messages
		end

		render js: "$('#status')[0].innerHTML='<center>"+status.upcase+"<center>'"
	end

	#get /users/
	def index

	end

	def new
		@user = User.new
	end

	#get /users/:id
	def show
		@user = User.find(session[:user_id])
	end
end