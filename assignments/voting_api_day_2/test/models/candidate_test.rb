require 'test_helper'

class CandidateTest < ActiveSupport::TestCase

  def test_create_new_candidate
    candidate = Candidate.new(name: "Donald Trump")
    assert candidate.save
    assert_raises(ArgumentError) do
      Candidate.create(1, 2)
    end
  end

  def test_candidates_associated_with_votes
    c = Candidate.create(name: "Hilary Clinton")
    v = Vote.new()
    c.votes << v

    assert_equal [v], Candidate.find(c.id).votes
  end

end
