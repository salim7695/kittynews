# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    field :user_update, mutation: Mutations::UserUpdate
    field :vote_mutation, mutation: Mutations::VoteMutation
  end
end
