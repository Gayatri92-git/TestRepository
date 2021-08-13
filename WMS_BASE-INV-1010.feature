Feature: My Feature

Background:

Scenario:
Given I open "Chrome" web browser
Then I navigate to "http://10.3.10.133:8060/rp/login" in web browser
Then I press keys "Enter"
Once I see element "xPath://input[@id='loginUserName']" in web browser
Then I type "GAYATRI.C" in web browser
Once I see element "xPath://input[@id='loginPassword']" in web browser
Then I press keys TAB in web browser 1 times with 2 seconds delay
Then I type "Temp@1234" in web browser
And I click element "xPath://input[@id='loginButton']" in web browser
If I see "Hello GAYATRI" in web browser within 60 seconds
Then I echo "User Logged in Successfully"
Else I echo "User Not Logged in properly"
EndIf
Once I click element "xPath://input[@type='text']" in web browser
Then I type "Inventory" in web browser
And I press keys "Enter"
Once I click element "xPath://td[text()='Inventory -> Inventory']" in web browser within 60 seconds
Then I echo "Inventory Page is Visible"
Given I assign "Location=CYC_EA_LOC04" to variable "Location"
Then I click element "xPath://input[@id='rpFilterComboBox-1043-inputEl']" in web browser within 100 seconds
And I type $Location in web browser
And I press keys "Enter"
#checkbox
And I click element "xPath://div[contains(@id,'gridview-1171')]//div[@class='x-grid-row-checker']" in web browser within 10 seconds
And I wait 20 seconds
Given I "Verify whether the Location is empty or partially full"
If I see element "xPath://div[text()='Partially Full']" in web browser
Then I echo "Location is Partially Full"
Else I echo "Location is empty"
EndIf
#actions
Once I click element "xPath://span[@id='wmMultiViewActionButton-1604-btnIconEl']" in web browser within 60 seconds
#add inventory menu
Then I click element "xPath://a[@id='menuitem-1612-itemEl']" in web browser
#Item field
Once I see element "name:itemNumber" in web browser within 20 seconds
And I type "SHAMPOO" in element "name:itemNumber" in web browser
And I wait 10 seconds
And I press keys "Enter"
#quantity field
Once I see element "xPath://input[@id='textfield-2276-inputEl']" in web browser
Then I type "2" in element "xPath://input[@id='textfield-2276-inputEl']" in web browser within 20 seconds
#next button
Then I click element "xPath://span[text()='Next']//following-sibling::span[contains(@id,'button')]" in web browser
#logout
Once I click element "xPath://a[@class='x-btn rp-header-menu-btn rp-menu-btn x-unselectable x-btn-default-small x-noicon x-btn-noicon x-btn-default-small-noicon']" in web browser within 20 seconds
Then I click element "xPath://span[text()='Logout']" in web browser within 20 seconds
If I see image "Image:Images/Blue Yonder.PNG" in web browser within 10 seconds
Then I echo "Logged Out Successfully"
Else I echo "Not Logged Out successfully"
EndIf