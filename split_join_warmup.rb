require_relative "testing_library"

goal_message = "GOOOOOOOAL!!!!"
team_list = "Brazil, Mexico, Cameroon, Croatia, Netherlands, Chile, Australia, Spain, Germany, Ghana, US, Protugal"
long_string = <<-world_cup_news
Clint, Dempsey, put, the, U.S.,
ahead, in, the, first, minute,
of, its, World, Cup, opener.
world_cup_news

# enter your solutions inside the methods
def goal(goal_message)
  # goal_message + goal_message
  goal_message * 2
  # "#{goal_message}#{goal_message}"
end

def generate_an_array_of_teams(team_list)
  team_list.split(", ")
end

def number_of_teams(team_list)
  team_list.split(", ").count
end

def return_australia(team_list)
  # team_list.split(", ")[6]
  # team_list.scan("Australia").join("")
  team_list.scan("Australia").first
end

def starts_with_C(team_list)
  # team_list.split(", ").select { |country| country[0] == "C"}
  # team_list.split(", ").select { |c| c.include? ('C') }
  team_list.split(", ").select { |c| c.chars.first ('C') }
end

def block_string_to_single_line(long_string)
  # long_string.split(", "),join("").gsub("/n", " ").strip
  long_string.gsub(/,/, "").gsub(/\n/, " ").strip
end

def capitalize_every_third_word(long_string)
#   third = long_string.chomp.gsub("\n", " ").downcase.split(", ")
#   stuff = []
#   third.each_with_index do |x, i|
#     if i == 0 || i % 3 == 0
#       stuff[i] = x.capitalize!
#     end
#     stuff[i] = x
#   end
#   return stuff = stuff.join(" ")
  block_string_to_single_line(long_string.downcase).split.each_slice(3)
  .flat_map{|a,b,c| [a.capitalize, b, c]}.join(' ')
end

check("goal method", goal(goal_message) == "GOOOOOOOAL!!!!GOOOOOOOAL!!!!")
check("generate_an_array_of_teams method",
generate_an_array_of_teams(team_list) == ["Brazil", "Mexico", "Cameroon", "Croatia", "Netherlands", "Chile", "Australia", "Spain", "Germany", "Ghana", "US", "Protugal"] )
check("number_of_teams method", number_of_teams(team_list) == 12 )
check("return_australia method", return_australia(team_list) == 'Australia' )
check("starts_with_C method", starts_with_C(team_list) == ['Cameroon', 'Croatia', 'Chile'] )
check("block_string_to_single_line method",
block_string_to_single_line(long_string) == "Clint Dempsey put the U.S. ahead in the first minute of its World Cup opener." )
check("capitalize_every_third_word method",
capitalize_every_third_word(long_string) == "Clint dempsey put The u.s. ahead In the first Minute of its World cup opener." )
