=begin
Codewars. 23/07/20. 'Football League Table System'. 6kyu. Here we create a football stats class which can prodive the stats breakdown
of a particular team. Match results are pushed into an array in the form of strings e.g. 'Arsenal 2 - 1 Liverpool' and from this array we
parse the results to generate stats. Here is the solution I developed to solve the challenge.
1) We define our class LeagueTable using the class keyword and the PascalCase class naming convention. PascalCase is different from
   camelCase.
2) We create an attr_reader which allows us to see the value of our instance variables but it does not allow us to change the values.
3) Our initialize method contains an empty array called @matches, to which we will push match results with our push method, which takes in
   a match result in the form of a string e.g. 'Arsenal 2 - 0 Chelsea'.
4) Our stats method pretty much does most of the work for us.
5) For the team we want to get stats for, we create a variable called team_matches where we keep only the matches from @matches which
   include that team. To make our parsing job easier, we map over team_matches and split each string at its space dash space which
   seperates the respective scores. Now team_matches looks so [["Liverpool 1", "1 Burnley"], ["Arsenal 2", "1 Liverpool"]].
6) We then initialize a hash called team_stats, where we'll store our stats breakdown.
7) We iterate over team_matches using each. For each match, we use the partition method to split the array into 2 arrays. The first will
   contain the string holding our team_name, the second will include the other team. For each iteration, team will look like so
   ["1 Liverpool"] and other will look the same e.g. ["Arsenal 2"].
8) Now, we store the score of our team in team_score by joining the array into a string and slicing out the digit with a regex. We do the
   same for the other team and store this in other_score.
9) Now we generate the stats of our hash.
10) Once our each loop finishes, we return our hash, team_stats.
11) Now our other methods can simply call our stats method with the team_name of the team we want the particular stat for, and we simply
    extract the value from the hash.
=end

class LeagueTable
  attr_reader :matches
  
  def initialize
    @matches = []
  end 
  
  def push(match_result)
    @matches.push(match_result)
  end

  def stats(team_name)
    team_matches = @matches.reject {|m| !m.include?(team_name)}.map {|m| m.split(' - ')}
    team_stats = {'W' => 0, 'D' => 0, 'L' => 0, 'GF' => 0, 'GA' => 0, 'GD' => 0, 'PTS' => 0}
    team_matches.each do |m|
      team, other = m.partition {|t| t.include?(team_name)}
      team_score = team.join[/\d/].to_i 
      other_score = other.join[/\d/].to_i
      team_stats['W'] += 1 if team_score > other_score
      team_stats['D'] += 1 if team_score == other_score
      team_stats['L'] += 1 if team_score < other_score
      team_stats['GF'] += team_score
      team_stats['GA'] += other_score
      team_stats['GD'] += team_score - other_score
      team_stats['PTS'] += 3 if team_score > other_score
      team_stats['PTS'] += 1 if team_score == other_score
    end
    team_stats
  end
  
  def get_points(team_name)
    stats(team_name)['PTS']
  end
  
  def get_goals_for(team_name)
    stats(team_name)['GF']
  end
  
  def get_goals_against(team_name)
    stats(team_name)['GA']
  end
  
  def get_goal_difference(team_name)
    stats(team_name)['GD']
  end
  
  def get_wins(team_name)
    stats(team_name)['W']
  end
  
  def get_draws(team_name)
    stats(team_name)['D']
  end
  
  def get_losses(team_name)
    stats(team_name)['L']
  end  
  
end