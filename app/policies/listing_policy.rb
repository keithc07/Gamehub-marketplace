class ListingPolicy < ApplicationPolicy
    def edit?
        user.admin? || user.id == record&.user_id
    end

    def update?
        edit?
    end

    def destroy?
        edit?
    end
end