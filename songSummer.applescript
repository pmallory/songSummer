tell application "iTunes"
	if selection is not {} then -- if there ARE tracks selected...
		set total to 0
		set sel to a reference to selection
		repeat with aTrack in sel
			set total to (total + (get duration of aTrack) * (get played count of aTrack))
		end repeat
		
		log total
		
		set monthz to (round ((total / 2.628E+6)) rounding toward zero) as text
		set dayz to (round ((total / 8.64E+4) mod 30.42) rounding toward zero) as text
		set hrs to (round ((total / 3600) - (monthz * 730) - (dayz * 24)) rounding toward zero) as text
		set mins to (round ((total / 60) mod 60) rounding toward zero) as text
		set secs to ((round (total mod 60) / 0.1) * 0.1) as text -- rounds to one decimal place		
		
		display dialog secs & " seconds
" & mins & " minutes
" & hrs & " hours
" & dayz & " days
" & monthz & " months" buttons ("OK") default button 1
		
	end if
end tell