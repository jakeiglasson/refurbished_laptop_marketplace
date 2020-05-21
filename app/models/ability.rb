# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    alias_action :create, :read, :update, :destroy, to: :crud

    user ||= User.new # guest user (not logged in)
    can :manage, User, id: user.id #CRUD functionality for users own information
    can :read, Laptop #Allow all users to read laptop information

    # If user isn't a guest they can create and read laptop orders (read is needed so an error isnt thrown after an order is placed)  
    if user.guest == false
      can [:create, :read], [LaptopOrder]
    end

    # If user is a seller they can create new laptops while maintaing full crud over the laptops they create otherwise the user can view all laptops  
    if user.seller == "true"
      can :manage, Laptop, user_id: user.id
    end

    # grant admins full access to all objects  
    if user.admin?
      can :manage, :all
    end


    

    # if user.admin?
    #   can :manage, :all
    # else
    #   can :read, :all
    # end

    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
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
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
  end
end
