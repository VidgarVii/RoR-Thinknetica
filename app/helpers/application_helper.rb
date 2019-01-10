module ApplicationHelper
  def current_year
    Time.current.year
  end

  def github_url(author, repo)
    link_to author, "https://github.com/#{author}/#{repo}", target: '_blank'
  end

  def header_form(object, name)
    object.new_record? ? t("actions.creates.#{name}") : t("actions.update.#{name}")
  end

  def flash_tag(status)
    if flash[status]
      content_tag :p, flash[status], class: "flash #{status}"
    end
  end
end
