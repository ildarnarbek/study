module Exercise
  module Fp
    class << self
      # Обратиться к параметрам фильма можно так:
      # film["name"], film["rating_kinopoisk"], film["rating_imdb"],
      # film["genres"], film["year"], film["access_level"], film["country"]
      def rating(array)
        filtred_films = array.select{|film|  film["country"].to_s.include?(",") && !film["rating_kinopoisk"].nil? && film["rating_kinopoisk"].to_f > 0}
        all_ratings = filtred_films.map {|film| film["rating_kinopoisk"].to_f}
        quantity_ratings = all_ratings.length
        sum_ratings = all_ratings.reduce(:+)
        average = sum_ratings / quantity_ratings
      end

      def chars_count(films, threshold)
        filtred_films = films.select{|film| film["rating_kinopoisk"].to_f >= threshold }
        films_names = filtred_films.map {|film| film["name"].to_s}
        number_of_chars = films_names.map {|name| name.count('и')}.reduce(:+)
      end
    end
  end
end
