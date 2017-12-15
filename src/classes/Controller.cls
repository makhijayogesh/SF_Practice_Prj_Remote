Public Class Controller{
    
       public List<SelectOption> Alphabets {get;set;}
       public List<SelectOption> Fruits {get;set;}
       
       public String SelectedAlphabet {get;set;}
       
       /* Constructor will intialize and build initial list of Alphabets */
       
    public   Controller()
       {
           Alphabets=new List<SelectOption>();
           Fruits = new List<SelectOption>();
           
            /*Adding None in PickLists*/
 
         SelectOption option= new SelectOption('--None--','--None--');
         
             Alphabets.Add(option);
             Fruits.Add(option);

             option=new SelectOption('A','A');
             Alphabets.Add(option);
             
             option=new SelectOption('B','B');
             Alphabets.Add(option);
       }

       /* This method will be called and populate Fruit Lit upon click of Alphabet List */
    
    public void createFruitList()
    {
        /* The list should always be clered first */
        Fruits.clear();
        Fruits.add(new selectOption('--None--','--None--'));
         if(SelectedAlphabet=='A')
         {
           Fruits.add(new selectOption('Apple','Apple'));
           Fruits.add(new selectOption('Apricot','Apricot'));
           
         }
         if(SelectedAlphabet=='B')
         {
           Fruits.add(new selectOption('Banana','Banana'));
           Fruits.add(new selectOption('Blackberry','Blackberry'));
         }
    }
    
}