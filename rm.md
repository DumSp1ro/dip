Важно: Перед переподключением базы данных, в файле App.Confid удалите строчку "<add name="imp" connectionString=...", которая собственно отвечает за подключение к базе. Это нужно сделать для того чтобы можно заново указать название подключения "imp".</br>
После того как база переподключена, следует зайти в папку "models", раскрать полностью файл .edmx и перейти к файлу bd.Context.cs и прописать следующие строчки, которые дадут возможность проекту рабоать с базой:</br>
# bd.Context.cs
    private static imp context;
    public static imp GetContext()
    {
    if (context == null)
        context = new imp();
    return context;
    }
    public static users CurrentUser { get; set; }

# LoginHistory.cs
После это открываем файл LoginHistory.cs, в нём прописан метод отвечающий за вывод картинки в DataGrid, по заданному отношению:</br>
    
    public string LoginStatusImage
     {
     get
     {
         if (TypeVxod == "Успешно")
             return "/icons/good.png";
         else if (TypeVxod == "Не успешно")
             return "/icons/bad.png";
         else
             return ""; 
     }
     }

# merch.cs
После это открываем файл merch.cs, в нём прописан переменные отвечающие за зачеркивание текста, вывод новой цены, проверной есть ли скидка или нет:</br>

    public string DiscountText
    {
      get
      {
        return Convert.ToBoolean(discount) ? "Есть скидка" : "Скидка отсутствует";
      }
    }
    public bool TextColor
    {
    get
    {
        if (Convert.ToDouble(discount) != 0) return true;
        else return false;
    }
    }
    public string Arrow
    {
    get
    {
        if (TextColor) return "Strikethrough";
        else return "None";
    }
    }
    public string newcost
    {
    get
    {
        if (TextColor) return Convert.ToString((Convert.ToDouble(price)) - Convert.ToDouble(price) * Convert.ToDouble(discount) / 100); else return "";
    }
    }

# orders.cs
После это открываем файл orders.cs, в нём прописан отношение отвещающая за заливку текста в DataGrid:</br>

    public Brush StatusBackgroundColor
    {
    get
    {
        switch (status.id)
        {
            case 1:
                return Brushes.LightGreen;
            case 2:
                return Brushes.LightCoral;
            case 3:
                return Brushes.LightSkyBlue;
            default:
                return Brushes.Transparent; // Если статус неизвестен, можно использовать прозрачный цвет
        }
    }
    }
