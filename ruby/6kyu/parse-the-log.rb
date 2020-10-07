=begin
Codewars. 04/06/20. "Parse the log". 6kyu. We are a support engineer and we have to write a regex that captures the following information
from our log files: the date, the log level (ERROR, INFO, DEBUG), the user, the main function, the sub function, the logged message. Some
rules defining the logs: the sub function may or not be there, the logged message contains any kind of character, all fields are
separated by 1 or more spaces.

Valid logs:
<DATE> <LOG LEVEL> [<USER>:<FUNCTION>(:<SUBFUNCTION>)] <MESSAGE>
2003-07-08 16:49:45,896 ERROR [user1:mainfunction:subfunction] We have a problem
2003-07-08 16:49:46,896 INFO [user1:mainfunction] We don't have a problem

Invalid logs:
2003-07-08 16:49:45,896 CRITICAL [user1:mainfunction:subfunction] We have a problem         - Invalid log level
2003-07-08 16:45,896 ERROR [user1:mainfunction:subfunction] We have a problem               - Invalid timestamp, no seconds 
2003-07-08 16:45:13,896 ERROR [best user ever:mainfunction:subfunction] We have a problem   - Invalid user, contains space

Here is the solution I developed to solve the challenge.
1) ^ asserts the start of the string.
2) (\d{4}-\d{2}-\d{2}\s\d{2}:\d{2}:\d{2},\d{3}) is CG1 which matches the date.
3) \s+ matches one or more spaces in between the date and the log level.
4) (ERROR|INFO|DEBUG) is CG2 which matches the log level. Originally I used ([A-Z]{4,5}) but this is less specific.
5) \s+ matches one or more spaces after the log level.
6) \[ matches the opening square bracket before the user.
7) (\w{5}) is CG3 which matches the user.
8) : seperates the user and the mainfunction.
9) (\w{12}) is CG4 which matches the mainfunction.
10) \:? is 0 or 1 colons that could be after the mainfunction.
11) (\w+)? is CG5 which matches 0 or 1 subfunction.
12) \] matches closing square bracket after mainfunction or subfunction if one exists.
13) \s+ matches one or more spaces before log message.
14) (.+)$ matches the log message at the end of the string.
=end

LOGPARSER = /^(\d{4}-\d{2}-\d{2}\s\d{2}:\d{2}:\d{2},\d{3})\s+(ERROR|INFO|DEBUG)\s+\[(\w{5}):(\w{12})\:?(\w+)?\]\s+(.+)$/