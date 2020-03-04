// // Copyright (c) 2020 WSO2 Inc. (http://www.wso2.org) All Rights Reserved.
// //
// // WSO2 Inc. licenses this file to you under the Apache License,
// // Version 2.0 (the "License"); you may not use this file except
// // in compliance with the License.
// // You may obtain a copy of the License at
// //
// // http://www.apache.org/licenses/LICENSE-2.0
// //
// // Unless required by applicable law or agreed to in writing,
// // software distributed under the License is distributed on an
// // "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
// // KIND, either express or implied.  See the License for the
// // specific language governing permissions and limitations
// // under the License.

// import ballerina/log;
// import ballerina/test;

// // change to configuration
// Configuration slackConfig1 = {
//     // oAuth2Config // proxy, timeout
//     oAuth2Config: {
//         accessToken: "xoxp-943581362995-944917875025-943586035043-3e31c8bb444e3dfc434f684c7bfbe075"
//     }
// };

// Client slackClient = new(slackConfig1);
// ConversationClient conv = slackClient.getConversationsClient();
// ChatClient chat = slackClient.getChatClient();
// FileClient files = slackClient.getFileClient();
// UserClient users = slackClient.getUserClient();

// string channelName1 = "test-slack-connector";
// string channelName2 = "channel2";
// string channelId = "CU31FE5EC";
// string userName = "b7a.demo";
// string fileId = "";
// string filePath = "src/slack/Module.md";

// @test:Config {}
// function testPostTextMessage() {
//     log:printInfo("slackClient->postMessage()");

//     var response = chat->postMessage(channelName1, "Hello Channel");
//     if (response is string) {
//         test:assertEquals(response, channelId);
//     } else {
//         test:assertFail(msg = <string>response.detail()?.message);
//     }
// }

// @test:Config {}
// function testListConversations() {
//     log:printInfo("slackClient->testListConversations()");

//     var response = conv->listConversations();
//     if (response is error) {
//         test:assertFail(msg = <string>response.detail()?.message);
//     } 
// }

// @test:Config {}
// function testGetConversationInfo() {
//     log:printInfo("slackClient->testGetConversationInfo()");

//     var response = conv->getConversationInfo(channelName1);
//     if (response is error) {
//         test:assertFail(msg = <string>response.detail()?.message);
//     } 
// }

// @test:Config {}
// function testJoinConversation() {
//     log:printInfo("slackClient->testJoinConversation()");

//     var response = conv->joinConversation(channelName1);
//     if (response is error) {
//         test:assertFail(msg = <string>response.detail()?.message);
//     } 
// }

// @test:Config {}
// function testGetUserInfo() {
//     log:printInfo("slackClient->testGetUserInfo()");

//     var response = users->getUserInfo(userName);
//     if (response is error) {
//         test:assertFail(msg = <string>response.detail()?.message);
//     } else {
//         test:assertEquals(response.name, userName);
//     }
// }

// @test:Config {}
// function testUploadFile() {
//     log:printInfo("slackClient->testUploadFile()");
//     string filePath = "src/slack/Module.md";

//     var response = files->uploadFile(filePath, channelName1);
//     if (response is error) {
//         test:assertFail(msg = <string>response.detail()?.message);
//     } else {
//         test:assertEquals(response.name, "Module.md");
//     }
// }

// @test:Config {}
// function testListFiles() {
//     log:printInfo("slackClient->testListFiles()");

//     var response = files->listFiles(channelName1);
//     if (response is error) {
//         test:assertFail(msg = <string>response.detail()?.message);
//     } 
// }

// @test:Config {
//     before:"uploadFileToTest"
// }
// function testGetFileInfo() {
//     log:printInfo("slackClient->testGetFileInfo()");

//     var response = files->getFileInfo(fileId);
//     if (response is error) {
//         test:assertFail(msg = <string>response.detail()?.message);
//     } else {
//         test:assertEquals(response.name, "Module.md");
//     }
// }

// function uploadFileToTest() {
//     log:printInfo("upload file to be used in tests");
//     var response = files->uploadFile(filePath, channelName1);
//     if (response is error) {
//         test:assertFail(msg = <string>response.detail()?.message);
//     } else {
//         fileId = <@untainted> response.id;
//     }
// }

// @test:Config {
//     before:"uploadFileToTest"
// }
// function testDeleteFile() {
//     log:printInfo("slackClient->testDeleteFile()");

//     var response = files->deleteFile(fileId);
//     if (response is error) {
//         test:assertFail(msg = <string>response.detail()?.message);
//     } 
// }

// @test:Config {}
// function testRemoveUser() {
//     log:printInfo("slackClient->testRemoveUser()");

//     var response = conv->removeUserFromConversation(channelName1, userName);
//     if (response is error) {
//         test:assertEquals(response.toString(), "error cant_kick_self ");
//     } 
// }

// @test:Config {
//     after: "renameAfterTest"
// }
// function testRenameConversation() {
//     log:printInfo("slackClient->testRemoveUser()");

//     var response = conv->renameConversation(channelName1, "channel2");
//     if (response is error) {
//         test:assertFail(msg = response.toString());
//     } else {
//         test:assertEquals(response.name, "channel2");
//     }
// }

// function renameAfterTest() {
//     log:printInfo("upload file to be used in tests");
//     var response = conv->renameConversation("channel2", channelName1);
//     if (response is error) {
//         test:assertFail(msg = response.toString());
//     } 
// }

// @test:Config {
//     before: "archiveConvToUseInTests"
// }
// function testUnarchiveConveration() {
//     log:printInfo("slackClient->testUnarchiveConveration()");

//     var response = conv->unArchiveConversation(channelName1);
//     if (response is error) {
//         test:assertFail(msg = response.toString());
//     } 
// }

// function archiveConvToUseInTests() {
//     log:printInfo("Archive conv to use in tests");
//     var response = conv->archiveConversation(channelName1);
//     if (response is error) {
//         test:assertFail(msg = response.toString());
//     } 
// }