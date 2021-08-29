class Recruiter::RecruitersController < ApplicationController
  before_action :authenticate_recruiter!

  def show
    @recruiter = Recruiter.find(current_recruiter.id)
    @volunteers = @recruiter.volunteers
  end

  def edit
    @recruiter = Recruiter.find(current_recruiter.id)
  end

  def update
    @recruiter = Recruiter.find(current_recruiter.id)
    if @recruiter.update(params_recruiter)
      flash[:notice] = "更新しました"
      redirect_to recruiter_recruiter_path(current_recruiter)
    else
      render 'edit'
    end
  end

  def destroy
  end

  def params_recruiter
    params.require(:recruiter).permit(:last_name,:first_name,:last_name_kana,:first_name_kana,:postal_number,:address,:phone_number,:image, images: [])
  end

end
