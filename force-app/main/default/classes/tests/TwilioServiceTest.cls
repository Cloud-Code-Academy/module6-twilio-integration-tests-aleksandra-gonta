/**
 * TwilioServiceTest - Test class for TwilioService
 * @see TwilioService
 * 
 * TODO: Implement test methods to verify the functionality of the TwilioService class
 */
@IsTest
private class TwilioServiceTest {
    
    /**
     * Test the sendSMS method with a valid request
     * 
     * TODO: Implement this test method to verify that sending an SMS works correctly
     */
    @IsTest
    static void testSendSMS() {
        String body = '{"account_sid": "ACbe591149b27ec2dfccd61dc8a5e35ec3", "api_version": "2010-04-01", "body": "Sent from your Twilio trial account - Test message from Salesforce 2025-05-11 13:47:01", "date_created": "Sun, 11 May 2025 13:47:01 +0000", "date_sent": null, "date_updated": "Sun, 11 May 2025 13:47:01 +0000", "direction": "outbound-api", "error_code": null, "error_message": null, "from": "+16073502062", "messaging_service_sid": null, "num_media": "0", "num_segments": "1", "price": null, "price_unit": "USD", "sid": "SM3024e53ddcf2928575600eced9dc5551", "status": "queued", "subresource_uris": {"media": "/2010-04-01/Accounts/ACbe591149b27ec2dfccd61dc8a5e35ec3/Messages/SM3024e53ddcf2928575600eced9dc5551/Media.json"}, "to": "+18777804236", "uri": "/2010-04-01/Accounts/ACbe591149b27ec2dfccd61dc8a5e35ec3/Messages/SM3024e53ddcf2928575600eced9dc5551.json"}';
        
       
        Test.setMock(HttpCalloutMock.class, new TwilioCalloutMock(201, body));
        Test.startTest();
        String toNumber = '+18777804236'; 
        String messageBody = 'Test message';  
        TwilioResponse response = TwilioService.sendSMS(toNumber, messageBody);
        Test.stopTest();

        Assert.isNotNull(response, 'Response should not be null');
        Assert.areEqual(201, response.statusCode, 'Status code should be 201');
        Assert.isTrue(response.success, 'Response is sucessful');
        Assert.isTrue(response.body.contains('account_sid'));
        Assert.isTrue(response.body.contains('status'));
    }
    
    /**
     * Test the sendSMS method with an error response
     * 
     * TODO: Implement this test method to verify error handling in sendSMS
     */
    @IsTest
    static void testSendSMSError() {
        // TODO: Setup test data
        // - Create test phone number and message body
        
        // TODO: Setup mock callout response
        // - Use TwilioCalloutMock to simulate an error response
        
        // TODO: Execute the test
        // - Call TwilioService.sendSMS() method
        
        // TODO: Verify results
        // - Verify that response is not successful
        // - Verify error status code is correct
        // - Verify error message is extracted correctly
        String body = '{}';
        
        String toNumber = '+1234567890'; 
        String messageBody = 'Test message';
        Test.setMock(HttpCalloutMock.class, new TwilioCalloutMock(500, body));
        Test.startTest();  
        TwilioResponse response = TwilioService.sendSMS(toNumber, messageBody);
        Test.stopTest();

        Assert.isNotNull(response, 'Response should not be null');
        Assert.areEqual(500, response.statusCode, 'Status code should be 500');
        Assert.isTrue(!response.success, 'Response is not sucessful');
    }
    
    /**
     * Test the getMessages method
     * 
     * TODO: Implement this test method to verify the getMessages functionality
     */
    @IsTest
    static void testGetMessages() {
        // TODO: Setup mock callout response
        // - Use TwilioCalloutMock to simulate a successful response with message list
        
        // TODO: Execute the test
        // - Call TwilioService.getMessages() method with an appropriate limit
        
        // TODO: Verify results
        // - Verify that response is successful
        // - Verify status code is correct
        // - Verify response body contains expected messages data
    }
    
    /**
     * Test the getMessages method with null/invalid limit
     * 
     * TODO: Implement this test method to verify handling of edge cases
     */
    @IsTest
    static void testGetMessagesWithInvalidLimit() {
        // TODO: Setup mock callout response
        // - Use TwilioCalloutMock to simulate a successful response
        
        // TODO: Execute the test with null limit
        // - Call TwilioService.getMessages() method with null
        
        // TODO: Execute the test with negative limit
        // - Call TwilioService.getMessages() method with a negative number
        
        // TODO: Verify results
        // - Verify that both responses are successful
        // - Verify that the service handles these edge cases correctly
    }
    
    /**
     * Test exception handling in makeHttpRequest
     * 
     * TODO: Implement this test method to verify exception handling
     */
    @IsTest
    static void testMakeHttpRequestException() {
        // TODO: Setup mock that throws exception
        // - Use TwilioCalloutMock.createExceptionMock()
        
        // TODO: Execute the test
        // - Call a TwilioService method that will use the mock
        
        // TODO: Verify results
        // - Verify that response indicates failure
        // - Verify that status code is set to 500 (or appropriate error code)
        // - Verify that error message is set correctly
        String toNumber = '+1234567890'; 
        String messageBody = 'Test message';
        Test.setMock(HttpCalloutMock.class, TwilioCalloutMock.createExceptionMock());
        Test.startTest();    
        TwilioResponse response = TwilioService.sendSMS(toNumber, messageBody);
       
        Test.stopTest();
        Assert.areEqual(500, response.statusCode, 'Status code should be 500');
    }
} 