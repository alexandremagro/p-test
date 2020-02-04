require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'must have a name, cpf and email' do
    user = User.new
    user.valid?

    assert_includes user.errors[:name], "can't be blank"
    assert_includes user.errors[:cpf], "can't be blank"
    assert_includes user.errors[:email], "can't be blank"
  end

  test 'must have an unique CPF' do
    user = User.new(cpf: users(:luke).cpf)
    user.valid?

    assert_includes user.errors[:cpf], 'has already been taken'
  end
end
