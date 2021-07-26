###########################################################
# Copyright 2020, Tryon Solutions, Inc.
# All rights reserved.  Proprietary and confidential.
#
# This file is subject to the license terms found at 
# https://www.cycleautomation.com/end-user-license-agreement/
#
# The methods and techniques described herein are considered
# confidential and/or trade secrets. 
# No part of this file may be copied, modified, propagated,
# or distributed except as authorized by the license.
###########################################################
# Name: Gayatri Chakkarwar
# Date: 08-JULY-2021
# Description: This exercise plays around with fitting "gizmos"
#  into a bag that can only fit a certain number of "gizmos"
#  This exercise should give you more experience with 
#  If-statements and While-loops
############################################################ 
Feature: It Just Fits

Background: 
Given I assign 60 to variable "gizmos"

@instructions @1
Scenario: Setting up Feature File
Given I "update the Feature File Header with my name and the current date"
And I "have a bag that can fit 50 “gizmos” inside of it."

When I "set the variable “gizmos” to a number greater than 50 in the Background"
And I "run the test and see that fails"

Then I "see on line 48 an If statement that checks that $gizmos is less than or equal to 50. If you changed what $gizmos was equal to, we could make it fit."

@instructions @2
Scenario: If I Have More Options
Given I "have a second bag that can fit 70 gizmos, but we want to use the smaller bag if we can"
When I "an ElsIf statement that follows the If statement that checks if Gizmos is less than 70"
And I "echo 'This will fit in the big bag' if $gizmos is greater than 50 but less than or equal to 70"
Then I "update $gizmos so that it is greater than 50 but less than 70" 
And I "run the test"
And I "see that the test passes"

@instructions @3
Scenario: While Away the Time
Given I "have decided I do not want to use my big bag but I still want to bring as many gizmos as possible"
When I "replace the entire if-statement with a while loop"
and I "have the while-loop reduce $gizmos by 1 each time it loops until we have 50 or fewer Gizmos"
And I "run the test"
And I "see that the test passes"

@instructions @4
Scenario: A Gizmo Saved is a Gizmo Earned
Given I "don't want to waste time removing a lot of gizmos"
When I "wrap an if-statement around the while statement so that the while-loop only runs if $gizmos is set to a number less than or equal to 75"
And I "add an Else statement that says 'That's too many gizmos!'"
Then I "run the test"
And I "see that the test passes if $gizmos is set to 75 or fewers Gizmos or fails otherwise"

Scenario: It Just Fits
If I verify number $gizmos is less than or equal to 50
	Then I echo "It fits!"
Else I echo "Too many gizmos!"
EndIf

######################################################################
@exercise
Scenario: It Fits
If I verify number $gizmos is greater than 50
Then I echo "I run the test and it fails"
While I verify number $gizmos is greater than or equal to 50
Then I decrease variable "gizmos" by 1
Then I echo "It Fits"
EndWhile
EndIf

@exercise1
Scenario: exercise1
If I verify number $gizmos is less than 70
Then I echo "This will fit in the big bag"
If I verify number $gizmos is greater than 50
And I verify number $gizmos is less than 70
Then I echo "I run the test and sees that test passes"
EndIf
EndIf

@exercise3
#correct code-only need to change number 70 or 75 as per requirement
Scenario: It Fits
If I verify number $gizmos is less than or equal to 75
While I verify number $gizmos is greater than 50
Then I decrease variable "gizmos" by 1
EndWhile
And I echo $gizmos
EndIf

#If I verify number $gizmos is greater than 50
#Then I echo "I run the test and it fails"
#If I verify number $gizmos is less than 70
#Then I echo "This will fit in the big bag"
#While I verify number $gizmos is greater than or equal to 50

#Then I echo "I run the test and sees that test passes"

#EndIf
#EndWhile

@exercise5
Scenario:exercise5

While I verify number $gizmos is less than or equal to 75

Then I decrease variable "gizmos" by 1
If I verify number $gizmos is greater than or equal to 50
Then I decrease variable "gizmos" by 1
And I echo "I run the test and sees that test passes"
EndIf
EndWhile



@exercise4
Scenario: Exercise 4
While I verify number $gizmos is less than 70
If I verify number $gizmos is greater than or equal to 50
Then I decrease variable "gizmos" by 1
And I echo "I run the test and sees that test passes"
EndIf
Then I echo "This will fit in the big bag"
EndWhile

