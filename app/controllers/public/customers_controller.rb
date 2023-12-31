class Public::CustomersController < ApplicationController
  def show
    @customer = current_customer
  end

  def edit
    @customer = current_customer
  end

  def check
  end

  def update
    @customer = current_customer
    if @customer.update(customer_params)
      redirect_to root_path
    else
      render mypage_path
    end
  end

  def withdraw
    @customer = current_customer
    @customer.is_deleted = true
    if @customer.save
      sign_out(@customer)
      redirect_to root_path
    end
  end

    private

  def customer_params
    params.require(:customer).permit(:last_name,:first_name,:last_name_kana,:first_name_kana,:email,:postal_code,:address,:telephone_number)
  end
end
