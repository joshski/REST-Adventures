Feature: Dungeon
  As an old-school gamer 
  I want a dungeon adventure
  
  Scenario: Explore dungeon
    Given there is an entrance
    And a room to the east of the entrance
    And a second room to the south of the first room
    And a treasure chamber to the west of the second room
    When I enter the dungeon
    And I go east
    And I go south
    And I go west
    Then I should be in the treasure chamber

  
