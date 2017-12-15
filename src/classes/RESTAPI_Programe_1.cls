@RestResource(urlmapping='/v1/accounts/*')
global with sharing class RESTAPI_Programe_1 {

    @HTTPGet
     global static Account doGet()
     {
         RestRequest req=RestContext.request;
         RestResponse res=RestContext.response;
         String accountId=req.requestURI.substring(req.requestURI.lastIndexOf('/')+1);
         Account result=[select Id,name,phone from Account where Id=:accountId];
         return result;
     }
}

/*
 * How to call this webService from Workbench
 * The Path will be for Get Option
 * /services/apexrest/v1/accounts/0012800000Hywf1
*/