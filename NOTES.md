Babysitter Kata

Background
----------
This kata simulates a babysitter working and getting paid for one night.  The rules are pretty straight forward:

The babysitter
- starts no earlier than 5:00PM
- leaves no later than 4:00AM
- gets paid $12/hour from start-time to bedtime
- gets paid $8/hour from bedtime to midnight
- gets paid $16/hour from midnight to end of job
- gets paid for full hours (no fractional hours)


Feature:
As a babysitter
In order to get paid for 1 night of work
I want to calculate my nightly charge

--------------------
Variables
--------------------
start_time  ---has a default value of 5 pm if no time is given by the user
bedtime
leave_time ---has a default value of 4 am if no time is given by the user
* midnight also needs to be considered when calculating total hours


--------------------
Classes
--------------------
1) CLI - get input from user about start/leave times
2) A class calculating hours worked - this should calculate the time between each variable
3) A class calculating pay - this should take the results from hours worked and return earnings according to the different rates of pay


--------------------
Things to Consider
--------------------
1) When a user inputs a start/leave/or bedtime, it'll be in a string
   - This will need to be converted into a usable format
   - I'll have to protect against invalid inputs
2) the Time class uses 24 hour time    
