# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def guest_can
    can :read, Post
  end
  
  def user_can(user_id)
    can :manage, Post, user_id: user_id
  end

  def admin_can
    can :manage, :all
  end

  def initialize(user)
    user ||= User.new

    guest_can
    user_can(user.id) if user.user_role?
    admin_can if user.admin?
  end
end
