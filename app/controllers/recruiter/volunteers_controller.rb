class Recruiter::VolunteersController < ApplicationController
  before_action :move_to_signed_in, except: [:index]

  def new
    @volunteer=Volunteer.new
    @volunteer.images.build
  end

  def create
    @volunteer=Volunteer.new(volunteer_params)
    @volunteer.recruiter_id = current_recruiter.id
    if @volunteer.save!
      params[:images_attributes][:"0"][:image].each do |image|
        Image.create(volunteer_id: @volunteer.id, image: image)
      end
      @room = Room.find_by(volunteer_id: params[:id])
      redirect_to root_path
    else
      render 'new'
    end
  end

  def index
    @volunteer = Volunteer.all
    
  end

  def show
    @volunteer = Volunteer.find(params[:id])
    @room = @volunteer.get_room
    @message = Message.new # Message.newで@messageのインスタンスを作成してformに値を渡す。
    @messages = Message.where(room_id: @room.id) # Messsage.where(room_id: @room.id)でメッセージを取得。
  end

  def edit
    @volunteer = Volunteer.find(params[:id])
  end

  def update
    @volunteer = Volunteer.find(params[:id])
    @volunteer.recruiter_id = current_recruiter.id
    if @volunteer.update(volunteer_params)
      flash[:notice] = "更新しました"
      redirect_to recruiter_volunteers_path
    else
      flash[:notice] = "更新が失敗しています"
      render 'edit'
    end

  end

  def destroy
    volunteer = Volunteer.find(params[:id])
    volunteer.recruiter_id = current_recruiter.id
    volunteer.destroy
    flash[:notice] = "削除しました"
    redirect_to recruiter_volunteers_path
  end
  

  private
  def volunteer_params
    params.require(:volunteer).permit(
      :name,
      :a_litle_explanation,
      :explanation,
      :place,
      :time,
      :people,
      :merit,
      :necessary_item,
      :important_point,
      :comment,
      :limit,
      :genre,
      :recruiter_id
      )
  end
  
  def move_to_signed_in
    unless customer_signed_in? || recruiter_signed_in?
      #サインインしていないユーザーはログインページが表示される
      redirect_to  new_customer_registration_path
    end
  end
end
