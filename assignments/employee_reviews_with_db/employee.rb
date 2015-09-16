class Employee

  attr_reader :name, :salary

  def initialize(name:, salary:, email: nil, phone: nil)
    @name = name
    @salary = salary
    @email = email
    @phone = phone
    @reviews = []
    @satisfactory = true
  end

  def recent_review
    @reviews.last
  end

  def satisfactory?
    @satisfactory
  end

  def give_raise(amount)
    @salary += amount
  end

  def give_review(review)
    @reviews << review
    assess_performance
    true
  end

  def assess_performance
    good_terms = [/positive/i, /good/i, /\b(en)?courag(e[sd]?|ing)\b/i, /ease/i, /improvement/i, /quick(ly)?/i, /incredibl[ey]/i, /\bimpress[edving]?{2,3}/i]
    bad_terms = [/\broom\bfor\bimprovement/i, /\boccur(ed)?\b/i, /not/i, /\bnegative\b/i, /less/i, /\bun[a-z]?{4,9}\b/i, /\b((inter)|e|(dis))?rupt[ivnge]{0,3}\b/i]
    good_terms = Regexp.union(good_terms)
    bad_terms = Regexp.union(bad_terms)

    count_good = @reviews.last.scan(good_terms).length
    count_bad = @reviews.last.scan(bad_terms).length

    @satisfactory = (count_good - count_bad > 0)
  end
end
