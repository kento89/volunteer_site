class HomesController < ApplicationController
  def top
  end
  def about
  end
  
  def guest_sign_in
    customer = Customer.find_or_create_by!(email: "guest@example.com", last_name: "ゲスト", first_name: "太郎", last_name_kana: "ゲスト", first_name_kana: "タロウ", postal_number: "1234567", address: "三重県津市栄町", phone_number: "1234567890", experience: true, comment: "よろしくお願いいたします" ) do |customer|
      customer.password = SecureRandom.urlsafe_base64
      customer.image.attach(io: File.open(Rails.root.join("app/assets/images/no_image.jpg")), filename: "no_image.jpg")
      # user.confirmed_at = Time.now
      # 例えば name を入力必須としているならば， user.name = "ゲスト" なども必要
    end
    sign_in customer
    redirect_to root_path, notice: 'ゲストユーザーとしてログインしました。'
  end
end
