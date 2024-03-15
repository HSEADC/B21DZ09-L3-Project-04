# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)

    if user && user.admin == true
      can :manage, Task, :all
      can :manage, Answer, :all
      can :manage, Comment, :all
      can :manage, PolyComment, :all
    end

    if user && user.blocked == true
      cannot :create, Answer
      cannot :manage, Answer, user_id: user.id
      cannot :create, Comment
      cannot :manage, Comment, user_id: user.id
      cannot :create, PolyComment
      cannot :manage, PolyComment, user_id: user.id
      cannot :manage, Profile, user_id: user.id
    end

    can :read, Task
    can :read, Answer
    can :read, Comment
    can :read, PolyComment

    return unless user.present?

    can :toggle_like, Answer
    can :create, Answer
    can :manage, Answer, user_id: user.id

    can :create, PolyComment
    can :manage, PolyComment, user_id: user.id

    can :create, Comment
    can :manage, Comment, user_id: user.id

    can :read, Profile
    can :manage, Profile, user_id: user.id


    # if user
    #   can :manage, Answer, user_id: user.id
    #   can :new, Answer
    #   can :create, Answer
    #   can :manage, Comment, user_id: user.id
    #   can :new, Comment
    #   can :create, Comment


    # Define abilities for the user here. For example:
    #
    #   return unless user.present?
    #   can :read, :all
    #   return unless user.admin?
    #   can :manage, :all
    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, published: true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/blob/develop/docs/define_check_abilities.md
  end
end
