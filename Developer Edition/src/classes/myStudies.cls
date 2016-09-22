public class myStudies 
{
   
    public string recruit{get;set;}
    public string leadName{get;set;}
    public string condName{get;set;}
    public string address{get;set;}
    public string selRanges{get;set;}
    List<ClinicalData__c> clDataList = new List<ClinicalData__c>();   
    public myStudies()
    {
       leadName='Bristol Myers Squibb';
       recruit = 'open';
       address = '';
    }
    public void doSubmit()
    {
        //doAddSearchResult();
        getSearchData();
    }
    public List<ClinicalData__c> getSearchData()
    {
      List<ClinicalData__c> mainList = new List<ClinicalData__c>();
      set<string> studIds = new set<string>();
      if(address !='')
      {
      studIds = getSearchedNctIds();
      
      string vars = '%' + condName + '%';
      mainList = [SELECT ID,NAME,TITLE__c,CONDITION__C,STATUS__c FROM ClinicalData__c
      WHERE StudyNCTId__c in:(studIds)];
      }
      return mainList;    
    }
    
    public List<SelectOption> getConditions()
    {
        List<SelectOption> opList = new List<SelectOption>();
        opList.add(new SelectOption('-1','Select'));
        string[] conditions = new string[]{'Alzheimer’s Disease','Atherosclerosis','Autistic Disorder (Pediatric)','Blood Clots (Adult)',
                        'Blood Clots (Pediatric)','Breast Cancer','Cancer',
                        'Cholesterol Disorders',
                        'Colitis',
                        'Colorectal Cancer',
                        'Crohns Disease',
                        'Depression',
                        'Diabetes (Adult)',
                        'Diabetes (Pediatric)',
                        'Endometrial Cancer',
                        'Gastrointestinal Cancer',
                        'Healthy Volunteers',
                        'Hepatitis B (Adult)',
                        'Hepatitis B (Pediatric)',
                        'Hepatitis C',
                        'High Blood Pressure',
                        'HIV (Adult)',
                        'HIV (Pediatric)',
                        'Idiopathic Pulmonary Fibrosis',
                        'Kidney Cancer',
                        'Kidney Disease',
                        'Leukemia (Adult)',
                        'Leukemia (Pediatric)',
                        'Liver Cancer',
                        'Liver Disease',
                        'Lung Cancer',
                        'Lung Disease',
                        'Lupus Nephritis',
                        'Lupus',
                        'Lymphoma',
                        'Melanoma (Pediatric)',
                        'Melanoma',
                        'Migraine',
                        'Multiple Myeloma',
                        'Non Hodgkins Lymphoma',
                        'Obesity',
                        'Ovarian Cancer',
                        'Pain',
                        'Pediatric Studies',
                        'Prostate Cancer',
                        'Psoriatic Arthritis',
                        'Renal Transplant (Pediatric)',
                        'Rheumatoid Arthritis',
                        'Solid Tumors',
                        'Transplantation'

         };
        for(string cond:conditions)
        {
            opList.add(new SelectOption(cond,cond));
        }
        return opList;
    }
    public list<selectOption> getDistanceSelection()
    {
        List<SelectOption> opCelVal = new List<SelectOption>();
        opCelVal.add(new SelectOption('50','50'));
        opCelVal.add(new SelectOption('100','100'));
        opCelVal.add(new SelectOption('150','150'));
        opCelVal.add(new SelectOption('10000','No Distance'));
        return opCelVal;
    
    }
    
    //public string showXML('086
    public set<string> getSearchedNctIds()
    {
      HttpRequest hreq = new HttpRequest();
      System.Debug('String is:' + ' ' + Label.EndPoint + '/results?recr=' + recruit + '&lead=' + leadName + '&cond=' + condName + '&displayxml=true'); 
      leadName = leadName.replace(' ','+');
      hreq.setEndPoint(Label.EndPoint + '/results?recr=' + recruit + '&lead=' + leadName + '&term=' + condName + '+' + ' ' +'and' + ' ' + '+' + ' ' + address.replace(' ' ,'+') + '&displayxml=true');
     // hreq.setEndPoint('http://clinicaltrials.gov/ct2/results?recr=Open&lead=Bristol Myers Squibb&cond=Diabetes&displayxml=true');
      hreq.setMethod('GET'); 
      Http htp = new Http();
      HttpResponse hres = new HttpResponse();
      hres = htp.send(hreq);
      //Add data to custom Object
          Dom.Document doc = new Dom.Document();
            
          doc = hres.getBodyDocument();
            
          //Retrieve the root element for this document.
            
          Dom.XMLNode Envelope = doc.getRootElement();
                   
          string user_createResult = '';
            
          set<string> nctIDS = new set<string>();
          
          clDataList.clear();
        
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
                               nctIds.add(subchild.getText());
                           }    
                           
                        }
               
                        
                   } 
                    
                  System.Debug('CLC:' + ' ' + clDataList);  
                       
                }    
               
           }
          
          return nctIds;
    
    }
    
    
    
    
    
}