public with sharing class SearchComponent {
    
    public String fieldName{get;set;}
    public String columnName{get;set;}
    public String operator;
    public String searchValue1;
    public String searchValue2;
    public String fieldType{get;set;}
    public List<SelectOption> pickListOptions{get;set;}
    
    public String getOperator(){
        return operator;
    }
    
    public void setOperator(String operator){
        System.debug('Yahoooooooooooooooooooooooo----------operator-----------'+operator);
        this.operator=operator;
    }
    
    public String getSearchValue1(){
        return searchValue1;
    }
    
    public void setSearchValue1(String searchValue1){
        System.debug('Yahoooooooooooooooooooooooo-----------searchValue1----------'+searchValue1);
        this.searchValue1=searchValue1;
    }
    
    public String getSearchValue2(){
        return searchValue2;
    }
    
    public void setSearchValue2(String searchValue2){
        System.debug('Yahoooooooooooooooooooooooo----------searchValue2-----------'+searchValue2);
        this.searchValue2=searchValue2;
    }
    
    public SearchComponent(String fieldName,String columnName)  {
            
            this.fieldName = fieldName;   
            this.columnName = columnName;                                 
        }
        
        public SearchComponent(String fieldName,String columnName,String fieldType)  {
            
            this.fieldName = fieldName;  
            this.columnName = columnName;
            this.fieldType = fieldType;
                                          
        }
       
        public SearchComponent(String fieldName,String columnName,
                String fieldType,String operator)  {
            
            this.fieldName = fieldName;            
            this.columnName = columnName;            
            this.operator = operator;
            this.fieldType = fieldType;           
        }
        
        public SearchComponent(String fieldName,String columnName,
                String fieldType,String operator,List<SelectOption> pickListOptions)  {
            
            this.fieldName = fieldName;            
            this.columnName = columnName;            
            this.operator = operator;
            this.fieldType = fieldType;
            this.pickListOptions=pickListOptions;           
        }
   /* 
    static testMethod void testSearchComp(){
      
      SearchComponent comp = new SearchComponent('1','2');
      SearchComponent comp2 = new SearchComponent('1','2','3');
      SearchComponent comp3 = new SearchComponent('1','2','3','4');
      SearchComponent comp4 = new SearchComponent('1','2','3','4',new List<SelectOption>());
      
      comp.getOperator();
      comp.getSearchValue1();
      comp.getSearchValue2();
      comp.setOperator('equals');
      comp.setSearchValue1('test');
      comp.setSearchValue2('test');
    }
    */
}