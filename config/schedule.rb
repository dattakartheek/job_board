require "tzinfo"
# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
# set :output, "/path/to/my/cron_log.log"
#
# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

# Learn more: http://github.com/javan/whenever

# since whenever only uses utc, we are converting the time to utc
def eastern(time)
  TZInfo::Timezone.get('US/Eastern').local_to_utc(Time.parse(time))
end



every 1.day, at: eastern('9am') do
  rake "generate:new_job_report"
end