public with sharing class CustomAttachmentCls 
{

   
    public Account acMain{get;set;}
    public Attachment attachment1 { get; set; }
    public Attachment attachment2 { get; set; }
    public Attachment attachment3 { get; set; }
    public String recIds {get;set;}
    public Blob atBody1{get;set;}
    public Blob atBody2{get;set;}
    public Blob atBody3{get;set;}
     
    public string atName{get;set;}
    public string atName1{get;set;}
    public string atName2{get;set;}
    public boolean blShow{get;set;}
    public boolean blShowDet{get;set;}
    
    public CustomAttachmentCls(ApexPages.StandardController controller) 
    {
        acMain = (Account) controller.getRecord();
        attachment1 = new Attachment();
        attachment2 = new Attachment();
        attachment3 = new Attachment();
        blShow = false;
        blShowDet = true;
    }

    //Get List of All Attachments
    Public List<Attachment> getAllAttachments()
    {
        List<Attachment> attList = new List<Attachment>();
        attList = [SELECT iD, NAME,ParentId,ContentType FROM ATTACHMENT WHERE PARENTID=:acMain.Id];
        return attList;
    }
    
    //Creating the Attachments
    public PageReference createRecordAndAttachments()
    {
        List<Attachment> atList = new List<Attachment>();        
        System.Debug('Attachment 1 Body:' + ' ' + attachment1.Body);
        
        // Insert Attachments;
        attachment1.name= atName;
        attachment1.Body = atBody1;
        attachment2.name= atName1;
        attachment2.Body = atBody2;
        attachment3.name= atName2;
        attachment3.Body = atBody3;
        
        
        attachment1.ParentId = acMain.Id;
        attachment2.ParentId = acMain.Id;
        attachment3.ParentId = acMain.Id;
        
        if(attachment1.name !=null && attachment1.body !=null)
        {
            atList.add(attachment1);
        }
        if(attachment2.name !=null && attachment2.body !=null)
        {
            atList.add(attachment2);
        }
        if(attachment3.name !=null && attachment3.body !=null)
        {
            atList.add(attachment3);
        }
        if(atList.size() > 0)
        {
            insert atList;
        }
        
        
        PageReference pg = ApexPages.currentPage();
        pg.setRedirect(true);
        // View the record
        return pg;
    }
    //Go for adding individual files
    public void doAddAttach()
    {
        blShow=true;
        blShowDet = false;
    }
    public void doCancel()
    {
         blShow=false;
        blShowDet = true;
    }
    
    

}