package com.sam.keycloak.sms2fa.gateway;

public interface SmsService {

	void send(String phoneNumber, String message);

}
