Feature: User can manually add movie
  As a user. If it doesn't have a movie database
  (This movie are existed) User can be add the Movie to 
  database

Scenario: Add a movie
  Given I am on the RottenPotatoes home page
  When I follow "Add new movie"
  Then I should be on the Create New Movie page
  When I fill in "Title" with "Men In Black"
  And I select "PG-13" from "Rating"
  And I press "Save Changes"
  Then I should be on the More info page
  And I should see "Men In Black"