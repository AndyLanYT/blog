# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def guest_can
    # can :read, [Post, Comment]
    can :read, Post
  end
  
  def user_can(user_id)
    # can :create, [Post, Comment]
    # can [:update, :destroy], [Post, Comment], user_id: user_id
    # can :read, [Post, Comment]
    # can :create, Post
    can [:update, :destroy], Post, user_id: user_id
    can :read, :all
    # can :manage, Post, user_id: user_id
  end

  def admin_can
    can :manage, :all
  end

  def initialize(user)
    user ||= User.new

    user_can(user.id) if user.user_role?
    admin_can if user.admin?
  end
end
