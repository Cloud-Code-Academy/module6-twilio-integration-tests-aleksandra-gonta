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
        String body =  '{"sid":"SM123456","status":"sent","body":"Test message"}';
       
        Test.setMock(HttpCalloutMock.class, new TwilioCalloutMock(201, body));
        Test.startTest();
        String toNumber = '+18777804236'; 
        String messageBody = 'Test message';  
        TwilioResponse response = TwilioService.sendSMS(toNumber, messageBody);
        Test.stopTest();

        Assert.isNotNull(response, 'Response should not be null');
        Assert.areEqual(201, response.statusCode, 'Status code should be 201');
        Assert.isTrue(response.success, 'Response is sucessful');
        Assert.isTrue(response.body.contains('SM123456'));
        Assert.isTrue(response.body.contains('sent'));
    }
    
    /**
     * Test the sendSMS method with an error response
     * 
     * TODO: Implement this test method to verify error handling in sendSMS
     */
    @IsTest
    static void testSendSMSError() {
        String body = '{"error": "Error sending SMS", "message": "Invalid phone number"}';
        String toNumber = '+1234567890'; 
        String messageBody = 'Test message';
        Test.setMock(HttpCalloutMock.class, new TwilioCalloutMock(500, body));
        Test.startTest();  
        TwilioResponse response = TwilioService.sendSMS(toNumber, messageBody);
        System.debug('Response: ' + response);
        Test.stopTest();

        Assert.isNotNull(response, 'Response should not be null');
        Assert.areEqual(500, response.statusCode, 'Status code should be 500');
        Assert.areEqual(false, response.success, 'Response is not sucessful');
        Assert.isTrue(response.body.contains('Error sending SMS'));
        System.debug('Error message: ' + response);
    }
    
    /**
     * Test the getMessages method
     * 
     * TODO: Implement this test method to verify the getMessages functionality
     */
    @IsTest
    static void testGetMessages() {
        String body = 
            '{' +
            '  "end": 2,' +
            '  "messages": [' +
            '    {' +
            '      "account_sid": "ACbe591149b27ec2dfccd61dc8a5e35ec3",' +
            '      "body": "Test message 1",' +
            '      "from": "+16073502062"' +
            '    },' +
            '    {' +
            '      "account_sid": "ACbe591149b27ec2dfccd61dc8a5e35ec3",' +
            '      "body": "Test message 2",' +
            '      "from": "+16073502062"' +
            '    }' +
            '  ],' +
            '  "page": 0,' +
            '  "page_size": 5' +
            '}';

        Test.setMock(HttpCalloutMock.class, new TwilioCalloutMock(200, body));
        Test.startTest();
        TwilioResponse messagesResponse = TwilioService.getMessages(5);
        Test.stopTest();

        Assert.isNotNull(messagesResponse, 'Response should not be null');
        Assert.areEqual(200, messagesResponse.statusCode, 'Status code should be 200');
        Assert.isTrue(messagesResponse.success, 'Response is sucessful');
        Assert.isTrue(messagesResponse.body.contains('messages'));
    }
    
    /**
     * Test the getMessages method with null/invalid limit
     * 
     * TODO: Implement this test method to verify handling of edge cases
     */
    @IsTest
    static void testGetMessagesWithInvalidLimit() {
             String body = 
            '{' +
            '  "end": 2,' +
            '  "messages": [' +
            '    {' +
            '      "account_sid": "ACbe591149b27ec2dfccd61dc8a5e35ec3",' +
            '      "body": "Test message 1",' +
            '      "from": "+16073502062"' +
            '    },' +
            '    {' +
            '      "account_sid": "ACbe591149b27ec2dfccd61dc8a5e35ec3",' +
            '      "body": "Test message 2",' +
            '      "from": "+16073502062"' +
            '    }' +
            '  ],' +
            '  "page": 0,' +
            '  "page_size": 5' +
            '}';

        Test.setMock(HttpCalloutMock.class, new TwilioCalloutMock(200, body));
        Test.startTest();
        TwilioResponse negativeMessagesResponse = TwilioService.getMessages(-3);
        TwilioResponse nullMessagesResponse = TwilioService.getMessages(null);
        Test.stopTest();
        
        Assert.areEqual(200, negativeMessagesResponse.statusCode, 'Status code should be 200');
        Assert.isTrue(negativeMessagesResponse.success, 'Response is sucessful');
        Assert.areEqual(200, nullMessagesResponse.statusCode, 'Status code should be 200');
        Assert.isTrue(nullMessagesResponse.success, 'Response is sucessful');
    }
    
    /**
     * Test exception handling in makeHttpRequest
     * 
     * TODO: Implement this test method to verify exception handling
     */
    @IsTest
    static void testMakeHttpRequestException() {
        String toNumber = '+1234567890'; 
        String messageBody = 'Test message';
        Test.setMock(HttpCalloutMock.class, TwilioCalloutMock.createExceptionMock());
        Test.startTest();    
        TwilioResponse response = TwilioService.sendSMS(toNumber, messageBody);
        Test.stopTest();
        Assert.areEqual(500, response.statusCode, 'Status code should be 500');
        Assert.areEqual(false, response.success, 'Response is not sucessful');
        Assert.isTrue(response.body.contains('Mock exception for testing'), 'Response body should contain the exception message');
    }
} 