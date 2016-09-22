public with sharing class CommonObjectSearchController {
    
    public String objectName{get;set;}
    public String objectLabel{set;get;}
    public String selectFields=null;
    public String displayFields=null;
    public String displayLabels=null;
    public String textFields=null;
    public String textFieldLabels=null;
    public String nonTextFields=null;
    public String nonTextFieldLabels=null;
    public String picklistFields=null;
    public String picklistFieldLabels=null;
    public String sortByFields{get;set;}
    public String sortOrder{get;set;}
    public String showSelectBox{get;set;}
    public Integer searchLimit=null;
    public Integer rowsPerPage{get;set;}
    
    public List<SearchComponent> searchComponentList=null;
    public List<sObject> objectList=null;
    
    public String[] displayFieldArray{get;set;}
    public String[] displayLabelArray{get;set;}
    
    private String[] selectArray=null;
    private String[] textFieldArray=null;
    private String[] textFieldLabelArray=null;
    private String[] nonTextFieldArray=null;
    private String[] nonTextFieldLabelArray=null;
    private String[] picklistFieldArray=null;
    private String[] picklistFieldLabelArray=null;
    private Map <String,Schema.sObjectType> schemaMap=null;
    private transient Schema.Describesobjectresult objectDescribe;
    private Map<String,Schema.Sobjectfield> fieldMap=null;
    private String soql=null;
    
    
    
    public String getSelectFields(){
        System.debug('------Inside getSelectFields----------');
        return selectFields;
    }
    
    public void setSelectFields(String selectFields){
        System.debug('------Inside setSelectFields----------'+selectFields);
        this.selectFields=selectFields;
        if(selectArray==null && selectFields!=null){
            System.debug('--------------------###------selectArray is null------##------------------');
            selectArray=splitString(selectFields);
        }else{
            System.debug('--------------------###------selectArray is not null------##------------------');
        }
    }
    
    public String getDisplayFields(){
        System.debug('------Inside getDisplayFields----------');
        return displayFields;
    }
    
    public void setDisplayFields(String displayFields){
        System.debug('------Inside setDisplayFields----------'+displayFields);
        this.displayFields=displayFields;
        if(displayFieldArray==null && displayFields!=null){
            System.debug('--------------------***------displayFieldArray is null------***------------------');
            displayFieldArray=splitString(displayFields);
        }else{
            System.debug('--------------------***------displayFieldArray is not null-----***------------------');
        }
    }
    
    public String getDisplayLabels(){
        System.debug('------Inside getDisplayLabels----------');
        return displayLabels;
    }
    
    public void setDisplayLabels(String displayLabels){
        System.debug('------Inside setDisplayLabels----------'+displayLabels);
        this.displayLabels=displayLabels;
        if(displayLabelArray==null && displayLabels!=null){
            System.debug('--------------------$$$------displayLabelArray is null------$$$------------------');
            displayLabelArray=splitString(displayLabels);
        }else{
            System.debug('--------------------$$$------displayLabelArray is not null------$$$-----------------');
        }
    }
          
    public String getTextFields(){
        System.debug('------Inside getTextFields----------');
        return textFields;
    }
    
    public void setTextFields(String textFields){
        System.debug('------Inside setTextFields----------'+textFields);
        this.textFields=textFields;
        if(textFieldArray==null && textFields!=null){
            System.debug('--------------------$$$------textFieldArray is null------$$$------------------');
            textFieldArray=splitString(textFields);
        }else{
            System.debug('--------------------$$$------textFieldArray is not null------$$$-----------------');
        }
    }
    
    public String getTextFieldLabels(){
        System.debug('------Inside getTextFieldLabels----------');
        return textFieldLabels;
    }
    
    public void setTextFieldLabels(String textFieldLabels){
        System.debug('------Inside setTextFieldLabels----------'+textFieldLabels);
        this.textFieldLabels=textFieldLabels;
        if(textFieldLabelArray==null && textFieldLabels!=null){
            System.debug('--------------------$$$------textFieldLabelArray is null------$$$------------------');
            textFieldLabelArray=splitString(textFieldLabels);
        }else{
            System.debug('--------------------$$$------textFieldLabelArray is not null------$$$-----------------');
        }
    }
    
    public String getNonTextFields(){
        System.debug('------Inside getNonTextFields----------');
        return nonTextFields;
    }
    
    public void setNonTextFields(String nonTextFields){
        System.debug('------Inside setNonTextFields----------'+nonTextFields);
        this.nonTextFields=nonTextFields;
        if(nonTextFieldArray==null && nonTextFields!=null){
            System.debug('--------------------$$$------nonTextFieldArray is null------$$$------------------');
            nonTextFieldArray=splitString(nonTextFields);
        }else{
            System.debug('--------------------$$$------nonTextFieldArray is not null------$$$-----------------');
        }
    }
    
    public String getNonTextFieldLabels(){
        System.debug('------Inside getNonTextFieldLabels----------');
        return nonTextFieldLabels;
    }
    
    public void setNonTextFieldLabels(String nonTextFieldLabels){
        System.debug('------Inside setNonTextFieldLabels----------'+nonTextFieldLabels);
        this.nonTextFieldLabels=nonTextFieldLabels;
        if(nonTextFieldLabelArray==null && nonTextFieldLabels!=null){
            System.debug('--------------------$$$------nonTextFieldLabelArray is null------$$$------------------');
            nonTextFieldLabelArray=splitString(nonTextFieldLabels);
        }else{
            System.debug('--------------------$$$------nonTextFieldLabelArray is not null------$$$-----------------');
        }
    }
    
    public String getPicklistFields(){
        System.debug('------Inside getPicklistFields----------');
        return picklistFields;
    }
    
    public void setPicklistFields(String picklistFields){
        System.debug('------Inside setPicklistFields----------'+picklistFields);
        this.picklistFields=picklistFields;
        if(picklistFieldArray==null && picklistFields!=null){
            System.debug('--------------------$$$------picklistFieldArray is null------$$$------------------');
            picklistFieldArray=splitString(picklistFields);
        }else{
            System.debug('--------------------$$$------picklistFieldArray is not null------$$$-----------------');
        }
    }
    
    public String getPicklistFieldLabels(){
        System.debug('------Inside getPicklistFieldLabels----------');
        return picklistFieldLabels;
    }
    
    public void setPicklistFieldLabels(String picklistFieldLabels){
        System.debug('------Inside setPicklistFieldLabels----------'+picklistFieldLabels);
        this.picklistFieldLabels=picklistFieldLabels;
        if(picklistFieldLabelArray==null && picklistFieldLabels!=null){
            System.debug('--------------------$$$------picklistFieldLabelArray is null------$$$------------------');
            picklistFieldLabelArray=splitString(picklistFieldLabels);
        }else{
            System.debug('--------------------$$$------picklistFieldLabelArray is not null------$$$-----------------');
        }
    }
    
    public Integer getSearchLimit(){
        if(searchLimit==null){
            searchLimit= 1000;
        }
        return searchLimit;
    } 
    
    public void setSearchLimit(Integer searchLimit){
        this.searchLimit=searchLimit;
    }
    
    //added for pagination
    
    public ApexPages.StandardSetController con {
        get {
            System.debug('**************Inside StandardSetController************');
            if(con == null && objectList!=null) {
                System.debug('**************con before************'+con);
                con = new ApexPages.StandardSetController(objectList);
                System.debug('**************con after************'+con);
                // sets the number of records in each page set
                con.setPageSize(rowsPerPage);
            }
            return con;
        }
        set;
    }
    
    public List<sObject> getObjectList(){
        if(objectList!=null){
            System.debug('**************objectList is not null************');
            return con.getRecords();
        }else{
            System.debug('**************objectList is  null************');
            return null;
        }
        
    }
    
    public void setObjectList(List<sObject> objectList){
        
        this.objectList=objectList;
    }
    
    // indicates whether there are more records after the current page set.
    public Boolean hasNext {
        get {
            return con.getHasNext();
        }
        set;
    }
 
    // indicates whether there are more records before the current page set.
    public Boolean hasPrevious {
        get {
            return con.getHasPrevious();
        }
        set;
    }
 
    // returns the page number of the current page set
    public Integer currentPageNumber {
        get {
            return con.getPageNumber();
        }
        set;
    }
    // returns the total number of pages
    public Integer totalPageNumber {
        get {
            Decimal resultSize=Decimal.valueOf(con.getResultSize());
            Decimal count=resultSize.divide(Decimal.valueOf(con.getPageSize()),2);
            System.debug('**************Count****************'+count);
            System.debug('**************Result size****************'+con.getResultSize());
            System.debug('**************Page Size****************'+con.getPageSize());
            System.debug('**************** Ceiling ****************'+count.round(System.RoundingMode.Ceiling));
            return count.round(System.RoundingMode.Ceiling).intValue();
        }
        set;
    }
 
    // returns the first page of records
    public void first() {
        con.first();
    }
 
    // returns the last page of records
    public void last() {
        con.last();
    }
 
    // returns the previous page of records
    public void previous() {
        con.previous();
    }
 
    // returns the next page of records
    public void next() {
        System.debug('**********************Page Number****************'+con.getPageNumber());
        System.debug('**********************Page Size****************'+con.getPageSize());
        System.debug('**********************Result Size****************'+con.getResultSize());
        con.next();
    }
 
    // returns the PageReference of the original page, if known, or the home page.
    public void cancel() {
        con.cancel();
    }

       
    //added for pagination
    
    public List<SearchComponent> getSearchComponentList(){
        System.debug('test123 getSearchComponentList------------222-------------'+searchComponentList);
        if (searchComponentList==null){
            setSearchComponent();
        }
        return searchComponentList;
    }
    
    
    
    public void doSearch(){
    
        System.debug('objectName--------'+objectName);
        System.debug('objectLabel--------'+objectLabel);
        System.debug('selectFields--------'+selectFields);
        System.debug('displayFields--------'+displayFields);
        System.debug('displayLabels--------'+displayLabels);
        System.debug('selectArray--------'+selectArray);
        System.debug('displayFieldArray--------'+displayFieldArray);
        System.debug('displayLabelArray--------'+displayLabelArray);
                
        
        System.debug('Inside Run Search-------------------');
        System.debug('searchComponentList----------------'+searchComponentList.size());
        
        //reset con and objectList everytime you press search
        con=null;
        objectList=null;//this is needed 
        
        soql='select ';
        String addAnd = '';
        String searchValue='';
        if(selectArray!=null){
            for(integer i=0;i<selectArray.size();i++){
                if(i<(selectArray.size()-1)){
                    soql=soql+selectArray[i]+',';
                }else{
                    soql=soql+selectArray[i];
                }
            }
        }
        System.debug('SOQL-----------------------1---'+soql);
        soql=soql+' '+' from '+objectName+' where ';
        System.debug('SOQL------------------------2--'+soql);
        for(SearchComponent searchObj:searchComponentList){
            
            searchValue=searchObj.searchValue1;
            System.debug('Inside doSearch loop------fieldName-------------'+searchObj.fieldName);
            System.debug('Inside doSearch loop------columnName-------------'+searchObj.columnName);
            System.debug('Inside doSearch loop------fieldType-------------'+searchObj.fieldType);
            System.debug('Inside doSearch loop------operator-------------'+searchObj.operator);
            System.debug('Inside doSearch loop------searchValue1-------------'+searchObj.searchValue1);
            System.debug('Inside doSearch loop------searchValue2-------------'+searchObj.searchValue2);
            
            if(searchObj.fieldType!=null && searchObj.fieldType.equals('1')){
                
                System.debug('Check point 1--------------it is a text field');
                if(searchValue != null && !searchValue.equals(''))  {
                        if(searchObj.operator.equals('contains'))    {
        
                            soql += addAnd + searchObj.columnName +' LIKE \'%'+
                                String.escapeSingleQuotes(searchValue)+'%\'';
                            addAnd = ' and ';
                               
                        }else if(searchObj.operator.equals('equals'))    {
                            
                            soql += addAnd + searchObj.columnName +' = \''+ String.escapeSingleQuotes(searchValue)+'\'';
                            addAnd = ' and ';
                               
                        }else if(searchObj.operator.equals('startsWith'))    {
                            
                            soql += addAnd + searchObj.columnName +' LIKE \''+ String.escapeSingleQuotes(searchValue)+'%\'';
                            addAnd = ' and ';
                        } 
                }
            
            }else if(searchObj.fieldType!=null && searchObj.fieldType.equals('2')){
            
                     
                                
                    if(searchValue != null && !searchValue.equals(''))  {
                        
                        if(searchObj.operator.equals('between'))  {    
                            if(searchObj.searchValue2 != null && !searchObj.searchValue2.equals(''))   {                                     
                                soql += addAnd + searchObj.columnName +' >= '+searchValue;
                                addAnd = ' and ';  
                                soql +=  addAnd + searchObj.columnName+ ' <= '+searchObj.searchValue2;
                            }  
                               
                        }else if(searchObj.operator.equals('less than'))  {
                            soql += addAnd + searchObj.columnName +' < '+searchValue;
                            addAnd = ' and ';  
                        }else if(searchObj.operator.equals('greater than'))  {
                            soql += addAnd + searchObj.columnName +' > '+searchValue;
                            addAnd = ' and ';  
                        }else if(searchObj.operator.equals('greater or equal'))  {
                            soql += addAnd + searchObj.columnName +' >= '+searchValue;
                            addAnd = ' and ';  
                        }else if(searchObj.operator.equals('less or equal'))  {
                            soql += addAnd + searchObj.columnName +' <= '+searchValue;
                            addAnd = ' and ';  
                        }
                    }                                                                       
                
            
            }else if(searchObj.fieldType!=null && searchObj.fieldType.equals('3')){
                
                 if(searchValue != null && !searchValue.equals(''))  {
                    soql += addAnd + searchObj.columnName +' = \''+ String.escapeSingleQuotes(searchValue)+'\'';
                            addAnd = ' and ';
                 }
            
            }
            
        }
        
        //sorting block
        if(sortByFields!=null && !sortByFields.equals('')){
            System.debug('----------**************SortByFields*************---------'+sortByFields);
            System.debug('-------######### SortOrder #########---------'+sortOrder);
            System.debug('-------######### searchLimit #########---------'+searchLimit);
            soql=soql+ ' order by ' + sortByFields + ' '+sortOrder+ ' limit ' + ' '+ searchLimit;
        }
        
        System.debug('-----------***********SOQL ************---------------'+soql);
        
        if(addAnd.equals('')){
            
            System.debug('-----------*****Nothing is entered******---------------');
            ApexPages.addmessage(new ApexPages.message(ApexPages.severity.INFO,
                        'Please enter something'));
            return;
        }
          
        runQuery();
        
    
    }
    
    private void runQuery() {
        
        try {
            objectList=Database.query( soql);
            //pcrLinesList = Database.query( soql + ' order by  Contract_Start_Date__c desc limit 100');            
           if(objectList== null || objectList.size() == 0) {
                objectList= null;
                ApexPages.addmessage(new ApexPages.message(ApexPages.severity.INFO,
                        'No Record'));
            }
                        
        } catch (Exception e) {
             
            ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR,  'SELECT ERROR'));
        }
    } 
    
    private String[] splitString(String textField){
    
        return textField.split(',');
        
    }
    
    private void setSearchComponent()   {
        
        System.debug('Inside setSearchComponent textFieldArray-------------------'+textFieldArray);
        System.debug('Inside setSearchComponent nonTextFieldArray-------------------'+nonTextFieldArray);
        System.debug('Inside setSearchComponent picklistFieldArray-------------------'+picklistFieldArray);
        searchComponentList = new List<SearchComponent>();
        schemaMap = Schema.getGlobalDescribe();
        objectDescribe = schemaMap.get(objectName).getDescribe();
        fieldMap = objectDescribe.fields.getMap();
        
        if(textFieldArray!=null){
            for(integer i=0;i<textFieldArray.size();i++){       
            searchComponentList.add(new SearchComponent(textFieldLabelArray[i],textFieldArray[i],'1',''));
                       
            }
        }
        if(nonTextFieldArray!=null){
            for(integer i=0;i<nonTextFieldArray.size();i++){       
            searchComponentList.add(new SearchComponent(nonTextFieldLabelArray[i],nonTextFieldArray[i],'2',''));
            
            }
        }
        if(picklistFieldArray!=null){
            
            List<selectOption> options=null;
            for(integer i=0;i<picklistFieldArray.size();i++){ 
               System.debug('----*****----Picklist test--*****-----------'+fieldMap.get(picklistFieldArray[i]).getDescribe().getPicklistValues());      
               options= new List<selectOption>(); 
               List<Schema.PicklistEntry> pickListValues=fieldMap.get(picklistFieldArray[i]).getDescribe().getPicklistValues();
               for (Schema.PicklistEntry a : pickListValues) { //for all values in the picklist list
                    options.add(new selectOption(a.getLabel(), a.getValue())); //add the value and label to our final list
               }
               System.debug('----#######----Picklist values test--#######-----------'+options);
               searchComponentList.add(new SearchComponent(picklistFieldLabelArray[i],picklistFieldArray[i],'3','',options));
            
            }
        }
        System.debug('Inside setSearchComponent-----searchComponentList-size-------------'+searchComponentList.size());
        
    } 
  /*  
    static testMethod void runTestCases(){
        
        CommonObjectSearchController cntrl = new CommonObjectSearchController();
        cntrl.objectName ='Account';
        cntrl.objectLabel = 'Account';
        cntrl.textFields='Name';
        cntrl.textFieldLabels='Account Name';
        cntrl.nonTextFieldLabels='NumberOfEmployees';
        cntrl.nonTextFields='NumberOfEmployees';
        cntrl.picklistFields='Industry';
        cntrl.picklistFieldLabels='Industry';
        cntrl.displayFields='Name,Industry';
        cntrl.displayLabels='Name,Industry';
        cntrl.selectFields='Name,Industry';
        
        Account acct1 = new Account(name='Test');
        insert acct1;
        
        Account acct2 = new Account(name='Test1');
        insert acct2;
        
        List<SObject> accntList = new List<SObject>();
        accntList.add(acct1);
        accntList.add(acct2);
                
        //cntrl.cancel();
        cntrl.getDisplayFields();
        cntrl.getDisplayLabels();
        cntrl.getNonTextFieldLabels();
        cntrl.getNonTextFields();
        cntrl.getObjectList();
        cntrl.getPicklistFieldLabels();
        cntrl.getPicklistFields();
        cntrl.getSearchComponentList();
        cntrl.getSearchLimit();
        //cntrl.getSearchLimit();
        cntrl.getSelectFields();
        cntrl.getTextFieldLabels();
        cntrl.getTextFields();
        
        cntrl.setDisplayFields(cntrl.displayFields);
        cntrl.setDisplayLabels(cntrl.displayLabels);
        cntrl.setNonTextFieldLabels(cntrl.nonTextFieldLabels);
        cntrl.setNonTextFields(cntrl.nonTextFields);
        cntrl.setObjectList(accntList);
        cntrl.setPicklistFieldLabels(cntrl.picklistFieldLabels);
        cntrl.setPicklistFields(cntrl.picklistFields);
        cntrl.setSelectFields(cntrl.selectFields);
        //cntrl.searchComponentList = new List<SearchComponent>();
        SearchComponent comp1 = new SearchComponent('Name','Name','1','startsWith');
        comp1.searchValue1 ='Test';
        cntrl.searchComponentList.add(comp1);
        cntrl.doSearch();
        SearchComponent comp2 = new SearchComponent('Name','Name','1','equals');
        comp1.searchValue1 ='Test';
        cntrl.searchComponentList.add(comp2);
        cntrl.doSearch();
        /*cntrl.searchComponentList.add(new SearchComponent('Name','Name','1','startsWith'));
        cntrl.doSearch();*/
  /*      SearchComponent comp3 = new SearchComponent('NumberOfEmployees','NumberOfEmployees','2','less or equal');
        comp3.searchValue1 = '2';
        cntrl.searchComponentList.add(new SearchComponent('NumberOfEmployees','NumberOfEmployees','2','less or equal'));
        cntrl.doSearch();
        comp3.operator='greater or equal';
        cntrl.searchComponentList.add(comp3);
        cntrl.doSearch();
        comp3.operator='greater than';
        cntrl.searchComponentList.add(comp3);
        cntrl.doSearch();
        comp3.operator='less than';
        cntrl.searchComponentList.add(comp3);
        cntrl.doSearch();
        
        
        //cntrl.setSearchLimit();
        cntrl.setSearchLimit(1000);
        cntrl.setSelectFields(cntrl.selectFields);
        cntrl.setTextFieldLabels(cntrl.textFieldLabels);
        cntrl.setTextFields(cntrl.textFields);
        
        
        cntrl.setSearchComponent();
        //cntrl.doSearch();
        //cntrl.next();
        //cntrl.first();
        //cntrl.last();
        //cntrl.previous();
        
    
   */ 
    }