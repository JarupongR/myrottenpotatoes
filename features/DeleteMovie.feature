Feature: User can manually add movie
  As a user. If the movie is wrong or not exist,
  User can be delete it from database.


Scenario: Add a movie and delete it
  Given I am on the RottenPotatoes home page
  When I follow "Add new movie"
  Then I should be on the Create New Movie page
  When I fill in "Title" with "Men In Black"
  And I select "PG-13" from "Rating"
  And I press "Save Changes"
  Then I should be on the More info page
  And I should see "Men In Black"
  When I press "Delete"
  Then I should see "Movie 'Men In Black' deleted."

Scenario: Add 2 or more movies and delete it
    Given I am on the RottenPotatoes home page
    When I follow "Add new movie"
    Then I should be on the Create New Movie page
    When I fill in "Title" with "Men In Black"
    And I select "PG-13" from "Rating"
    And I press "Save Changes"
    Then I should be on the More info page
    And I should see "Men In Black"
    When I follow "RottenPotatoes"
    When I follow "Add new movie"
    Then I should be on the Create New Movie page
    When I fill in "Title" with "Goldfinger"
    And I select "PG-13" from "Rating"
    And I press "Save Changes"
    Then I should be on the Second movie info page
    When I follow "RottenPotatoes"
    Then I should be on the RottenPotatoes home page
    And I should see "Men In Black"
    And I should see "Goldfinger"
    When I follow "More about Men In Black"
    Then I should be on the More info page
    And I press "Delete"
    Then I should see "Movie 'Men In Black' deleted."
    And I should see "Goldfinger"
