public class TaskController{
    String tskId {get;set;}
 
    public TaskController(ApexPages.StandardController controller) {
    tskId = apexPages.currentPage().getParameters().get('id');
    }


 Task task;
    integer counter {get;set;}
    String Url {get;set;}
    public Task getTask() {
        if(task == null) 
            task = [select id, status,whoId,WhatId from Task 
                       where id = :ApexPages.currentPage().getParameters().get('id')];
        return task;
    }

public String redirect(){         

  Url = ApexPages.currentPage().getParameters().get('retURL');
  Return Url;
 }
public PageReference hello1() {
system.debug('hi');
        PageReference reference=new PageReference('http://www.google.com');
        reference.setRedirect(true);
        return reference;
    }
}