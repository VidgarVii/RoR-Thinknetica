module GistsHelper
  def link_to_gist(url)
    link_to url.split('/')[-1], url, target: '_blank'
  end
end
