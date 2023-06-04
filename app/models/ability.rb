class Ability
  include CanCan::Ability

  def initialize(user)
      user ||= User.new
      if user.admin?
        can :manage, :all
      elsif user.doctor?
        can :manage, Appointment, DoctorsRecommendation;
        can :read, :all
      else
        can :manage, Appointment;
        can :read, :all
      end
  end
end
