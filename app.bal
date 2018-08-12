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
                accessToken:"ecab081dc7ff13836a482baeba2ce0903b336c6f"
            }
        }
    };

    github4:Repository repository = {};
    var repo = githubClient->getRepository("code-tesh/ballerina-twillo-git-int");
    match repo {
        github4:Repository rep => {
            repository = rep;
        }
        github4:GitClientError err => {
            io:println(err);
        }
    }

    // Previous time stamp 
    
    var time = repository.updatedAt;

    

    if (time != repository.updatedAt) {

        // Do the SMS
        
    }

    io:println(repository.updatedAt);
}