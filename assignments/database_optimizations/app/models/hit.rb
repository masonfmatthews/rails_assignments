require 'csv'

class Hit < ActiveRecord::Base
  belongs_to :subject, polymorphic: true

  validates :subject_id, presence: true
  validates :subject_type, presence: true

  def self.export(count)
    CSV.open("tmp/data.csv", "wb") do |csv|
      csv << ["Assembly Name",
          "Assembly Date",
          "Sequence",
          "Sequence Quality",
          "Gene Sequence",
          "Gene Starting Position",
          "Gene Direction",
          "Hit Name",
          "Hit Sequence",
          "Hit Similarity"]
      Hit.limit(count).each do |h|
        csv << [h.subject.sequence.assembly.name,
            h.subject.sequence.assembly.name,
            h.subject.sequence.dna,
            h.subject.sequence.quality,
            h.subject.dna,
            h.subject.starting_position,
            h.subject.direction,
            h.match_gene_name,
            h.match_gene_dna,
            h.percent_similarity]
      end
    end
  end
end
