Feature: click at "RottenPota" and it make user go to home page back 

Scenario: click banner
  Given I am on the RottenPotatoes home page
  When I follow "RottenPotatoes"
  Then I should be on the RottenPotatoes home page

Scenario: click banner on info page
  Given I am on the RottenPotatoes home page
  When I follow "Add new movie"
  Then I should be on the Create New Movie page
  When I fill in "Title" with "Men In Black"
  And I select "PG-13" from "Rating"
  And I press "Save Changes"
  Then I should be on the More info page
  When I follow "RottenPotatoes"
  Then I should be on the RottenPotatoes home page

Scenario: click banner on create page
  Given I am on the RottenPotatoes home page
  When I follow "Add new movie"
  Then I should be on the Create New Movie page
  When I follow "RottenPotatoes"
  Then I should be on the RottenPotatoes home page