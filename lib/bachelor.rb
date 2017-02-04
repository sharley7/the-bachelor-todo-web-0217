def get_first_name_of_season_winner(data, season)
  first_name = nil
    data.map do | season_num, contestants|
      if season_num == season
      contestants.map do | profile |
        profile.map do |att, stat|
          if stat == "Winner"
            name_arr = profile["name"].split()
            first_name = name_arr.first
          end
        end
      end
    end
  end
  return first_name
end

def get_contestant_name(data, occupation)
  contestant_name = nil
    data.map do | season_num, contestants|
      contestants.map do | profile |
        profile.map do |att, stat|
          if stat.downcase == occupation.downcase
            contestant_name = profile["name"]
          end
        end
      end
    end
  return contestant_name
end


def count_contestants_by_hometown(data, hometown)
from_town = 0
  data.each do | season_num, contestants|
    contestants.each do | profile |
      profile.each do |att, stat|
        if stat.downcase == hometown.downcase
          from_town += 1
        end
      end
    end
  end
  return from_town
end


def get_occupation(data, hometown)
  data.find do | season_num, contestants|
    contestants.find do | profile |
      profile.find do |att, stat|
        if stat.downcase == hometown.downcase
        return profile["occupation"]
      end
    end
  end
 end
end

def get_average_age_for_season(data, season)
  age_counter = 0
  divide_counter = 0
  data.map do | season_num, contestants |
    if season_num == season
    contestants.map do |profile|
      profile.map do |att, stat|
         age_counter += profile["age"].to_i
         divide_counter += 1
      end
      end
    end
  end
  return (age_counter/divide_counter.to_f).round
end
