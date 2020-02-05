class Order < ApplicationRecord
  belongs_to :user, validate: true

  validates :phone_model, presence: true
  validates :phone_imei, presence: true
  validates :installment_amount, presence: true
  validates :number_of_installments, presence: true

  accepts_nested_attributes_for :user

  delegate :name, :cpf, :email, to: :user, prefix: true
end
