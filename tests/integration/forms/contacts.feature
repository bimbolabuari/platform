@oauth2Skip
Feature: Testing the Form Contacts API

    Scenario: Creating a new Contact
        Given that I want to make a new "Contact"
        And that the request "data" is:
            """
            {
                "contacts":"59899333222, 59891333222",
                "country_code": "UY"
            }
            """
        When I request "/forms/5/contacts"
        Then the response is JSON
        And the response has a "form_id" property
        And the type of the "form_id" property is "numeric"
        And the response has a "count" property
        And the type of the "count" property is "numeric"
        Then the guzzle status code should be 200

    Scenario: Creating a new Contact
        Given that I want to make a new "Contact"
        And that the request "data" is:
            """
            {
                "contacts":"912899, 223241",
                "country_code": "UY"
            }
            """
        When I request "/forms/5/contacts"
        Then the response is JSON
        Then the guzzle status code should be 422
        And the response has a "errors" property
        And the response has a "errors.1" property
        And the response has a "errors.1.title.contact" property
        And the type of the "errors.1.title.contact" property is "string"
        Then the property "errors.1.title.contact" equals "Invalid phone number"

