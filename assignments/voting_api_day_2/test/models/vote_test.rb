require 'test_helper'

class VoteTest < ActiveSupport::TestCase

  def test_create_new_vote
    assert Vote.create!()
  end

  def test_voter_id_unique_to_vote
    voter = Voter.create!(name: "Carson", party: "Republican")
    vote = Vote.create!(voter: voter)
    vote2 = Vote.new(voter: voter)

    refute vote2.save
  end

end
