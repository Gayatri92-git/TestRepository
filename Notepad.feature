Feature: Notepad File Editing
#Background: 
#Given I assign 30 to variable "var1"
#Background:
#Given I assign 1 to variable "var1"
#Given I assign "Is Numeric" to variable "data1"
#Given I assign 10 to variable "NV"
#Given I assign "EN" to variable "NV1"

#@Notepad
Scenario: Open Notepad

Given I "Open Notepad"
When I press keys "Ctrl+Esc"
And I wait 5 seconds
Then I enter "Notepad"
Then I press keys "Enter"
When I wait 5 seconds
And I enter "Hello World"
Then I echo "Notepad"
And I press keys "ALT+F4"
And I echo " Close Notepad"

#@Wordpad
Scenario: Open Wordpad

Given I "Open Wordpad"
When I press keys "Ctrl+Esc"
And I wait 5 seconds
Then I enter "Wordpad"
And I wait 5 seconds
Then I press keys "Enter"
Then I echo "Wordpad"
And I press keys "ALT+F4"
And I echo " Close Wordpad"

@Image
Scenario: To check Image processing

Given I open "Chrome" web browser
Then I navigate to "https://blueyonder.com/" in web browser within 10 seconds
And I wait 5 seconds
And I see image "Image:Images\Blue Yonder.PNG" in web browser within 5 seconds
Then I save screenshot
And I close web browser

@ifelse

Scenario: IfElse 
#Given I assign 30 to variable "var1"
Given I "compare numbers"
If I verify number 20 is greater than 30
	Then I echo "20 is not greater"
ElsIf I verify number 20 is greater than or equal to 30
	Then I echo "20 is not equal to 30"
Else I verify number 20 is less than 30
	Then I echo "20 is smaller number"
EndIf

@While
Scenario: While scenario
Given I assign 30 to variable "var11"
Given I assign 40 to variable "var22"
#While I verify number $var11 is less than equal to $var22
While I verify number $var11 is less than or equal to $var22
    Then I echo "passed"
    #And I increase variable "var1" by 2
    and I increase variable "var11" by 2
    Then I echo $var11
EndWhile

@outline
Scenario Outline:Read Data from csv file
CSV Examples: Datasets/Data1.csv
Given I "Read data from file"
Given I echo "num1"
If I verify number <num1> is equal to <num2>
	Then I echo "Both numbers are same"
Else I echo "Numbers are not same"
EndIf

#to use chevron varibles in other scenarios then use below statement
And I assign chevron variables "num1,num2" to dollar variables
And I assign chevron variables "num1,num2" to dollar variables adding prefix "cycle"
And I echo $cyclenum1

#other way of scenario outline
@Scenout
Scenario Outline: Scenout
Given I echo <name>
And i echo <surname>
Examples:
|name|surname|
|"Gayatri"|"Chakkarwar"|
|"Ram"|"Chakkarwar"|
|"Shipra"|"Chakkarwar"|

@Writedata 
Scenario: Write data into given file
Given I execute scenario "Read Data from csv file"
Given I "Write data into given file"
Once I create file "Datasets/Data.csv"
Then I append "Cat Training" to end of file "Datasets/Data.csv"
Then I echo $num1


@filenotpresent
Scenario: Write data into new file
Given I "Write data into new file"
Given I assign "Datasets/File.csv" to variable "filepath"
If I verify file "$filepath" exists
Then I echo "File is present"
Else I create file "Datasets/File.csv"
EndIf
Then I append "Cat Training" to end of file $filepath
Then I append "Cycle" to end of file $filepath
Then I replace "Cat" with "Cycle" in file "Datasets/File.csv"

@Lists
Scenario:To create list
Given I create list "Cars"
If I verify list "Cars" is empty
Then I echo "No Data present in list"
EndIf
And I append element "Corolla" to list "Cars"
And I append element "BMW" to list "Cars"
And I prepend element "Honda" to list "Cars"
And I echo $Cars
If I verify list "Cars" is not empty
Then I echo "Data present in list"
EndIf
And I sort list "Cars"

#Assignment 1
#Background:
#Given I assign 1 to variable "var1"
@Whilescript
Scenario: While script
Given I create list "Numbers"
While I verify number $var1 is less than 50
And I append element $var1 to list "Numbers"
And I increase variable "var1" by 3
And I echo $var1 
EndWhile
And I echo $Numbers

#Assignment 2
@autosuggestion
Scenario:Open Chrome
#select any one of the option from autosuggestion list
Given I open "Chrome" web browser
Then I navigate to "https://google.com/" in web browser within 10 seconds
When I enter "Hello World"
Then I press keys DOWN 2 times with 1000 ms delay
And I press keys "Enter"
#Then I click element "xPath://span[text()='hello world]" in web browser within 15 seconds

@promptfromuser
Scenario: Enter data manually
Given I execute scenario "Accept Integer only"
Given I "Enter data"
When I prompt "Enter number" and assign user response to variable "data"
Then I assign variable $data by combining "Is Numeric"
And I echo $data $data1

@acceptintegeronly
# It will accept only numeric value from user
Scenario: Accept Integer only
Given I "Accept Integer only"
When I prompt "Number Please" for integer and assign user response to variable "np"
Then I echo $np

@convertstringtointeger
Scenario: Convert string to integer & vice versa
Given I "assign number"
When I convert string variable "NV" to Integer variable "NV"
Then I convert number variable "NV1" to string variable "NV1"
And I echo $NV1

@PrintInDoubleQuotes
Scenario:Print In Double Quotes
Given I assign """"Hello"""" to variable "String"
And I echo $String

@GroovyStatement
Scenario:Execute Groovy statement
Given I execute Groovy "Res=NV1+NV2" within 10 seconds
#Then I execute




@Table
Scenario: Handle market
Given I open "Chrome" web browser
and I navigate to "https://money.rediff.com/gainers" in web browser
Once I see "Top Gainers" in web browser
#When I see element "xPath://div[@class='floatL f22 bold']" in web browser within 15 seconds
#When I see "Auro Labs" in element [@name='Auro Labs'] in table "xPath://table[@class='dataTable']" in web browser
Then I copy value in row "8" column "3" in table "xPath://table[@class='dataTable']" in web browser as variable "dynamic"
#If I see "<TEXT>" in column "<TEXT>" in table "<id|tag|className|cssSelector|text|xPath|linkText|name>:<ELEMENT_NAME>" in web browser
And I echo $dynamic















#@login
Scenario: Login in Gmail

Given I open "chrome" web browser
Then I navigate to "https://www.google.com" in web browser within 20 seconds
#When I see element "xPath://[@class='gb_3 gb_4 gb_9d gb_3c']" in web browser
When I see element "text:Sign in" in web browser
#then i click element "xPath://[@class='gb_3 gb_4 gb_9d gb_3c']" in web browser
then i click element "text:Sign in" in web browser
#When I click element "xPath://input[@type='text']" in web browser
When I see element "xPath://div[@class='rFrNMe N3Hzgf jjwyfe QBQrY zKHdkd sdJrJc Tyc9J']" in web browser
Then i enter "gayatrichakkarwar@gmail.com"
When I see element "xPath://button[@jsname='LgbsSe']" in web browser
Then I click element "xPath://button[@jsname='LgbsSe']" in web browser


And I type "gayatrichakkarwar@gmail.com" in "Email" field in web browser
And I press keys "Next" in web browser
If I type "1234" in "Password" field in web browser
	Then I echo "Invalid credentials"
elsif I type "" in "Passowrd" field in web browser
	Then I echo "Login successfully"
EndIf

#Then I navigate to "xpath://img[@class='gb_Ca gbii']" in web browser within #10 seconds
#And I press keys "Sign Out" in web browser
#And I close web browser



And I multiply variable "<VARIABLE_NAME>" by <NUMBER>
