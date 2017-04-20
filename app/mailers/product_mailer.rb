class ProductMailer < ApplicationMailer
  def new_product_notify(product)
    @user = product.user
    @product = product
    mail(to: @product.user.email, subject: "created new product")
  end
end
