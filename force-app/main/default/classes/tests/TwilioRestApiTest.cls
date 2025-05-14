/**
 * TwilioRestApiTest - Test class for TwilioRestApi
 * @see TwilioRestApi
 * 
 * TODO: Implement test methods to verify the functionality of the TwilioRestApi class
 */
@IsTest
private class TwilioRestApiTest {
    
    /**
     * Test handleIncomingSMS method with standard SMS parameters
     * 
     * TODO: Implement this test method to verify handling of standard SMS webhooks
     */
    @IsTest
    static void testHandleIncomingSMSStandard() {
        RestRequest req = new RestRequest();
        RestResponse res = new RestResponse();
        RestContext.request = req;

        req.requestURI = '/services/apexrest/twilio/sms';
        req.httpMethod = 'POST';    
        req.params.put('MessageSid', 'SM123456');
        req.params.put('AccountSid', 'AC123456');
        req.params.put('From', '1234567890');   
        req.params.put('To', '1234567890');
        req.params.put('Body', 'Test message'); 


        Test.startTest();
        String response = TwilioRestApi.handleIncomingSMS();
        Test.stopTest();        

        Assert.isNotNull(response, 'Response should not be null');
        Assert.areEqual('<?xml version="1.0" encoding="UTF-8"?><Response></Response>', response, 'Response should contain expected elements');

        
    }
    
    /**
     * Test handleIncomingSMS method with media attachments
     * 
     * TODO: Implement this test method to verify handling of SMS with media
     */
    @IsTest
    static void testHandleIncomingSMSWithMedia() {
       
        RestRequest req = new RestRequest();
        RestResponse res = new RestResponse();
        RestContext.request = req;

        req.requestURI = '/services/apexrest/twilio/sms';
        req.httpMethod = 'POST';    
        req.params.put('MessageSid', 'SM123456');
        req.params.put('AccountSid', 'AC123456');
        req.params.put('From', '1234567890');   
        req.params.put('To', '1234567890');
        req.params.put('Body', 'Test message'); 
        req.params.put('NumMedia', '1');
        req.params.put('MediaUrl', 'https://fastly.picsum.photos/id/383/200/300.jpg?hmac=sP8wzjNbIJGIPQg-3A86o43HsTopJPnwV73iSCwH9cw');
        req.params.put('MediaContentType', 'image/jpeg');

        RestContext.request = req;  
        RestContext.response = res;
        
        Test.startTest();
        String response = TwilioRestApi.handleIncomingSMS();
        Test.stopTest();

        Assert.isNotNull(response, 'Response should not be null');
        Assert.areEqual('<?xml version="1.0" encoding="UTF-8"?><Response></Response>', response, 'Response should contain expected elements');

    }
    
    /**
     * Test handleIncomingSMS method with location data
     * 
     * TODO: Implement this test method to verify handling of SMS with location data
     */
    @IsTest
    static void testHandleIncomingSMSWithLocation() {

        RestRequest req = new RestRequest();
        RestResponse res = new RestResponse();
        
        req.requestURI = '/services/apexrest/twilio/sms';
        req.httpMethod = 'POST';

        req.params.put('MessageSid', 'SM123456');
        req.params.put('AccountSid', 'AC123456');
        req.params.put('From', '1234567890');       
        req.params.put('To', '1234567890');
        req.params.put('Body', 'Test message');
        req.params.put('FromCity', 'San Francisco');
        req.params.put('FromState', 'CA');
        req.params.put('FromZip', '94103');
        req.params.put('FromCountry', 'US');
    
        RestContext.request = req;  
        RestContext.response = res;

        Test.startTest();
        String response = TwilioRestApi.handleIncomingSMS();
        Test.stopTest();
        Assert.isNotNull(response, 'Response should not be null');
        Assert.areEqual('<?xml version="1.0" encoding="UTF-8"?><Response></Response>', response, 'Response should contain expected elements');
    }
    
    /**
     * Test handleIncomingSMS method with WhatsApp parameters
     * 
     * TODO: Implement this test method to verify handling of WhatsApp messages
     */
    @IsTest
    static void testHandleIncomingSMSWithWhatsApp() {

     RestRequest req = new RestRequest();
        RestResponse res = new RestResponse();
        RestContext.request = req;  
        req.requestURI = '/services/apexrest/twilio/sms';
        req.httpMethod = 'POST';
       
        req.params.put('MessageSid', 'SM123456');
        req.params.put('AccountSid', 'AC123456');
        req.params.put('From', 'whatsapp:+15551234567');    
        req.params.put('To', 'whatsapp:+15551234567');
        req.params.put('Body', 'Test message');
        req.params.put('ProfileName', 'Test Profile');  
        req.params.put('WaId', '1234567890');
        req.params.put('Forwarded', 'false');   
        req.params.put('FrequentlyForwarded', 'false');
        req.params.put('ButtonText', 'Test Button');

        RestContext.request = req;  
        RestContext.response = res;

        Test.startTest();
        String response = TwilioRestApi.handleIncomingSMS();
        Test.stopTest();

        Assert.isNotNull(response, 'Response should not be null');
        Assert.areEqual('<?xml version="1.0" encoding="UTF-8"?><Response></Response>', response, 'Response should contain expected elements');
    }
} 