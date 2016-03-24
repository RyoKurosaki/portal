require 'webpay'

class PaymentsController < ApplicationController
  def new
    @payment = Payment.new
  end

  def purchase
    webpay = WebPay.new(ENV['webpay_secret_key'])

    # WebPay上での顧客の情報を作成
    customer = webpay.customer.create(card: params['webpay-token'])

    # 顧客情報を使って支払い
    webpay.charge.create(
      amount: 1_000_000,
      currency: 'jpy',
      customer: customer.id
    )
    @payment = Payment.new(payment_params)
    respond_to do |format|
      if @payment.save
        format.html { redirect_to categories_path, notice: 'payment was successfully created.' }
        format.json { render :show, status: :created, location: @payment }
      else
        format.json { render json: @payment.errors, status: :unprocessable_entity }
      end
    end

  rescue WebPay::ErrorResponse::CardError => e
    puts 'ERROR'
    # エラーハンドリング。発生する例外の種類がいくつか用意されているので、内容に応じて処理を書く
  end

  private
    def payment_params
      params.require(:payment).permit(:name, :email, :tel, :plan)
    end
end
