module TrafficSpy

  class Url
    def self.table
      DB.from(:urls)
    end

    # def self.create(payload, identifier_id)
    #   table.insert(
    #   :url => payload["url"],
    #   :source_id => identifier_id,
    #   )
    # end

    def self.exist?(url)
      table.where(
        :url => url
      ).count > 0
    end

    def self.return_id(url)   #grabbing existing id, or creating + returning a new id
      if exist?(url)
        table.select(:id).where(:url => url)   #this returns the id in the url table where :url == url
      else
        table.insert(
        :url => url
        )
        table.select(:id)
      end
    end

    # def self.find_id_by(url)
    #   table.where(
    #   :url => url
    #   ).to_a.first[:id]
    # end
    #
    # def self.selected_urls(source_id)
    #   table.where(
    #   :source_id => source_id
    #   ).to_a
    # end

    # def self.sorted_urls(source_id)
    #   list = selected_urls(source_id).map {|url| url[:url]}.inject(Hash.new(0)) {|total, element| total[element] += 1 ; total}
    #   list.sort_by {|key, value| value}.reverse
    # end

    # def <=>()
    #   other.
    # end

  end
end
