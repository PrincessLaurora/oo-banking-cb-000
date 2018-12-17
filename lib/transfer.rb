class Transfer

  attr_accessor :sender, :receiver, :amount, :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end

  def valid?
    sender.valid? && receiver.valid?
  end

  def execute_transaction
    if !valid?
    @status = "rejected"
    "Transaction rejected. Please check your account balance."
    else
    @sender.balance -= amount
    @receiver.balance += amount
    @status = "complete"
    end
  end

end
