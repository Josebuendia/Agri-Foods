class ItemPolicy < ApplicationPolicy
    # The authorization rules will go here
    class PostPolicy
      attr_reader :user, :post
    
      def initialize(user, post)
        @user = user
        @post = post
      end
    
      def edit?
        @record.user.eql?(@user)
      end

      def create?
        @user.role == 1
      end

      def destroy?
        user.role == 1 || record.user == user
      end
    end
  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
