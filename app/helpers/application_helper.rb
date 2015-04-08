module ApplicationHelper
  def will_paginate(collection)
    render partial: 'layouts/pagination', object: collection, as: :collection
  end
end
