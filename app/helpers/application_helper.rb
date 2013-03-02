module ApplicationHelper
  def solution_status_display status
    show = case status
           when 'Accepted' then
             'accepted'
           when 'Pending' then
             'pending'
           else
             'failed'
           end
    "<div class='solution_status #{show}'></div>".html_safe
  end
end
