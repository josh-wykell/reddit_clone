module ApplicationHelper
  def render_comments(commentable)
    render :partial => 'comments/index', :locals => { :commentable => commentable }
  end
end
