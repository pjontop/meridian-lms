module Cacheable
  extend ActiveSupport::Concern

  included do
    # This method provides a way to cache expensive computations
    def cache_key_with_timestamp
      "#{cache_key_with_version}/#{updated_at.to_i}"
    end
  end

  class_methods do
    # Cache expensive queries
    def cached_find(id)
      Rails.cache.fetch("#{name.downcase}/#{id}", expires_in: 1.hour) do
        find(id)
      end
    end

    # Cache collection queries
    def cached_all
      Rails.cache.fetch("#{name.downcase}/all", expires_in: 30.minutes) do
        all.to_a
      end
    end
  end
end
