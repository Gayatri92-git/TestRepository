Feature: Infinity Stone Utilities

@wip
Scenario: Counter
#When I decrease variable "counter" by 1
When I increase variable "counter" by 1

@wip
Scenario: Continue Check
#When I assign value "FALSE" to unassigned variable "continue"
When I assign "FALSE" to variable "continue"

@wip
Scenario: Validation Utility
#If I verify text "continue" is equal to "FALSE"
#Then I fail step with error message "I don't want to continue - I want to fail!"
#EndIf
If I verify text $continue is equal to "TRUE"
	Then I fail step with error message "I don't want to continue - I want to fail!"
EndIf

@wip
Scenario: Check Switch
#Given I assign 0 to variable "switch"
#If I verify number $switch is greater than 10
#Then I fail step with error message "Switch overloaded!"
#EndIf

If I verify number $switch is less than 10
And I increase variable "switch" by 1
Else I fail step with error message "Switch overloaded!"
EndIf

@wip
Scenario: Increment Inner Counter
When I execute scenario "Counter"
And I increase variable "inner_counter" by 1

@wip
Scenario: Increment Outer Counter
When I execute scenario "Counter"
And I increase variable "outer_counter" by 1
