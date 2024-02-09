package com.sam.keycloak.sms2fa.gateway;


import com.twilio.Twilio;
import com.twilio.type.PhoneNumber;
import com.twilio.rest.api.v2010.account.Message;

import java.util.Map;

public class TwilioSmsService implements SmsService {

    private final String accountSid;
    private final String authToken;
    private final String fromPhoneNumber;

    public TwilioSmsService(Map<String, String> config) {
        this.accountSid = config.get("accountSid");
        this.authToken = config.get("authToken");
        this.fromPhoneNumber = config.get("fromPhoneNumber");
        // Initialize the Twilio client with account SID and auth token
        Twilio.init(accountSid, authToken);
    }

    @Override
    public void send(String toPhoneNumber, String message) {
        Message.creator(
                new PhoneNumber(toPhoneNumber), // To phone number
                new PhoneNumber(fromPhoneNumber), // From phone number (your Twilio phone number)
                message // Message content
        ).create();
    }
}
