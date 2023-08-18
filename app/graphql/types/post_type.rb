# frozen_string_literal: true

module Types
  class PostType < Types::BaseObject
    field :id, ID, null: false
    field :title, String, null: false
    field :tagline, String, null: false
    field :url, String, null: false
    field :user, UserType, null: false
    field :comments_count, Int, null: false
    field :no_of_votes, Int, null: false
    field :is_voted, Boolean, null: false
    field :comments, [CommentType], null: false

    def no_of_votes
      AssociationLoader.for(object.class, :votes)
                       .load(object)
                       .then(&:count)
    end

    def is_voted
      return false unless context.current_user

      AssociationLoader.for(User, :votes)
                       .load(context.current_user)
                       .then { |votes| votes.any? { |vote| vote.post_id == object.id } }
    end

    def comments
      AssociationLoader.for(object.class, :comments)
                       .load(object)
    end
  end
end
