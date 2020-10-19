Feature: User can see Movie information
    As a User I need to see info of the movies
    that exist in database.


Scenario: First Scenario and back to homepage and check info again
  Given I am on the RottenPotatoes home page
  When I follow "Add new movie"
  Then I should be on the Create New Movie page
  When I fill in "Title" with "Men In Black"
  And I select "PG-13" from "Rating"
  And I press "Save Changes"
  When I follow "RottenPotatoes"
  Then I should be on the RottenPotatoes home page
  And I should see "Men In Black"
  When I follow "More about Men In Black"
  Then I should see "Description"
  And I should see "Details about Men In Black"
  Then I should be on the More info page