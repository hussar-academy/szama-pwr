class V1::UserRepresenter
  def initialize(user)
    @user = user
  end

  def basic
    {
      id: @user.id,
      email: @user.email,
      name: @user.first_name,
      balance: @user.balance,
    }
  end
end
