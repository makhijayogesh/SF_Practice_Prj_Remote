public class RerenderPageMessages {

    public PageReference callB() {
        return null;
    }


    public PageReference callA() {
        return null;
    }


    public RerenderPageMessages() {

    }


public RerenderPageMessages(ApexPages.StandardController stdController) {
}

public PageReference addErrorMessage() {
    ApexPages.AddMessage(new ApexPages.Message(ApexPages.Severity.ERROR, 'Error Message!'));        
    return ApexPages.currentPage();
}

}