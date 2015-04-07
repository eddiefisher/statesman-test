class PaymentStateMachine
  include Statesman::Machine

  # Define all possible states
  state :pending, initial: :true
  state :confirmed
  state :paid
  state :cancelled

  # Define transition rules
  transition from: :pending, to: [:confirmed, :cancelled]
  transition from: :confirmed, to: :paid

  # guard_transition(to: :confirmed) do |payment|
  #   Rails.logger.info '=============== guard'
  #   true
  # end

  # before_transition(to: :confirmed) do |payment, transition|
  #   Rails.logger.info '=============== before'
  #   # Rails.logger.info transition.inspect
  #   # payment.state = transition.to_state
  #   # payment.update_attributes(count: "#{(payment.count.to_i + 1).to_s}")
  # end

  # after_transition(to: :confirmed) do |payment, transition|
  #   Rails.logger.info '=============== after'
  #   # payment.state = transition.to_state
  #   # payment.update_attributes(count: "#{(payment.count.to_i + 1).to_s}")
  # end
end
