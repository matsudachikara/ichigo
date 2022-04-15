# frozen_string_literal: true

module Pagination
  extend ActiveSupport::Concern

  def paginate(records)
    {
      data: records,
      meta: {
        current_page: records.current_page,
        total_pages: records.total_pages,
        limit_value: records.limit_value,
        total_count: records.total_count
      }
    }
  end
end
