module StoresHelper
  def info_window(store)
    html = content_tag(:strong, link_to(store.name, store.to_url)) + "<br>"
    html += store.address1 + "<br>"
    html += store.address2 + "<br>" unless store.address2.blank?
    html += store.city_state_zip
    html
  end

  def found_message(stores)
    "#{stores.size} store" + (stores.size > 1 ? "s were" : " was") + " found."
  end

  def link_to_store_people(store, text)
    link_to text, "/staff/" + store.permalink
  end

end
