require 'test_helper'

class VoterTest < ActiveSupport::TestCase

  def test_create_new_voter
    voter = Voter.new(name: "Ruti Wajnberg")
    assert voter.save
    assert_raises(ArgumentError) do
      Voter.create(1, 2)
    end
  end

  def test_voters_associated_with_one_vote
    vr = Voter.create!(name: "Ilan Man")
    v = Vote.new()
    vr.vote = v

    assert_equal v, Voter.find(vr.id).vote
  end

end
