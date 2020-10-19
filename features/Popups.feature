Feature: Popup show when press more about + Movies Name
    As a user. When I press 'more about'.
    It should show info and describtion.

Scenario: Add a movie for example and then see info page
  Given I am on the RottenPotatoes home page
  When I follow "Add new movie"
  Then I should be on the Create New Movie page
  When I fill in "Title" with "Men In Black"
  And I select "PG-13" from "Rating"
  And I press "Save Changes"
  Then I should be on the More info page
  When I follow "RottenPotatoes" 
  Then I should be on the RottenPotatoes home page
  And I should see "Men In Black"
  Given I am on the RottenPotatoes home page
  When I follow "More about Men In Black"
  Then I should see "Description"
  And I should see "Details about Men In Black"