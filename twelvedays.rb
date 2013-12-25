#!/usr/bin/ruby

ORDINALS = {}

%w| zeroth first second third fourth fifth 
       sixth seventh eighth ninth tenth 
       eleventh twelfth |.each_with_index{ |word,i| ORDINALS[i] = word }

require 'date'

if Date.today.month == 12 && Date.today.day > 24
  last_christmas_eve_year = Date.today.year
else
  last_christmas_eve_year = Date.today.year - 1
end
   
christmas_eve = Date.parse(last_christmas_eve_year.to_s + '-12-24')

which_day = Date.today.jd - christmas_eve.jd

if which_day.between?(1,12)
	greeting = "A very merry " + ORDINALS[which_day] + " day of Christmas to you and yours!"
else
	greeting = "It doesn't seem to be Christmastide at present."
end

begin
  print greeting unless greeting.nil?
rescue
  exit
end
