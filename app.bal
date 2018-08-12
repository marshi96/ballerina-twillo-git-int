import ballerina/config;
import ballerina/http;
import ballerina/io;
import wso2/github4;
import ballerina/time;

function main(string... args) {
    endpoint github4:Client githubClient {
        clientConfig: {
            auth:{
                scheme:http:OAUTH2,
                accessToken:"c725619f431f04d094fe38b8682ecf1522c1e158"
            }
        }
    };

    github4:Repository repository = {};
    var repo = githubClient->getRepository("code-tesh/test");
    match repo {
        github4:Repository rep => {
            repository = rep;
        }
        github4:GitClientError err => {
            io:println(err);
        }
    }

    var time = repository.updatedAt;

    

    if (time != repository.updatedAt) {

        // Do the SMS
        
    }

    io:println(repository.updatedAt);
}