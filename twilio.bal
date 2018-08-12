import ballerina/http;
import ballerina/io;
import ballerina/log;
import wso2/github4;
import wso2/twilio;

endpoint twilio:Client twilioClient {
    accountSId:"ACfbaac7c14abcbb821063ecb869acfddf",
    authToken:"68406a1bc928638d44bc58bd2c407ee8",
    xAuthyKey:"c2c85b2178e4c444fbb975ba55b4994b"
};

endpoint http:Listener listener {
    port:9090
};

service<http:Service> twilio bind listener {
    twilioSms (endpoint caller, http:Request request) {

        var fromMobile = "+12253148792";
        var toMobile = "+94778113589";
        var message = "You have new commit on your [ballerina-twillo-git-int] repository";

        var details = twilioClient->sendSms(fromMobile, toMobile, message);
        match details {
            twilio:SmsResponse smsResponse => io:println(smsResponse);
            twilio:TwilioError twilioError => io:println(twilioError);
        }
    }
}
