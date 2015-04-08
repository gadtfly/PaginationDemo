module Pagination
  class Pagination
    attr_reader :page, :per_page, :total

    def initialize(options)
      @per_page   = (options[:per_page] || 30).to_i
      @page       = (options[:page]     || 1).to_i
    end

    def offset
      (self.page - 1) * self.per_page
    end

    def total_pages
      self.total.fdiv(self.per_page).ceil
    end

    def paginate(scope)
      @total = scope.count
      scope.pagination = self
      scope.offset(self.offset).limit(self.per_page)
    end
  end

  def paginate(options = {})
    Pagination.new(options).paginate(self.all)
  end
end

class ActiveRecord::Relation
  attr_accessor :pagination
end
