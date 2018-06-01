# This rake task generates report of new job postings posted the previous day.
# This report is generated automatically every day at 9am est

namespace :generate do
  task :new_job_report => :environment do
    begin
      date = 1.day.ago
      job_postings = JobPosting.by_created_at(date)

      file_name = "new_job_postings_#{date.to_i}.csv"
      headers = ["id", "title", "description", "category name", "job poster name", "location name", "status", "created_at"]

      CSV.open(file_name, "w", force_quotes: true) do |csv|
        csv << headers

        job_postings.each do |job_posting|
          csv << [ job_posting.id,
            job_posting.title,
            job_posting.description,
            job_posting.category.name,
            job_posting.job_poster.full_name,
            job_posting.location.name,
            job_posting.status,
            job_posting.created_at
          ]
        end

      end
    rescue => e
      puts e.message
      puts e.backtrace
    end
  end
end