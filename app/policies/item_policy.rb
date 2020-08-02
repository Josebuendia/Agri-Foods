class ItemPolicy < ApplicationPolicy
    # The authorization rules will go here
    class PostPolicy
      attr_reader :user, :post
    
      def initialize(user, post)
        @user = user
        @post = post
      end
    
      def update?
        #user.admin? or not post.published?
        User.where(user)
      end

      def destroy?
        user.role == 'admin' || record.user == user
      end
    end
  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
