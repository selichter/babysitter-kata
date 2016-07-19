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
Assumptions
--------------------
1) Pay will be calculated in such a way that the babysitter will earn the most money
  -bed_time will be rounded up to the next hour ie - if bedtime is 8:30, it will be rounded up to 9


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


--------------------
Job
--------------------
-needs to initialize start, bed, and leave time
  -start_time should have a default value
  -leave_time should have a default value

-does midnight need to be a constant? Will doing so provide clarity or is using 0 or 24 enough?

-times that need to be calculated
  -start_to_bed_time
  -bed_to_midnight -in this case midnight is 24
  -midnight_to_leave_time -in this case midnight is 0
    --with leave_time, we only need to round to the next hour since we're using a 24 hour clock

-needs to convert inputs to Time usable format

-needs to round to the correct hour (down for start and up for leave and bed)
  -with the start time we don't actually need to round; we only need to grab the hour
  -with bed/leave time we need to check that the minutes aren't equal to 00
    --if mins equal 00 then we can just grab the hour
    else t.hour.next

-deal with the edge case that bed_time is after midnight

-bedtime after midnight
  Indicators that the bedtime is after midnight: -the parsed @bed_time is less than 16
              -the parsed @bed_time is less than the earliest available time --available time becomes a constant to compare against.

calculating if bedtime is after midnight:
  (midnight - start_time) + (bedtime - 0)


NEXT STEPS
X 1 - Build a module for things that format a given time to an hour
  2 - Is Invoice the right class to calculate payment?
    - Should I have a Payment class that has the constants for the rates and calculates the value of each time period?
X 3 - Remove CLI - you should initiate a new job like so:
      job = BabysitterKata::Job.new(start, bed, leave)
X 4 - Where is the right place for validate_times ?
  5 - Job class keeps methods that are specific to that job - calculating time periods and the final payment calculation
     - An argument could be made that validating the times is specific to the job - they are ensuring that it's a valid job, so does validate_times stay?


Things to validate:
1 - Start time is at or after available start time
2 - Leave time is before or at leave by time
3 - the Time module will deal with validating the inputs as acceptable times
