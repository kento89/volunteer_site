class NotificationsController < ApplicationController
  before_action :authenticate_recruiter!

  def index
    @notifications = Notification.where(visited_id: current_recruiter.id, checked: false)#自分への通知一覧を表示する
  end

  def update
    notification=Notification.find(params[:id])
    if notification.update(checked: true)
      redirect_to action: :index
    end
  end

end
