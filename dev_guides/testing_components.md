# EPIC Test Stack

Testing is expensive so we wish to develop automated tests as part of our continuous integration pipeline. Automated testing is reliable in that tests are automatically run by tools and scripts. It is also significantly faster than manual testing, and can be run frequently. Manual testing does not scale well, especially considering sprints that have a fixed amount of time and cannot afford to dedicate time for manual testing every time.


![alt text](images/manual_testing_cost.png "Epic Testing Pyramind")
## EPIC Testing Components
Testing components that the team discussed we will use are as follows:

* **BDD Stack** for functional testing
* **Postman** for testing API
* **Storybook** to test Bit common components
* **Snyk** for version and security vulnerability scanning
* **SonarQube** for static code analysis
* **Zap** for security WAVA (web application vulnerability assessment) scanning
* **Linting** to ensure code readability
* **NPM Audit** for vulnerability scans related to npm modules
* **ThreatModeler** for security threat modeling 
* **Unit Tests** to test individual units of software
* **Factory Boy** for test data generation
* **ThreatModeler** is an automated threat modeling solution to be run periodically with NRM security
* **Nagios Reporting** to consolidate the results of all tests into one report

## EPIC Testing Stack

See below for a diagram of our proposed EPIC Testing Stack.

We also rank the levels of the test pyramid in regards to portability, effort, and coverage of the the test/tool.

![alt text](images/epic_test_stack.png "Epic Testing Pyramind")
