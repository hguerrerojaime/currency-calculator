class CalculatorController < RestController

  require 'rest-client'

  def calculate_rate

    firebase_id = @body["firebase_id"]

    user = User.find_by_firebase_id firebase_id

    account_expired = user.expires_at <= Time.now

    if account_expired
      render status: :forbidden
    else
      url = "http://api.fixer.io/latest?base=USD&symbols=MXN"
      response = JSON.parse(RestClient.get(url))

      rate = response["rates"]["MXN"].to_f
      source_ammount = @body["ammount"].to_f
      target_ammount = source_ammount / rate

      render json: target_ammount

    end
  end



end
