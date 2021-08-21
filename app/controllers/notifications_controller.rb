class NotificationsController < ApplicationController

  def index
    # recruiter = current_recruiter.id
    @notifications = Notification.where(visited_id: current_recruiter.id, checked: false)#自分への通知一覧を表示する
    # @customer = Notification.find_by(customer_id: params[:id])
  end

  def update
    notification=Notification.find(params[:id])
    if notification.update(checked: true)
      redirect_to action: :index
    end
  end

end
