Feature: HTMLPage
  In order to portray or pluralize htmlpage
  As a CLI
  I want to be as objective as possible

  Scenario: Test answerMarkdown
    When I run `zhSieve portray 43830406`
    Then the output should contain "43830406"