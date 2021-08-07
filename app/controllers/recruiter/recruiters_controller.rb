class Recruiter::RecruitersController < ApplicationController
  
  def show
    @recruiter = Recruiter.find(current_recruiter.id)
  end
  
  def edit
    @recruiter = Recruiter.find(current_recruiter.id)
  end
  
  def update
    recruiter = Recruiter.find(current_recruiter.id)
    if recruiter.update(params_recruiter)
    redirect_to recruiter_recruiter_path(current_recruiter)
    else
      flash[:notice] = "入力内容をご確認ください"
      redirect_to request.referer
    end
  end
  
  def destroy
  end
  
  def params_recruiter
    params.require(:recruiter).permit(:last_name,:first_name,:last_name_kana,:first_name_kana,:postal_number,:address,:phone_number,:comment,:image)
  end
  
end
