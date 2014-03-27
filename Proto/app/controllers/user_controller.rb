class UserController < ApplicationController
	def create
		User.create(
			:name => params[:name],
			:login => params[:login],
			:password => params[:password],
			:adm => params[:adm] ||= 0,
			:cpf => params[:cpf]
		)
		redirect_to :back
	end

	def index

	end

	def login
		user = User.where(login: params[:user_name])
		if user != []
			if user[0].password == params[:password]
				session[:user_id] = user[0].id
				session[:user_login] = user[0].login
				response = "/user/#{user[0].id}"
			else
				response = "/main?password=1"
			end
			
		else
			response = "/main?erruser=1"
		end
			

		redirect_to response
	end

	def logout
		session.delete :user_id
		session.delete :user_login
		redirect_to "/main"
	end

	def show
		@user = User.find(params[:id])

	end
end
