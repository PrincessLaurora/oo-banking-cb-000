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
    @sender.balance -= amount
    @receiver.balance += amount
    @status = "complete"
    if !valid?
    @status = "rejected"
    "Transaction rejected. Please check your account balance."
    end
  end

end
