Feature: This is first feature

#  Scenario: First scenario
#    When I started browser
#    Then Everything is good

  Scenario Outline: Addition of two numbers
    Given I have calculator ruby class
    When I set <a1> number and <b1> number
    And I request sum of this numbers
    Then I the <sum> is correct

    Examples:
      | a1 | b1 | sum|
      | 3  | 5  | 8  |
      | 13 | 15 | 28 |
      | 136|256 |392 |
      | 23 | 54 |77  |

  Scenario Outline: Addition of two numbers
    Given I have calculator ruby class
    When I set <a1> number and <b1> number
    And I request mult of this numbers
    Then I <mult> is correct

    Examples:
      | a1  | b1  | mult |
      |  2  |  3  |  6   |
      |  6  |  8  |  48  |
      |  11 |  11 |  121 |

  Scenario Outline: Login in my site
    Given I have a login form
    When I set <login> and <password>
    Then I the try has <status>

    Examples:
    |login| password| status|
    |    a| b       | succes|
    |   b | a       |failed |


    Scenario: I have photo gallery
      Given I have page with photo gallery page
      When I can switch photos in accordeon style
      Then I have 5 photos
