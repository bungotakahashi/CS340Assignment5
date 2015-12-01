class UsersController < ApplicationController
	before_filter :authenticate_user!
	def index
		@apartment=ApartmentDatum.where(owner_id: current_user.id).all
	end
	def new
		@apartment=ApartmentDatum.new
	end
	def create
		@apartment=ApartmentDatum.new(apartment_params)

		respond_to do |format|
			if @apartment.save
				format.html {flash[:notice] =redirect_to action: "index", notice: "New apartment was added successfully."}
			else
				format.html {render action: "new"}
			end
		end
	end
	def destroy
		@apartment=ApartmentDatum.find(params[:id])
		@apartment.destroy
		redirect_to action: "index"
		
	end
	def details
		@apartment=ApartmentDatum.find(params[:id])


	end
	def analysis
	end


private
	def apartment_params
		params.require(:apartment_datum).permit(:owner_id, :name, :address, :date_built, :cost, :comments)
	end
end
