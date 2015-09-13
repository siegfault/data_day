module ApplicationHelper
  def icon_for(icon_name)
    Icon.new(icon_name: icon_name).render
  end

  def label_for(activity:)
    if activity.in_progress?
      label_class = 'label label-primary'
      path = action_end_path(activity.actions.incomplete.first)
    else
      label_class = 'label label-default'
      path = actions_path(activity_id: activity.id)
    end

    link_to(content_tag(:span, activity.name, class: label_class), path, method: :post)
  end

  def tabs
    content_tag(:ul, class: 'nav nav-tabs nav-justified') do
      home_tab + reports_tab
    end
  end

  private
  def home_tab
    nav_link('Home', actions_path)
  end

  def reports_tab
    nav_link('Reports', reports_path)
  end

  def nav_link(text, path)
    class_name = current_page?(path) ? 'active' : ''

    content_tag(:li, role: 'presentation', class: class_name) do
      link_to(text, path)
    end
  end
end
