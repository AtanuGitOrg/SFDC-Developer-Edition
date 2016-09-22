global class clinicalTrial implements Database.Batchable<sobject>,Database.AllowsCallouts
{
    string leadName='Bristol+Myers+Squibb';
    string recName = 'Open';
    List<ClinicalData__c> clDataList = new List<ClinicalData__c>();
    
    global void Operate()
    {
        clinicalTrial ctr = new clinicalTrial();
        
        id batchId = Database.executeBatch(ctr);
    }
       
    global Database.QueryLocator start(Database.BatchableContext bch)
    {
        string query= 'select ID FROM ClinicalData__c';
        return Database.getQueryLocator(query);
    }
    global void execute(Database.BatchableContext bch, List<Sobject> objList)
    {
        List<ClinicalData__c> cdaList = (List<ClinicalData__c>)objList;
        Map<String,List<String>> mastData = new Map<String,List<String>>();
        list<string> myList = new List<String>();
        
        if((objList.Size()> 0) || (objList.Size() == 0))
        {
            //Do call http method
            HttpRequest hreq = new HttpRequest();
           hreq.setEndPoint(Label.EndPoint + '/results?recr=' + recName + '&lead=' + leadName + '&displayXML=true');
            hreq.setMethod('GET');
            http ht = new http();
            httpResponse hres = new HttpResponse();
            hres = ht.send(hreq);
            integer pageSize;
            integer totPage;
            
            
            
            if(hres.getBody() !=null)
            {
                 //Page Size calcualting Zone
                Dom.Document docP = new Dom.Document();
                
                docP = hres.getBodyDocument();
                        
                //Retrieve the root element for this document.
                     
                Dom.XMLNode coreData = docP.getRootElement();
                //Get total Search Results
                pageSize = Integer.valueOf(coreData.getAttributeValue('count',coreData.getNameSpace()));
                System.Debug('PageSize:' + ' ' + pageSize);
                //Get actual pages
                totPage = Math.mod(pageSize,20) == 0? (pageSize / 20) : (((pageSize - (Math.mod(pageSize,20)))/20)+1);
                System.Debug('total page:' + ' ' + totPage);
               
                //End 
                HttpResponse hrsInner = new HttpResponse();
                Http httpInner = new Http();
                Dom.Document doc = new Dom.Document();
                for(integer x=1;x<=totPage;x++)
                {
                  HttpRequest hrInner = new HttpRequest();
                  //setting innerEndPoint
                  hrInner.setEndPoint(Label.EndPoint + '/results?recr=' + recName + '&lead=' + leadName + '&displayXML=true&pg=' + x);
                  hrInner.setMethod('GET');
                  hrsInner = httpInner.send(hrInner);    
                  if(hrInner.getBody() !=null)
                  {
                 
                      doc = hrsInner.getBodyDocument();
                    
                      //Retrieve the root element for this document.
                    
                      Dom.XMLNode Envelope = doc.getRootElement();          
                      for(Dom.XMLNode child : Envelope.getChildElements()) 
                      {
                        ClinicalData__c clc = new ClinicalData__c();
                        if(child.getNodeType() == DOM.XMLNodeType.ELEMENT)
                        {
                            if(child.getName() !='query')
                            { 
                                for(Dom.XMLNode subchild : child.getChildElements()) 
                                {
                                     
                                   //Add respective values of Title,Status,Condition
                                   if(subchild.getName() == 'nct_Id')
                                   {
                                       clc.StudyNCTId__c = subchild.getText();
                                                                     
                                   }
                                   if(subchild.getName() == 'title')
                                   {
                                      //tMap.put('title',subchild.getText());
                                       clc.Title__c = subchild.getText();
                                       
                                   }
                                   else if(subchild.getName() == 'status')
                                   {
                                        //tMap1.put('status',subchild.getText());
                                        clc.status__c = subchild.getText();
                                   }
                                   else if(subchild.getName() == 'condition_summary')
                                   {
                                       clc.condition__C = subchild.getText();
                                                                     
                                   }
                                   clc.alreadyadded__C = true;
                                   System.Debug('CLC:' + ' ' + clc);
                                  
                                   
                                }
                       
                                  clDataList.add(clc);
                           } 
                            
                          System.Debug('CLC:' + ' ' + clDataList);  
                               
                        }    
                   
                    }
                  }  
               }     
               Database.UpsertResult[] dres = Database.Upsert(clDataList,false);
                
            }
               
        
         }
          
          
   }       
    
   
    
   global void finish(Database.BatchableContext bch)
   {
    
   }
}