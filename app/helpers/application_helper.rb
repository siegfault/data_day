module ApplicationHelper
  def icon_for(icon_name)
    Icon.new(icon_name: icon_name).render
  end

  def badge_for(value:)
    content_tag(:span, value, class: 'badge')
  end

  def tabs
    content_tag(:ul, class: 'nav nav-pills nav-justified') do
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
