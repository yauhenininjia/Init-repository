class CollagesController < ApplicationController
	skip_before_filter :verify_authenticity_token
	
	def index
	  redirect_to new_collage_path
	end
	
	def new
	  #@collage = Collage.new
	end
	
	def create
	  
	  @decode = ActiveSupport::JSON.decode(params[:collage])
	  #puts @decode['x']
	  @collage = Collage.new
	  @collage.save
	  @photo = @collage.photos.create
	  @photo.src = params[:src]
	  @photo.x = @decode['x']
	  @photo.y = @decode['y']
	  @photo.width = @decode['width']
	  @photo.height = @decode['height']
	  @photo.degree = @decode['degrees']
	  @photo.z = @decode['z']
	  @photo.sepia = @decode['sepia']
	  @photo.desaturate = @decode['desaturation']
	  @photo.contrast = @decode['contrast']
	  @photo.save
	  @collage.save
	  
	  respond_to do |format|
		format.json{ render json: @photo }
	  end
	  #redirect_to new_collage_path
	end
end
