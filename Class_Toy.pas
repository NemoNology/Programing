program Task_517_g;



type Toy = class
  
  private
    
    
    /// Наименование игрушки
    name : string;        
    
    /// Цена игрушки (в копейках)
    price : integer;      
    
    /// Возрастное ограничение (от скольки - age1+)
    age1 : integer;       
    
    /// Возрасное ограничение (до скольки - age2-)
    age2 : integer;       
    
  
  
  public
  
    /// Конструктор класса Toy
    constructor();
      begin
      
        name := 'No name';
        price := 0;
        age1 := 0;
        age2 := 99999;
      
      end;
      
      
    /// Изменение наименования игрушки
    procedure Set_name(_name : string); 
      begin
      
        if _name <> '' then
        
          name := _name
          
        else
          
          writeln('Введено неккоректное значение!');
      
      end;
      
      
    /// Изменение цены игрушки
    procedure Set_price(_price : integer); 
      begin
      
        if _price >= 0 then
        
          price := _price
          
        else
          
          writeln('Введено неккоректное значение!');
      
      end;
   
   
   /// Изменение возрастного ограничения игрушки - age1
    procedure Set_age1(_age1 : integer); 
      begin
      
        if (_age1 >= 0) and (_age1 <= age2) then
        
          age1 := _age1
          
        else
          
          writeln('Введено неккоректное значение!');
      
      end;
      
    
    /// Изменение возрастного ограничения игрушки - age2
    procedure Set_age2(_age2 : integer); 
      begin
      
        if (_age2 >= 0) and (_age2 >= age1) then
        
          age2 := _age2
          
        else
          
          writeln('Введено неккоректное значение!');
      
      end;
      
      
    /// Изменение всех значений игрушки
    procedure Set_toy(_name : string; _price, _age1, _age2 : integer);
      begin
      
      
        if _name <> '' then
          
          name := _name
          
        else 
        
          writeln('Введено некоректное значение: наименование игрушки!');
          
        
        
        if _price >= 0 then
          
          price := _price
          
        else
          
          writeln('Введено некоректное значение: цена игрушки!');
        
        
        
        if (_age1 >= 0) and (_age1 <= age2) then
        
          age1 := _age1
          
        else
          
          writeln('Введено неккоректное значение: возрастное ограничение игрушки - age1!');
          
          
          
        if (_age2 >= 0) and (_age2 >= age1) then
        
          age2 := _age2
          
        else
          
          writeln('Введено неккоректное значение: возрастное ограничение игрушки - age2!');
      
      
      end;
    
    
    /// Получение наименования игрушки
    function Get_name(): string;
      begin
      
        Get_name := name;
        
      end;
      
    
    /// Получение цены игрушки
    function Get_price(): integer;
      begin
      
        Get_price := price;
        
      end;
      
    
    /// Получение возрастного ограничения игрушки - age1
    function Get_age1(): integer;
      begin
      
        Get_age1 := age1;
        
      end; 
    
    /// Получение возрастного ограничения игрушки - age2
    function Get_age2(): integer;
      begin
      
        Get_age2 := age2;
        
      end;
      
      
    /// Получение всей информации о игрушке в виде строки в консоли
    procedure Print_toy();
      begin
      
        writeln('Наименование игрушки: ', name);
        writeln('Цена: ', price, ' копеек' );
        writeln('Возрастное ограничение (года): от ', age1, ' до ', age2);
      
      end;
end;

var
  
  i : integer;          // Счётчик
  
begin


end.