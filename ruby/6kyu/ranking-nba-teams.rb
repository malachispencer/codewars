=begin
Codewars. 28/05/20. 'Ranking NBA teams'. 6kyu. We are given a string of the results of NBA games, separated by commas, and another string, 
an NBA team. Here we create a method which provides a breakdown of that team's results/stats for example 
"Boston Celtics:W=4;D=0;L=0;Scored=403;Conceded=350;Points=12". Here is the solution I developed to solve the challenge.
1) We define our method nba_results_ms, which takes a r, a string of results and t, an NBA team as its arguments.
2) We handle our first error check, if t is an empty string, we return an empty string.
3) Each game is separated by a comma and now we need to extract all the games our input team features in. So that we don't need to use split
   and reject or select, we call tr on r and replace all commas with newlines, so now every game is on a different line, then we call the
   scan method.
4) In our regex, ^ asserts the start of the line, .* is 0 or more characters, followed by our input team #{t}, followed by a space, followed
   by 0 or more characters .* until the end of the line $. This returns an array of every line/game our input team features in, which we
   call tr for team results.
5) Placing the space after #{t} is important, because without it, for example, we'd match Bostin Celtics if our input was Boston Celt.
6) If our array of games is empty, we return that our input team didn't play.
7) Only integers are accepted as a valid score, so if tr contains a float, matched by our regex \d+\.\d+, we return another error message.
8) Now we need to separate the team and score within each game, so we map! over tr, then for each game we call the scan method to turn the
   string into an array of 2 strings, with each string contain the team and its score.
9) In our regex, ^ asserts the start of the string, followed by 1 or more characters (the team name), followed by a space \s, followed by a
   set of digits \d+ just before a space we don't capture (?=\s). This first half of our regex will capture the first team and score in the 
   string. We then have an or operator and capture the second team and score in the string. In this part of the regex, \w captures the
   first word of the second team, .+ captures the rest of the team name including any spaces, \s captures the space after the team name and
   then \d+ captures the score (which for the second team is at the end of the string $).
10) Now we have an array of arrays where each sub-array holds team 1 and its score as the first element, and team 2 and its score as the
    second element, both are strings.
11) To make our lives easier, we want our input team to always be in the first position of every sub-array, so we map! over both elements
    of each sub-array and if a contains our input team, we make a the first element and b the second element, if not, b contains our input
    team so we make b the first element and a the second element.
12) Now our array of games is sorted so that our input team is always the first team in the sub-array.
13) We then initialize a counter hash, where we are going to store the wins, draws, losses, total scored and total conceded for our input
    team.
14) Using each, we iterate over both teams in each game. We create a variable as where using string slicing we grab the last set of digits
    from the team in the first position of the sub-array i.e. the score of our input team, we convert this to an integer. We do the same for
    the opposition team and store this in a variable bs.
15) For each game, if our input team's score (as) is higher than the opposition's score (bs), we increment wins in our hash by 1, if they
    are equal, we increment draws by 1, if as has a lower score than bs, we increment losses by 1. The score key of our hash is increment
    by every score of our input team, and the conceded key is incremented by every score of the opposition team.
16) Now we have our stats, using string interpolation we return them in the specified format. Points is simply the number of wins multiplied
    by 3, added to the total amount of draws.
=end

def nba_results_ms(r,t)
  return "" if t.empty?

  tr = r.tr(",", "\n").scan(/^.*#{t}\s.*$/)

  return "#{t}:This team didn't play!" if tr.empty?
  return "Error(float number):#{tr.join}" if tr.join.match(/\d+\.\d+/)

  tr.map! {|g| g.scan(/^.+\s\d+(?=\s)|\w.+\s\d+$/)}.map! {|a,b| a.match(/#{t}/) ? [a,b] : [b,a]}

  h = {"W"=>0, "D"=>0, "L"=>0, "S"=>0, "C"=>0}

  tr.each do |a,b|
    as = a[/\d+$/].to_i
    bs = b[/\d+$/].to_i
    h["W"] += 1 if as > bs
    h["D"] += 1 if as == bs
    h["L"] += 1 if as < bs
    h["S"] += as
    h["C"] += bs
  end
  
  "#{t}:W=#{h["W"]};D=#{h["D"]};L=#{h["L"]};Scored=#{h["S"]};Conceded=#{h["C"]};Points=#{h["W"] * 3 + h["D"]}"
end