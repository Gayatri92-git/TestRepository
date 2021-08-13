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
# Date: 09-JULY-2021
# Description: This exercise will reinforce your knowledge
# on using Backgrounds and Variables, as well as provide a
# practical usage of a While loop.
############################################################ 
Feature: Hello Mr Fibonacci
Background:
Given I assign "Hello" to variable "var1"
Given I assign 1 to variable "first"
And I assign 1 to variable "second"
And I assign " " to variable "result"
And I assign 2 to variable "count1"
And I assign 0 to variable "sum"
And I assign 1 to variable "count2"

@instructions @1 
Scenario: Hello World
Given I "update the Feature File Header with my name and the current date"
When I "execute the scenario"

@instructions @2
Scenario: Hello Me
When I "add a Background that assigns my name to a variable"
And I "update it to say 'Hello' to the variable"

Given I assign variable "var1" by combining $var1 " Gayatri"
And I echo $var1

@instructions @3
Scenario: Hello No One
When I "add a Step to verify that the name variable is assigned and not an empty string"

@instructions @4
Scenario: Fibonacci
When I "create a new Scenario that echoes the first 5 numbers in the Fibonacci sequence"

@instructions @5
Scenario: Dynamic Fibonacci
Given I "set the variable x to a number in the Background"
When I "update the Fibonacci Scenario so that it echoes the first x numbers in the Fibonacci sequence where x is a number assigned to a variable"
And I "use a While loop to do this"
And I "set the variable x = 10"
Then I "echo '1, 1, 2, 3, 5, 8, 13, 21, 34, 55'"

@instructions @6
Scenario: Fibonacci Sum
When I "update the Fibonacci Scenario so it stores the list of numbers in variable y rather than echoing it"
And I "update the Fibonacci Scenario so it stores the sum of the numbers in a second variable z"

Then I "set the variable to x = 10"
And I "see that y = '1, 1, 2, 3, 5, 8, 13, 21, 34, 55'"
And I "see that z = 143"

@instructions @7
Scenario: Hello Variable
Given I "update the 'Hello World' Scenario to store the greeting message in a variable rather than performing an echo"
And I "create a Utility Feature File"
And I "move the 'Hello World' and 'Fibonacci' scenarios into the Utility Feature File"
And I "import this newly created Utility Feature File into this Feature File's Background"

When I "create a Scenario that executes the two Utility scenarios to echo a greeting to the name stored in the variable, list the first X numbers in the Fibonacci Sequence, and the sum of these numbers."

Then I "set the variable to x = 5"
And I "set the username variable to my name"
And I "echo 'Hello (My Name). The first 5 numbers in the Fibonacci Sequence are 1, 1, 2, 3, 5. The sum of these numbers is 12."

@exercise
Scenario: Hello World
When I echo "Hello World"

@fibonacci
Scenario: Fibonacci Series
Given I "Working on Fibonacci Series"
When I create list "FibonacciSeries"
Then I append element $first to list "FibonacciSeries"
Then I append element $second to list "FibonacciSeries"
Then I execute Groovy "sum=first+second"
Then I prompt "length of series" and assign user response to variable "length_series"
While I verify number $length_series is greater than $count1
Then I execute Groovy "result=first+second"
And I echo $result
While I verify number $count2 is less than $count1
Then I append element $result to list "FibonacciSeries"
Then I execute Groovy "sum=sum+result"
And I increase variable "count2" by 1
EndWhile
Then I assign $second to variable "first"
Then I assign $result to variable "second"
And I increase variable "count1" by 1
EndWhile
Then I echo "Here is Fibonacci Series"
Then I echo $FibonacciSeries
Then I echo $sum











