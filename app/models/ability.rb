class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
       user ||= Person.new # guest user (not logged in)
      if user.role? 'admin'
        can :manage, :all
      elsif user.role? 'user'
        can [:create,:new,:index,:show], Event
        can :edit, Event, :active => true, :teacher => user.id
        can [:index,:show], [Course, Company, Location]
      else
        can [:index,:show], [Event, Course, Company, Location]
      end

      can :register_user, Event do |e|
        (( e.person_ids.exclude?(user.id) ) || ( user.id != e.teacher.to_i ))
      end

      # cannot :register_user, Event, :active => true, :teacher => user.id
      # cannot :register_user, Event, :active => true, :people.include? user.id

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
    # https://github.com/ryanb/cancan/wiki/Defining-Abilities
  end
end
