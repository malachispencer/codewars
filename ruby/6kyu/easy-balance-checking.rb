=begin
Codewars. 25/05/20. 'Easy Balance Checking'. 6kyu. Here we create a method that takes a small checkbook sometimes cluttered with 
non-alphanumeric characters e.g. "963.0\n131 Books 12.2\n139 Gasoline 120.90\n002 Hardware;! 71.4?;" and returns a balance report in the 
form "Original Balance: 963.00\r\n131 Books 12.20 Balance 950.80\r\n139 Gasoline 120.90 Balance 829.90\r\n002 Hardware 71.40 Balance 
758.50\r\nTotal expense  204.50\r\nAverage expense  68.17". Here is the solution I developed to solve the challenge.
1) We define our method balance_report_ms, which takes a checkbook in the form of a string as its argument. The string contains an original
   balance, check number, category and check amount. It also may contain clutter in the form of non-alphanumeric characters.
2) First we must clean the string. So we call gsub and remove everything that is not a letter, digit, space or dot [^a-z0-9\s\.]. We call
   gsub again and remove any empty lines (\n)(\n*), which would be any consecutive line. Then we call gsub a third time and format all
   check amounts (\d+\.\d+)$ to 2 decimal places using the string formatter "%.2f" %. The string is now clean.
3) We then call the scan method on the string and generate an array of the original balance and all the check amounts \d+\.\d+$, the
   original balance will always be in the first index position and the check amounts will follow it. We store this in a variable called
   ns (for numbers).
4) Now we must turn our numbers into decremented balances, so we map! over ns with index. Since the first element is the original balance,
   we leave it the same. For the check amounts, we subtract them from the previous balance by converting ns[i-1] to a float, calling the
   send method on it, then passing in a minus symbol and ns[i] converted to a float. This performs our calculations, but our results must
   all be to 2 decimal places, so we use the "%.2f" % string formatters on all the results, which converts the results from float to 
   string also.
5) ns is now an array of balances decremented.
6) Now we go to work on our original (now cleaned) string. We split the string at every newline because our original balance and
   transactions are all on different lines.
7) We then map over the checkbook with index, the first element will be the original balance so if i == 0, we simply add "Original Balance:"
   and a space before the opening balance, we do so using string interpolation.
8) If i is not 0, after the line, we place "Balance", space and then what the balance will be after that transaction, which we get from the
   corresponding indexed element in ns.
9) Now some of the formatting has been conducted on our balance report, we join the array back into a string delimited by a carriage return
   and a newline. We store this in a variable b (for balance report), thus maintaining s as the original clean string.
10) Now we must add total expense and average expense to the end of our b string. So first we grab the expenses by calling scan on s and
    generating an array of the original balance and check amounts once again, but this time we slice out the first element, keeping only
    the check amounts. We then map over the array and convert every value to a float.
11) Finally, we return our final formatted balance report, which starts with b, followed by a carriage return and a newline, followed by
    "Total expense", followed by 2 spaces, followed by the sum of the expenses, converted to a 2 decimal places string, followed by a
    carriage return and a newline, followed by "Average expense", followed by 2 spaces, followed by the sum of the expenses divided by the
    size of the expenses, converted to a 2 decimal place string.
12) Now we have returned our balance report. 
=end

def balance_report_ms(s)
  s = s.gsub(/[^a-z0-9\s\.]/i, '').gsub(/(\n)(\n*)/, '\1').gsub(/(\d+\.\d+)$/) {"%.2f" % $1}
  ns = s.scan(/\d+\.\d+$/)
  ns.map!.with_index {|n,i| i == 0 ? n : "%.2f" % ns[i-1].to_f.send("-", ns[i].to_f)}
  b = s.split("\n").map.with_index {|l,i| i == 0 ? "Original Balance: #{l}" : "#{l} Balance #{ns[i]}"}.join("\r\n")
  e = s.scan(/\d+\.\d+$/)[1..-1].map(&:to_f)
  "#{b}\r\nTotal expense  #{"%.2f" % e.sum}\r\nAverage expense  #{"%.2f" % (e.sum / e.size)}"
end