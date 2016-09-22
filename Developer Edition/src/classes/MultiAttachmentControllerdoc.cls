/*
 * Controller for multi attachment component
 */
 
public with sharing class MultiAttachmentControllerdoc
{
    // the parent object it
    public Id sobjId {get; set;}
    
    Public Id attachmentId{get;set;}
   
    
    // list of existing attachments - populated on demand
    public List<Document> attachments;
    
    // list of new attachments to add
    public List<Document> newAttachments {get; set;}
    
    // the number of new attachments to add to the list when the user clicks 'Add More'
    public static final Integer NUM_ATTACHMENTS_TO_ADD=5;

    // constructor
    public MultiAttachmentControllerdoc()
    {
        // instantiate the list with a single attachment
        newAttachments=new List<Document>{new Document()};
        
        
    }   
    
    // retrieve the existing attachments
    public List<Document> getAttachments()
    {
        // only execute the SOQL if the list hasn't been initialised
        if (null==attachments)
        {
            attachments=[select Id, Body, AuthorId, ContentType, FolderId, Name, Description from Document where AuthorId=:UserInfo.getUserId()];
        }
        
        return attachments;
    }

    // Add more attachments action method
    public void addMore()
    {
        // append NUM_ATTACHMENTS_TO_ADD to the new attachments list
        for (Integer idx=0; idx<NUM_ATTACHMENTS_TO_ADD; idx++)
        {
            newAttachments.add(new Document());
        }
        
    }    
    
    // Save action method
    public void save()
    {
        
        List<Document> toInsert=new List<Document>();
        for (Document newAtt : newAttachments)
        {
            if (newAtt.Body!=null)
            {
                newAtt.AuthorId=UserInfo.getUserId();
                newAtt.FolderId=UserInfo.getUserId();
                toInsert.add(newAtt);
            }
        }
        insert toInsert;
        newAttachments.clear();
        newAttachments.add(new Document());
        
        // null the list of existing attachments - this will be rebuilt when the page is refreshed
        attachments=null;
    }
    
    // Action method when the user is done
    public PageReference done()
    {
        // send the user to the detail page for the sobject
        return new PageReference('/' + sobjId);
    }
    
    Public Void delAttachment(){
    
        Delete[Select Id from Document where id=:attachmentId];
        newAttachments.clear();
        newAttachments.add(new Document());
            
        // null the list of existing attachments - this will be rebuilt when the page is refreshed
        attachments=null;
    
    }
    
    
}