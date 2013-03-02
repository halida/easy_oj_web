module ApplicationHelper
  def solution_status_display status
    show = case status
           when 'Accepted' then
             'accepted'
           when 'Pending' then
             'pending'
           when 'Testing' then
             'pending'
           else
             'failed'
           end
    "<div class='solution_status #{show}'></div>".html_safe
  end

  def md_article string
    Redcarpet.new(string, :autolink, :hard_wrap, :smart, :filter_html).to_html.html_safe
  end
end
