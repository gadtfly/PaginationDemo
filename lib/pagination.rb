module Pagination
  def paginate(options = {})
    per_page = (options[:per_page] || 30).to_i
    page     = (options[:page]     || 1).to_i
    offset   = (page - 1) * per_page
    self.offset(offset).limit(per_page)
  end
end
