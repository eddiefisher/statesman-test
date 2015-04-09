class Payment < ActiveRecord::Base
  include Statesman::Adapters::ActiveRecordQueries

  has_many :payment_transitions

  scope :with_transaction, -> { includes(:payment_transitions) }

  attr_accessor :state

  before_update :change_state

  def state_machine
    @state_machine ||= PaymentStateMachine.new(self, transition_class: PaymentTransition)
  end

  private

  def self.transition_class
    PaymentTransition
  end

  def self.initial_state
    :pending
  end

  def change_state
    return unless state
    state_machine.transition_to!(self.state.to_sym)
  end
end
