Feature: User can Edit Movie information
    As a User. I might be able to edit 
    Movies's Information or Update them

Scenario: Add a movie for example and then Edit info page
  Given I am on the RottenPotatoes home page
  When I follow "Add new movie"
  Then I should be on the Create New Movie page
  When I fill in "Title" with "Men In Black"
  And I select "PG-13" from "Rating"
  And I press "Save Changes"
  Then I should be on the More info page
  When I follow "Edit info"
  Then I should be on the Edit info page
  When I fill in "Description" with "Spy and Alien story"
  And I select "PG" from "Rating"
  And I press "Update Movie Info"
  Then I should be on the More info page
  And I should see "Men In Black was successfully updated."
