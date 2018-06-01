class JobPosting < ApplicationRecord
  belongs_to :job_poster
  belongs_to :category
  belongs_to :location

  validates :description, presence: true

  enum status: {
    new_post: 0,
    pending: 1,
    complete: 2
  }

  validates :title, presence: true

  scope :by_created_at, lambda{ |date| where("CAST(created_at AS DATE) BETWEEN ? AND ?", date.beginning_of_day, date.end_of_day ) }

  after_initialize :set_defaults

  private

  def set_defaults
    self.posted_at ||= Time.zone.now
    self.status ||= statuses[:new_post]
  end
end
