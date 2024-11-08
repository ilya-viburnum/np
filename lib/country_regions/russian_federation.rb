module CountryRegions
  class RussianFederation
    RegionStruct = Struct.new(:name)

    COUNTRY_NAME = "Russia"

    ADDITIONAL_REGION_NAMES =
      [
        { name: "Sevastopol'" },
        { name: "Crimea, Respublika" },
        { name: "Khersonskaya oblast'" },
        { name: "Zaporozhskaya oblast'" },
        { name: "Donetskaya Narodnaya Respublila" },
        { name: "Luganskaya Narodnaya Respublila" }
      ].freeze

    class << self
      def sorted_regions
        all_regions.sort_by(&:name)
      end

      private def additional_regions_with_codes
        ADDITIONAL_REGION_NAMES.map { RegionStruct.new(_1[:name]) }
      end

      private def country
        Carmen::Country.named(COUNTRY_NAME)
      end

      private def all_regions
        regions_with_codes + additional_regions_with_codes
      end

      private def regions_with_codes
        country.subregions.map { RegionStruct.new(_1.name) }
      end
    end
  end
end
