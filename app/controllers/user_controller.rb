class UserController < RestController

  def register
    render json: User.register(@body["firebase_id"],@body["name"])
  end

  def get
    user = User.find_by_firebase_id(params[:id])

    if user.nil?
      render status: :not_found
    else
      render json: user
    end

  end

  def renew
    user = User.find_by_firebase_id(params[:id])
    render json: user.renew_subscription
  end

end
