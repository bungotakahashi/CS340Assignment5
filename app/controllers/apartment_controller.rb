class ApartmentController < ApplicationController
  before_filter :authenticate_user!
  def room_new
    @apartment=ApartmentDatum.find(params[:id])

    @room=Room.new
  end
  
  def room_create
    @room=Room.new(room_params)
    @apartment=ApartmentDatum.find(@room.apartment_id)
    if params[:room][:layout].present?
      @room.layout = params[:room][:layout].read 
      @room.image_type = params[:room][:layout].content_type 
    end
    respond_to do |format|
        if @room.save
          format.html {flash[:notice] =redirect_to action: "index", :id=> @room.apartment_id}
        else
           format.html {render :action => "room_new"}
        end
    end
  end

  def room_update
  end

  def room_edit
  end

  def room_destroy
    @room=Room.find(params[:id])
    apartid=@room.apartment_id
    @room.destroy
    redirect_to action: "index", :id=> apartid
  end

  def room_show
  end
  def room_layout
    @room=Room.find(params[:id])
  end
  def layout_get_image
    @room = Room.find(params[:id])
    #send_data(@room.layout, :disposition => "inline", :type => "image/png")
    send_data(@room.layout, type: @room.image_type, disposition: :inline)
  end
  def index
    @apartment=ApartmentDatum.find(params[:id])
    @room=Room.where(apartment_id: @apartment.id).all


  end


  def resident
    @apartment=ApartmentDatum.find(params[:id])
    @resident=Resident.where(apartment_id: @apartment.id).all
  end
  def resident_new
    @apartment=ApartmentDatum.find(params[:id])
    @resident=Resident.new
  end
  def resident_create
    flag=0  
    @resident=Resident.new(resident_params)
    @apartment=ApartmentDatum.find(@resident.apartment_id)
    @live=Live.new(id: [params[:resident][:room_id], ssn: @resident.ssn], ssn: @resident.ssn, room_id: params[:resident][:room_id])
    if Room.where(:id => @live.id).present? 
      @room = Room.find(params[:resident][:room_id])
      if @room.live.present?
        flash.now[:room_id] = "The room you entered is taken"
        flag=1
      end
    else
      flash.now[:room_id] = "The room you entered does not exist"
      flag=1
    end

    if params[:resident][:document].present?
      @resident.document = params[:resident][:document].read 
      @resident.image_type = params[:resident][:document].content_type 
    else
      flag=1
      flash.now[:document] = "please upload document"
    end
    respond_to do |format|
        if flag==0 && @resident.save && @live.save
          room=Room.find(params[:resident][:room_id])
          room.save
          format.html {flash[:notice] = redirect_to action: "resident", :id=> @resident.apartment_id}
        else
          format.html {render :action => "resident_new"}
        end
    end
  end
  def resident_destroy
    @resident=Resident.find_by_ssn(params[:ssn])
    apartid=@resident.apartment_id
    num=@resident.ssn
    if @resident.destroy
      Live.delete_all(:ssn => num)
    end

    redirect_to action: "resident", :id=> apartid
  end
  def resident_document
    @resident=Resident.find_by_ssn(params[:ssn])
  end
  def resident_get_image
    @resident = Resident.find_by_ssn(params[:ssn])
    #send_data(@room.layout, :disposition => "inline", :type => "image/png")
    send_data(@resident.document, type: @resident.image_type, disposition: :inline)
  end

    def parking
    @apartment=ApartmentDatum.find(params[:id])
    @parking=ParkingLot.where(apartment_id: @apartment.id).all
  end
  def parking_new
    @apartment=ApartmentDatum.find(params[:id])
    @parking=ParkingLot.new
  end
  def parking_create
    flag=0
    @parking=ParkingLot.new(parking_params)
    @apartment=ApartmentDatum.find(@parking.apartment_id)
    if params[:parking_lot][:ssn].present?
      if @resident=Resident.find_by_ssn(params[:parking_lot][:ssn]).blank?
        flash.now[:renter] = "There is not a resident with the SSN in this apartment."
        flag=1
      end
    end
    respond_to do |format|
        if flag==0 && @parking.save 
          format.html {flash[:notice] = redirect_to action: "parking", :id=> @parking.apartment_id}
        else
          format.html {render :action => "parking_new"}
        end
    end
  end
  def parking_edit
    @apartment=ApartmentDatum.find(params[:apartment_id])
    @parking=ParkingLot.find(params[:id])
  end
  def parking_update
    flag=0
    @parking=ParkingLot.find(params[:parking_lot][:id])
    @apartment=ApartmentDatum.find(params[:parking_lot][:apartment_id])
    if params[:parking_lot][:ssn].present?
      if @resident=Resident.find_by_ssn(params[:parking_lot][:ssn]).blank?
        flash.now[:renter] = "There is not a resident with the SSN in this apartment."
        flag=1
      end
    end
    respond_to do |format|
        if flag==0 && @parking.update(parking_params) 
          format.html {flash[:notice] = redirect_to action: "parking", :id=> @parking.apartment_id}
        else
          format.html {render :action => "parking_edit"}
        end
    end
  end
  def parking_destroy
    @parking=ParkingLot.find(params[:id])
    apartid=@parking.apartment_id
    @parking.destroy
    redirect_to action: "parking", :id=> apartid
  end
private
    def room_params
      params.require(:room).permit(:apartment_id, :layout, :image_type, :rent)
    end
    def resident_params
      params.require(:resident).permit(:apartment_id, :document, :image_type, :ssn, :room_id)
    end
    def parking_params
      params.require(:parking_lot).permit(:apartment_id, :ssn)
    end
end
