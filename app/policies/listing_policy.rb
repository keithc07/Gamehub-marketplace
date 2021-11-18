class ListingPolicy < ApplicationPolicy
    # verify whether the user is admin or user id is equal to listing user id
    def edit?
        user.admin? || user.id == record&.user_id
    end

    # bring the action from edit?
    def update?
        edit?
    end

    # bring the action from edit?
    def destroy?
        edit?
    end
end