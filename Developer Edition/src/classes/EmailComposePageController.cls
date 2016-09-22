public class EmailComposePageController {

    public String Parameter { get; set; }

public String emailVal{get;set;}
public String cc{get;set;}
public String bcc{get;set;}
public String emailSubject{get;set;}
public String body{get;set;}
public Document att{get;set;}
public List<Document> attList{get;set;}
Public List<Document> atList{get;set;}
private List<String> emailIds;
private List<String> ccEmailIds;
private List<String> bccEmailIds;
Public Boolean attach{get;set;}
Public Boolean ccBln{get;set;}
Public Boolean bccBln{get;set;}
Public Id pid;

    // simple Constructor for creting object of Attachment list and Attachment.
    public EmailComposePageController(){
        attList = new List<Document>();
        att = new Document();
        pid = ApexPages.currentPage().getParameters().get('pid');
        attach = False;
        ccBln = True;
        bccBln = True;
    }
    
   Public Void cc(){
    ccBln = False;
   }
   
   Public Void bcc(){
    bccBln = False;
   }
    
    // method to attach attachment to attachment list.
    public void upload(){
        if(att.name == null){
            ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR,'Please Select File Path First.'));
        }
        else{
            att.AuthorId = UserInfo.getUserId();
            //att.ParentId = pid;
            attList.add(att);
            insert attList;
            att = new Document();
        }        
    }
    
    public void Attachment(){
    attach = True;
    }
    // this action method is calls from send button.
    public void sendMail() {
       if( emailVal !='' && emailVal.length() > 0 )
           emailIds = emailVal.split(';');
       if( cc !='' && cc.length() > 0 )
           ccEmailIds = cc.split(';');
       if( bcc !='' && bcc.length() > 0 )
           bccEmailIds = cc.split(';');
       
       Messaging.SingleEmailMessage mail = sendEmail(emailIds ,ccEmailIds ,bccEmailIds, emailSubject, body);
       if(mail != null){
           Messaging.SendEmailResult [] r =Messaging.sendEmail(new Messaging.SingleEmailMessage[] {mail});
           ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.INFO,'Email Has Been Sent');
           ApexPages.addMessage(myMsg);
           Delete[Select Id from Document where AuthorId =:UserInfo.getUserId()];
       }
       
    }
    
    // from this method the actual mail is sends.
    private Messaging.SingleEmailMessage sendEmail( List<String> toMail, List<String> ccEmailIdList,List<String> bccEmailIdList, String strSubject, String strMsgBody ){
        List<Messaging.EmailFileAttachment> mailAttList = new List<Messaging.EmailFileAttachment>();
        Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
        email.setToAddresses(toMail);
        if(ccEmailIdList != null && ccEmailIdList.size()>0){
            email.setCcAddresses(ccEmailIdList);
        }
        if(bccEmailIdList != null && bccEmailIdList.size()>0){
            email.setBccAddresses(bccEmailIdList);
            email.setBccSender(true);
        }
        email.setSubject(strSubject);    
        email.sethtmlBody(strMsgBody);
        email.setSaveAsActivity(false);
        atList = [Select Id,body,Name from Document where AuthorId =:UserInfo.getUserId()];
        for(Document att1 : atList){
            Messaging.EmailFileAttachment efa = new Messaging.EmailFileAttachment();
            efa.setBody(att1.body);
            efa.setFileName(att1.name);
            
            mailAttList.add(efa);
        }
        
        email.setFileAttachments(mailAttList);
        Messaging.SendEmailResult[] sendResult;
        return  email ;
    }
}