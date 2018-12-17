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
    if valid? && @sender.balance > amount && self.status == "pending"
    @sender.balance -= amount
    @receiver.balance += amount
    @status = "complete"
    else
    self.status = "rejected"
    "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if valid? && @receiver.balance > amount && self.status == "complete"
      @receiver.balance -= amount
      @sender.balance += amount
      @status = "reversed"
    else
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end      
end
