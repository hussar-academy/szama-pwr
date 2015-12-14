class V1::PaymentRepresenter
  def initialize(payment)
    @payment = payment
  end

  def basic
    {
      id: @payment.id,
      creator_id: @payment.creator_id,
      balance_changes: @payment.balance_changes.map do |bc|
        {
          change: bc.change,
          user_id: bc.user_id,
        }
      end
    }
  end
end
