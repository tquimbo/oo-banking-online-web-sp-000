require 'pry'
class Transfer

  attr_accessor :transfer, :sender, :receiver, :status, :amount

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = 'pending'
  end

  def valid?
    @sender.valid? && @receiver.valid?
  end

  def execute_transaction
     if valid? && @status = "pending"
        @sender.balance -= @amount
        @receiver.balance += @amount
        @status = 'complete'
      elsif !valid?
      @status = 'rejected'
      return "Transaction rejected. Please check your account balance."
     end
   end

  def reverse_transfer
    if @status == 'complete'
      @sender.deposit += @amount
      @receiver.deposit -= @amount
      @status == 'reversed'
    end
  end

end
