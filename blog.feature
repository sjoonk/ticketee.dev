Feature: Basic Blog
  As a drying paint enthusiast
  I want to publish blog entries
  So that my friends can enjoy my fascinating hobby

  Scenario: Visit home page
    When I go to the home page
    Then I should see the blog title

  Scenario: Post a text entry
    When I go the the home page
    And I start a new post
    And I fill in the title "First Post!"
    And I fill in the body "I just painted a fence!"
    And I submit the entry
    And I return to the home page
    Then I should see a post with title "First Post!"
    And the post body shoud be:
    """
    I just painted a fence!
    """


