require 'webpay'

class PaymentsController < ApplicationController
  def index
    @payments = Payment.all
  end

  def new
    @apply_service = ApplyService.find(params[:id])
    @payment = Payment.new(activity_service_id: @apply_service.activity_service_id, apply_service_id: params[:id])
  end

  def purchase
    webpay = WebPay.new(ENV['webpay_secret_key'])
    @payment = Payment.new(payment_params)
    customer = webpay.customer.create(card: params['webpay-token'])
    @payment.customer_id = customer.id
    # 顧客情報を使って支払い
    webpay.charge.create(
      amount: @payment.activity_service.amount,
      currency: 'jpy',
      customer: customer.id
    )

    respond_to do |format|
      if @payment.save
        format.html { redirect_to activity_services_path, notice: 'payment was successfully completed.' }
      else
        format.html { render :new }
      end
    end
  rescue WebPay::ErrorResponse::InvalidRequestError => e
    @payment.errors[:base] << e.message
    render :new
  rescue WebPay::ErrorResponse::CardError => e
    case e.data.error.caused_by
    when 'buyer'
      # カードエラーなど、購入者に原因がある
      # エラーメッセージをそのまま表示するのがわかりやすい
      @payment.errors[:base] << e.message
      render :new
    when 'insufficient'
      # 実装ミスに起因する
    when 'missing'
      # リクエスト対象のオブジェクトが存在しない
    when 'service'
      # WebPayに起因するエラー
    else
      # 未知のエラー
    end
  rescue WebPay::ApiError => e
    # APIからのレスポンスが受け取れない場合。接続エラーなど
  rescue

  end

  private
    def payment_params
      params.require(:payment).permit(:activity_service_id, :apply_service_id)
    end
end
