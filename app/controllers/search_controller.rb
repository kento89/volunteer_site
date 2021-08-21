class SearchController < ApplicationController
  
  # 検索メソッド
  def search
    if params[:name].present?
      @volunteer = Volunteer.where('name LIKE ?', "%#{params[:name]}%")
    else
      @volunteer = Volunteer.none
    end
  end
  

end
