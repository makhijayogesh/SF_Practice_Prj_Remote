public class ActionFunctionSampleCls {
public string NameParameter{get;set;}
public string val{get;set;}

    public PageReference CallController()
    {
    // val=ApexPages.CurrentPage().getParameters().get('NameValue');
     val=NameParameter;
     system.debug('Val >>> ' + val );
     return null;
    }
     
}