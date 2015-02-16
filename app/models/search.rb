class Search < ActiveRecord::Base
  def search_records
    records = Record.all

    records = records.where(["name LIKE ?","%#{search}"]) if name.present?
    records = records.where(["artist LIKE ?", artist]) if artist.present?
    records = records.where(["year LIKE ?", year]) if year.present?
    records = records.where(["price >= ?", min_price]) if min_price.present?
    records = records.where(["price <= ?", max_price]) if max_price.present?

    return records
  end
end
