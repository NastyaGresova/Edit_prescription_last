// это переменные для работы на БД БТК  


var w0_var=Sys.Process("Automedi");
var version = 5; 


var comment = 1 // нужен ли комментарий при созании назначения: 0 -нет , 1 - да
var comment_text = "1239e9qewioJSOWIE"
var patients_id_var=535828;
var pr_drugs_id_var = 3790   //436;   // id медикамента
var scheme_name="test test" //название схемы приема из контекстного меню медикамента
var pr_drugs_id_list = [434, 436, 463, 442];   //id медикаментов, на основе которых делается составное назначение 
var pr_templates_id_var = 216; // id схемы приема
var intake_method_i_var = 2; //просто порядковый номер способа введения из глоссария 
var dose_calc_var = 13.56; //  дозировка для ввода в калькулятор
var duration_var = 5;  //   длительность назначения (дней, месяцев и т.д.)
var break_between_schemes_var = 7  //  перерыв между схемами

var pr_drugs_id_composite_mnn = 620; //     id медикамента со сложным МНН

var pr_template_schemes_id=4208;  //  id типового назначения 
var pr_template_schemes_id_list = [4211, 4210, 4209, 4201];   //id типовых назначений, массив добавила на тот случай, если проверять буду сразу несколько типовых назначений 

var name_motconsu="Поликлиника - Направления/Назначения"


function patients_id()
{
   return (patients_id_var);
}

function pr_drugs_id()
{
   return (pr_drugs_id_var);
}

function return_version()
{
   return (version);                                                                        //!!!!!!!!!!!!!!!!!!!!!!!
}

function return_scheme_name()
{
   return (scheme_name);
}

function return_pr_template_schemes_id()
{
   return (pr_template_schemes_id);
}

function return_pr_template_schemes_id_list()
{
   return (pr_template_schemes_id_list);
}

function return_pr_drugs_id_list()
{
   return (pr_drugs_id_list);
}

function return_name_motconsu()
{
   return (name_motconsu);
}

function return_comment_text()
{                        
   return (comment_text);
}

function return_comment()
{
   return (comment);
}

function return_pr_drugs_id_composite_mnn()
{
   return (pr_drugs_id_composite_mnn)
}

function pr_templates_id()
{
   return (pr_templates_id_var)
}

function intake_method_i()
{
   return (intake_method_i_var)
}

function dose_calc()
{
   return (dose_calc_var)
}

function duration()
{
   return (duration_var)
}

function break_between_schemes()
{
   return (break_between_schemes_var)
}

function return_w1()
{
   var w1 = Sys.Process("Automedi").VCLObject("AMMain").VCLObject("pResume").VCLObject("pForm").VCLObject("pSPEGRE").Window("TScrollBoxWithControls", "", 1).VCLObject("TPatDocControl_935A08B5B8DF4F818224FADDDC3642E2").Window("TPageControl", "", 1) // w1 - объект "амбулаторные назначения"  в записи "направления-назначения"
   return (w1)
}

function return_w2()
{
    var w2 = Sys.Process("Automedi").VCLObject("AMMain").VCLObject("pGlossaire").VCLObject("pMain").VCLObject("PageControl1").VCLObject("PanelGlossDrug").VCLObject("pcDrugs") // w2 - глоссарий справа объекта "амбулаторные назначения" 
    return (w2)
}

function return_w3()
{
    var w3 = Sys.Process("Automedi").VCLObject("DirServEditor") // w3 - окно-редактор назначения 
    return (w3)
}

function return_w4()
{
    var w4 = Sys.Process("Automedi").VCLObject("fmPRDrugsRecipeEdit") // w4 - окно-редактор рецепта 
    return (w4)
}

function return_w_checkpoint(w3)         // w_checkpoint - заготовка для полей в окне-редакторе назначения  (до схемы приема)                                                               
{
    if (w3.VCLObject("pRecord").VCLObject("pcPrescr").VCLObject("tsIntakeScheme").VCLObject("pnTemplate").WaitVCLObject("fmPRPlanBuilder" , 200).Exists)
    {
          var w_checkpoint = w3.VCLObject("pRecord").VCLObject("pcPrescr").VCLObject("tsIntakeScheme").VCLObject("pnTemplate").VCLObject("fmPRPlanBuilder");
    }
    else if  (w3.VCLObject("pRecord").VCLObject("pcPrescr").VCLObject("tsIntakeScheme").VCLObject("pnTemplate").WaitVCLObject("fmPRPlanBuilder_1" , 200).Exists)
    {
          var w_checkpoint = w3.VCLObject("pRecord").VCLObject("pcPrescr").VCLObject("tsIntakeScheme").VCLObject("pnTemplate").VCLObject("fmPRPlanBuilder_1");
    }
    else if (w3.VCLObject("pRecord").VCLObject("pcPrescr").VCLObject("tsIntakeScheme").VCLObject("pnTemplate").WaitVCLObject("fmPRPlanBuilder_2" , 200).Exists)
    {
          var w_checkpoint= w3.VCLObject("pRecord").VCLObject("pcPrescr").VCLObject("tsIntakeScheme").VCLObject("pnTemplate").VCLObject("fmPRPlanBuilder_2");
    }    
    return (w_checkpoint)
}

function return_w_checkpoint_1(w3)         // w_checkpoint_1 - заготовка для полей в окне-редакторе назначения  (схема приема)                                                           
{
    if (w3.VCLObject("pRecord").VCLObject("pcPrescr").VCLObject("tsIntakeScheme").VCLObject("pnTemplate").WaitVCLObject("fmPRPlanBuilder" , 200).Exists)
    {
          var w_temp = w3.VCLObject("pRecord").VCLObject("pcPrescr").VCLObject("tsIntakeScheme").VCLObject("pnTemplate").VCLObject("fmPRPlanBuilder");
    }
    else if  (w3.VCLObject("pRecord").VCLObject("pcPrescr").VCLObject("tsIntakeScheme").VCLObject("pnTemplate").WaitVCLObject("fmPRPlanBuilder_1" , 200).Exists)
    {
          var w_temp = w3.VCLObject("pRecord").VCLObject("pcPrescr").VCLObject("tsIntakeScheme").VCLObject("pnTemplate").VCLObject("fmPRPlanBuilder_1");
    }
    else if (w3.VCLObject("pRecord").VCLObject("pcPrescr").VCLObject("tsIntakeScheme").VCLObject("pnTemplate").WaitVCLObject("fmPRPlanBuilder_2" , 200).Exists)
    {
          var w_temp = w3.VCLObject("pRecord").VCLObject("pcPrescr").VCLObject("tsIntakeScheme").VCLObject("pnTemplate").VCLObject("fmPRPlanBuilder_2");
    } 
    //
    if (w_temp.VCLObject("pnPrTemplate").VCLObject("sbTemplates").WaitVCLObject("fmPREmbeddedTemplate" , 200).Exists)
    {
          var w_checkpoint_1 = w_temp.VCLObject("pnPrTemplate").VCLObject("sbTemplates").VCLObject("fmPREmbeddedTemplate");
    }
    else if  (w_temp.VCLObject("pnPrTemplate").VCLObject("sbTemplates").WaitVCLObject("fmPREmbeddedTemplate_1" , 200).Exists)
    {
          var w_checkpoint_1 = w_temp.VCLObject("pnPrTemplate").VCLObject("sbTemplates").VCLObject("fmPREmbeddedTemplate_1");
    }
    else if (w_temp.VCLObject("pnPrTemplate").VCLObject("sbTemplates").WaitVCLObject("fmPREmbeddedTemplate_2" , 200).Exists)
    {
          var w_checkpoint_1 = w_temp.VCLObject("pnPrTemplate").VCLObject("sbTemplates").VCLObject("fmPREmbeddedTemplate_2");
    } 
    //var w_checkpoint_1 = w_temp.VCLObject("pnPrTemplate").VCLObject("sbTemplates").VCLObject("fmPREmbeddedTemplate_1");
    return (w_checkpoint_1)
}

function return_w_scheme(w1)         // w_scheme поле для схемы приема в объекте "Амбулаторные назначения"                                                              
{
    if (w1.Window("TTabSheet", "Амбулаторные назначения", 1).VCLObject("PatDrugDocAmbForm").VCLObject("PanelTop").VCLObject("TabControl1").VCLObject("PanelNaznach").VCLObject("PanelTemplate").VCLObject("pnPrTemplate").VCLObject("sbTemplates").WaitVCLObject("fmPREmbeddedTemplate" , 200).Exists)
    {
          var w_scheme = w1.Window("TTabSheet", "Амбулаторные назначения", 1).VCLObject("PatDrugDocAmbForm").VCLObject("PanelTop").VCLObject("TabControl1").VCLObject("PanelNaznach").VCLObject("PanelTemplate").VCLObject("pnPrTemplate").VCLObject("sbTemplates").VCLObject("fmPREmbeddedTemplate")
    }
    else if (w1.Window("TTabSheet", "Амбулаторные назначения", 1).VCLObject("PatDrugDocAmbForm").VCLObject("PanelTop").VCLObject("TabControl1").VCLObject("PanelNaznach").VCLObject("PanelTemplate").VCLObject("pnPrTemplate").VCLObject("sbTemplates").WaitVCLObject("fmPREmbeddedTemplate_1" , 200).Exists)
    {
          var w_scheme = w1.Window("TTabSheet", "Амбулаторные назначения", 1).VCLObject("PatDrugDocAmbForm").VCLObject("PanelTop").VCLObject("TabControl1").VCLObject("PanelNaznach").VCLObject("PanelTemplate").VCLObject("pnPrTemplate").VCLObject("sbTemplates").VCLObject("fmPREmbeddedTemplate_1")
    }
    else if (w1.Window("TTabSheet", "Амбулаторные назначения", 1).VCLObject("PatDrugDocAmbForm").VCLObject("PanelTop").VCLObject("TabControl1").VCLObject("PanelNaznach").VCLObject("PanelTemplate").VCLObject("pnPrTemplate").VCLObject("sbTemplates").WaitVCLObject("fmPREmbeddedTemplate_2" , 200).Exists)
    {
         var w_scheme = w1.Window("TTabSheet", "Амбулаторные назначения", 1).VCLObject("PatDrugDocAmbForm").VCLObject("PanelTop").VCLObject("TabControl1").VCLObject("PanelNaznach").VCLObject("PanelTemplate").VCLObject("pnPrTemplate").VCLObject("sbTemplates").VCLObject("fmPREmbeddedTemplate_2")
    } 
    return (w_scheme)
}

function calculator_dose(w2, number)    //функция на калькуляторе набирает дозировку
{
    str_calc_number = String(number);
    for (i = 0; i < str_calc_number.length; i++)
    {
        if (str_calc_number.charAt(i)==".")
        {
            var button_name = "btnDecFrac"
        }
        else
        {
            var button_name="btn"+str_calc_number.charAt(i);
        }
        w2.VCLObject("tsAppSchemes").VCLObject("AppSchemesForm").VCLObject("fSimpleTemplateEdit").VCLObject(button_name).Click();         
    }
    w2.VCLObject("tsAppSchemes").VCLObject("AppSchemesForm").VCLObject("fSimpleTemplateEdit").VCLObject("btnDosage").Click();  
}

function intake(w1, i)
{
    if (version == 4)
    {
          //поле для способа введения
          w1.VCLObject("PanelNaznach").VCLObject("dblPrIntakeMethods").VCLObject("Code").Window("Edit", "", 1).Click(); 
          var j=i*15.6-5;
          Sys.Process("Automedi").VCLObject("AMMain").VCLObject("pGlossaire").VCLObject("pMain").VCLObject("PageControl1").VCLObject("GlossarySheet").VCLObject("tcGlossKind").Window("TGlossViewer", "", 1).DblClick(38, j);
    }
    else if (version == 5)
    {
          //поле для способа введения
          w1.VCLObject("PanelNaznach").VCLObject("SimplePanel").VCLObject("dblPrIntakeMethods").VCLObject("Code").Window("Edit", "", 1).Click(); 
          var j=i*15.6-5;
          Sys.Process("Automedi").VCLObject("AMMain").VCLObject("pGlossaire").VCLObject("pMain").VCLObject("PageControl1").VCLObject("GlossarySheet").VCLObject("tcGlossKind").Window("TGlossViewer", "", 1).DblClick(38, j);
    }
} 

function intake1(w0, i)
{  
    var j=i*15.6-5;
    w0.pRecord.VCLObject("pGlossaire").VCLObject("pMain").VCLObject("PageControl1").VCLObject("GlossarySheet").VCLObject("tcGlossKind").Window("TGlossViewer", "", 1).DblClick(38, j);
} 

function close_confirmation_window(w0)   //окно "Связь с приемом пищи"
{
    if (w0.WaitWindow("TMessageForm", "Подтверждение", -1, 1500).Exists)
      {
         w0.Window("TMessageForm", "Подтверждение", 1).VCLObject("No").Click();
         if (w0.WaitWindow("TMessageForm", "Подтверждение", -1, 1500).Exists)     //это нужно будет убрать сразу после того как ошибку исправят, второго предупреждения быть не должно
         {
             w0.Window("TMessageForm", "Подтверждение", 1).VCLObject("No").Click();
         }         
      }
}

function close_edit_window (w0)  //  окно "снять запрет на редактирование"    
{
    if (w0.WaitWindow("TMessageForm", "Подтверждение", 1, 700).Exists)
      {
         w0.Window("TMessageForm", "Подтверждение", 1).VCLObject("Yes").Click(); 
         delay (1500);       
      }
}                      

function find_amb_prescriptions(height, max_height)
{
  current_height=127
  while (current_height+height < max_height)// && (.Window("TTabSheet", "Амбулаторные назначения", 1).VCLObject("PatDrugDocAmbForm").VCLObject("RecipePanel").VCLObject("TabControl2")))
  {
      current_height=current_height+height;
     // Aliases.Automedi.AMMain.pResume.pForm.pSPEGRE.TScrollBoxWithControls.VScroll.Pos=current_height;
     Sys.Process("Automedi").VCLObject("AMMain").VCLObject("pResume").VCLObject("pForm").VCLObject("pSPEGRE").Window("TScrollBoxWithControls", "", 1).VScroll.Pos=current_height;  
  }       
  
 // Sys.Process("Automedi").VCLObject("AMMain").VCLObject("pResume").VCLObject("pForm").VCLObject("pSPEGRE").Window("TScrollBoxWithControls", "", 1).VScroll.Pos=current_height+250;
}

function db_connection(query)
{
    var AConnection, RecSet, Cmd, Prm;
    AConnection = ADO.CreateConnection();
    AConnection.ConnectionString = "Provider=MSDASQL;Persist Security Info=False;User ID=sa;password=system;Data Source=gresova";
    AConnection.Open();
    Cmd = ADO.CreateCommand();
    Cmd = new ActiveXObject("ADODB.Command");
    Cmd.ActiveConnection = AConnection;
    Cmd.CommandType = adCmdText; 
    Cmd.CommandText =  query;
    RecSet = Cmd.Execute();
    return(RecSet)
}   



/*

// это переменные для работы на БД  7_ДФ:

var w0_var=Sys.Process("Automedi"); 
var version = 5; 

    
var comment = 1 // нужен ли комментарий при созании назначения: 0 - нет , 1 - да
var comment_text = "1239e9qewioJSOWIE"
var patients_id_var = 3486143   //  
var pr_drugs_id_var = 2   // id медикамента
var scheme_name = "тест_гресова"  //название схемы приема из контекстного меню медикамента
var pr_drugs_id_list = [17, 56, 2] //id медикаментов, на основе которых делается составное назначение 
var pr_templates_id_var = 109 // id схемы приема
var intake_method_i_var =  3 //просто порядковый номер способа введения из глоссария 
var dose_calc_var = 13.56; //  дозировка для ввода в калькулятор
var duration_var = 5;  //   длительность назначения (дней, месяцев и т.д.)
var break_between_schemes_var = 7  //  перерыв между схемами

var pr_drugs_id_composite_mnn = 620; // id медикамента со сложным МНН

var pr_template_schemes_id = 132  //  id типового назначения 
var pr_template_schemes_id_list = [4211, 4210, 4209, 4201];   //id типовых назначений, массив добавила на тот случай, если проверять буду сразу несколько типовых назначений 

var name_motconsu="Поликлиника - Направления/Назначения"


function patients_id()
{
   return (patients_id_var);
}

function pr_drugs_id()
{
   return (pr_drugs_id_var);
}

function return_version()
{
   return (version);                                                                        //!!!!!!!!!!!!!!!!!!!!!!!
}

function return_scheme_name()
{
   return (scheme_name);
}

function return_pr_template_schemes_id()
{
   return (pr_template_schemes_id);
}

function return_pr_template_schemes_id_list()
{
   return (pr_template_schemes_id_list);
}

function return_pr_drugs_id_list()
{
   return (pr_drugs_id_list);
}

function return_name_motconsu()
{
   return (name_motconsu);
}

function return_comment_text()
{                        
   return (comment_text);
}

function return_comment()
{
   return (comment);
}

function return_pr_drugs_id_composite_mnn()
{
   return (pr_drugs_id_composite_mnn)
}

function pr_templates_id()
{
   return (pr_templates_id_var)
}

function intake_method_i()
{
   return (intake_method_i_var)
}

function dose_calc()
{
   return (dose_calc_var)
}

function duration()
{
   return (duration_var)
}

function break_between_schemes()
{
   return (break_between_schemes_var)
}

function return_w1() //w1 - объект "амбулаторные назначения"  в записи "направления-назначения"  
{
   var w1 = Sys.Process("Automedi").VCLObject("AMMain").VCLObject("pResume").VCLObject("pForm").VCLObject("pSPEGRE").Window("TScrollBoxWithControls", "", 1).VCLObject("TFormContainer_0EA7FFE2B61A4DB89C46D8DB3914F581").VCLObject("TPatDocControl_06A7387926F24F439495B88DD13FEC23").Window("TPageControl", "", 1)
   return (w1)
}

function return_w2()  //w2 - глоссарий справа объекта "амбулаторные назначения"  
{
    var w2 = Sys.Process("Automedi").VCLObject("AMMain").VCLObject("pGlossaire").VCLObject("pMain").VCLObject("PageControl1").VCLObject("PanelGlossDrug").VCLObject("pcDrugs")
    return (w2)
}

function return_w3() //w3 - окно-редактор назначения  
{
    var w3 = Sys.Process("Automedi").VCLObject("DirServEditor") // w3 - окно-редактор назначения 
    return (w3)
}

function return_w4() //w4 - окно-редактор рецепта
{
    var w4 = Sys.Process("Automedi").VCLObject("fmPRDrugsRecipeEdit") // w4 - окно-редактор рецепта 
    return (w4)
}

function return_w_checkpoint(w3)         // w_checkpoint - заготовка для полей в окне-редакторе назначения  (до схемы приема)                                                               
{
    if (w3.VCLObject("pRecord").VCLObject("pcPrescr").VCLObject("tsIntakeScheme").VCLObject("pnTemplate").WaitVCLObject("fmPRPlanBuilder" , 200).Exists)
    {
          var w_checkpoint = w3.VCLObject("pRecord").VCLObject("pcPrescr").VCLObject("tsIntakeScheme").VCLObject("pnTemplate").VCLObject("fmPRPlanBuilder");
    }
    else if  (w3.VCLObject("pRecord").VCLObject("pcPrescr").VCLObject("tsIntakeScheme").VCLObject("pnTemplate").WaitVCLObject("fmPRPlanBuilder_1" , 200).Exists)
    {
          var w_checkpoint = w3.VCLObject("pRecord").VCLObject("pcPrescr").VCLObject("tsIntakeScheme").VCLObject("pnTemplate").VCLObject("fmPRPlanBuilder_1");
    }
    else if (w3.VCLObject("pRecord").VCLObject("pcPrescr").VCLObject("tsIntakeScheme").VCLObject("pnTemplate").WaitVCLObject("fmPRPlanBuilder_2" , 200).Exists)
    {
          var w_checkpoint= w3.VCLObject("pRecord").VCLObject("pcPrescr").VCLObject("tsIntakeScheme").VCLObject("pnTemplate").VCLObject("fmPRPlanBuilder_2");
    }    
    return (w_checkpoint)
}

function return_w_checkpoint_1(w3)         // w_checkpoint_1 - заготовка для полей в окне-редакторе назначения  (схема приема)                                                           
{
    if (w3.VCLObject("pRecord").VCLObject("pcPrescr").VCLObject("tsIntakeScheme").VCLObject("pnTemplate").WaitVCLObject("fmPRPlanBuilder" , 200).Exists)
    {
          var w_temp = w3.VCLObject("pRecord").VCLObject("pcPrescr").VCLObject("tsIntakeScheme").VCLObject("pnTemplate").VCLObject("fmPRPlanBuilder");
    }
    else if  (w3.VCLObject("pRecord").VCLObject("pcPrescr").VCLObject("tsIntakeScheme").VCLObject("pnTemplate").WaitVCLObject("fmPRPlanBuilder_1" , 200).Exists)
    {
          var w_temp = w3.VCLObject("pRecord").VCLObject("pcPrescr").VCLObject("tsIntakeScheme").VCLObject("pnTemplate").VCLObject("fmPRPlanBuilder_1");
    }
    else if (w3.VCLObject("pRecord").VCLObject("pcPrescr").VCLObject("tsIntakeScheme").VCLObject("pnTemplate").WaitVCLObject("fmPRPlanBuilder_2" , 200).Exists)
    {
          var w_temp = w3.VCLObject("pRecord").VCLObject("pcPrescr").VCLObject("tsIntakeScheme").VCLObject("pnTemplate").VCLObject("fmPRPlanBuilder_2");
    } 
    //
    if (w_temp.VCLObject("pnPrTemplate").VCLObject("sbTemplates").WaitVCLObject("fmPREmbeddedTemplate" , 200).Exists)
    {
          var w_checkpoint_1 = w_temp.VCLObject("pnPrTemplate").VCLObject("sbTemplates").VCLObject("fmPREmbeddedTemplate");
    }
    else if  (w_temp.VCLObject("pnPrTemplate").VCLObject("sbTemplates").WaitVCLObject("fmPREmbeddedTemplate_1" , 200).Exists)
    {
          var w_checkpoint_1 = w_temp.VCLObject("pnPrTemplate").VCLObject("sbTemplates").VCLObject("fmPREmbeddedTemplate_1");
    }
    else if (w_temp.VCLObject("pnPrTemplate").VCLObject("sbTemplates").WaitVCLObject("fmPREmbeddedTemplate_2" , 200).Exists)
    {
          var w_checkpoint_1 = w_temp.VCLObject("pnPrTemplate").VCLObject("sbTemplates").VCLObject("fmPREmbeddedTemplate_2");
    } 
    //var w_checkpoint_1 = w_temp.VCLObject("pnPrTemplate").VCLObject("sbTemplates").VCLObject("fmPREmbeddedTemplate_1");
    return (w_checkpoint_1)
}

function return_w_scheme(w1)         // w_scheme поле для схемы приема в объекте "Амбулаторные назначения"                                                              
{
    if (w1.Window("TTabSheet", "Амбулаторные назначения", 1).VCLObject("PatDrugDocAmbForm").VCLObject("PanelTop").VCLObject("TabControl1").VCLObject("PanelNaznach").VCLObject("PanelTemplate").VCLObject("pnPrTemplate").VCLObject("sbTemplates").WaitVCLObject("fmPREmbeddedTemplate" , 200).Exists)
    {
          var w_scheme = w1.Window("TTabSheet", "Амбулаторные назначения", 1).VCLObject("PatDrugDocAmbForm").VCLObject("PanelTop").VCLObject("TabControl1").VCLObject("PanelNaznach").VCLObject("PanelTemplate").VCLObject("pnPrTemplate").VCLObject("sbTemplates").VCLObject("fmPREmbeddedTemplate")
    }
    else if (w1.Window("TTabSheet", "Амбулаторные назначения", 1).VCLObject("PatDrugDocAmbForm").VCLObject("PanelTop").VCLObject("TabControl1").VCLObject("PanelNaznach").VCLObject("PanelTemplate").VCLObject("pnPrTemplate").VCLObject("sbTemplates").WaitVCLObject("fmPREmbeddedTemplate_1" , 200).Exists)
    {
          var w_scheme = w1.Window("TTabSheet", "Амбулаторные назначения", 1).VCLObject("PatDrugDocAmbForm").VCLObject("PanelTop").VCLObject("TabControl1").VCLObject("PanelNaznach").VCLObject("PanelTemplate").VCLObject("pnPrTemplate").VCLObject("sbTemplates").VCLObject("fmPREmbeddedTemplate_1")
    }
    else if (w1.Window("TTabSheet", "Амбулаторные назначения", 1).VCLObject("PatDrugDocAmbForm").VCLObject("PanelTop").VCLObject("TabControl1").VCLObject("PanelNaznach").VCLObject("PanelTemplate").VCLObject("pnPrTemplate").VCLObject("sbTemplates").WaitVCLObject("fmPREmbeddedTemplate_2" , 200).Exists)
    {
         var w_scheme = w1.Window("TTabSheet", "Амбулаторные назначения", 1).VCLObject("PatDrugDocAmbForm").VCLObject("PanelTop").VCLObject("TabControl1").VCLObject("PanelNaznach").VCLObject("PanelTemplate").VCLObject("pnPrTemplate").VCLObject("sbTemplates").VCLObject("fmPREmbeddedTemplate_2")
    } 
    return (w_scheme)
}

function calculator_dose(w2, number)  //функция на калькуляторе набирает дозировку
{
    str_calc_number = String(number);
    for (i = 0; i < str_calc_number.length; i++)
    {
        if (str_calc_number.charAt(i)==".")
        {
            var button_name = "btnDecFrac"
        }
        else
        {
            var button_name="btn"+str_calc_number.charAt(i);
        }
        w2.VCLObject("tsAppSchemes").VCLObject("AppSchemesForm").VCLObject("fSimpleTemplateEdit").VCLObject(button_name).Click();         
    }
    w2.VCLObject("tsAppSchemes").VCLObject("AppSchemesForm").VCLObject("fSimpleTemplateEdit").VCLObject("btnDosage").Click();  
}

function intake(w1, i)
{
    if (version == 4)
    {
          //поле для способа введения
          w1.VCLObject("PanelNaznach").VCLObject("dblPrIntakeMethods").VCLObject("Code").Window("Edit", "", 1).Click(); 
          var j=i*15.6-5;
          Sys.Process("Automedi").VCLObject("AMMain").VCLObject("pGlossaire").VCLObject("pMain").VCLObject("PageControl1").VCLObject("GlossarySheet").VCLObject("tcGlossKind").Window("TGlossViewer", "", 1).DblClick(38, j);
    }
    else if (version == 5)
    {
          //поле для способа введения
          w1.VCLObject("PanelNaznach").VCLObject("SimplePanel").VCLObject("dblPrIntakeMethods").VCLObject("Code").Window("Edit", "", 1).Click(); 
          var j=i*15.6-5;
          Sys.Process("Automedi").VCLObject("AMMain").VCLObject("pGlossaire").VCLObject("pMain").VCLObject("PageControl1").VCLObject("GlossarySheet").VCLObject("tcGlossKind").Window("TGlossViewer", "", 1).DblClick(38, j);
    }
} 


function intake1(w0, i)
{  
    var j=i*15.6-5;
    w0.pRecord.VCLObject("pGlossaire").VCLObject("pMain").VCLObject("PageControl1").VCLObject("GlossarySheet").VCLObject("tcGlossKind").Window("TGlossViewer", "", 1).DblClick(38, j);
} 

function close_confirmation_window(w0)
{
    if (w0.WaitWindow("TMessageForm", "Подтверждение", -1, 1500).Exists)
      {
         w0.Window("TMessageForm", "Подтверждение", 1).VCLObject("No").Click();
         if (w0.WaitWindow("TMessageForm", "Подтверждение", -1, 1500).Exists)     //это нужно будет убрать сразу после того как ошибку исправят, второго предупреждения быть не должно
         {
             w0.Window("TMessageForm", "Подтверждение", 1).VCLObject("No").Click();
         }         
      }
} 

function close_edit_window (w0)  //  окно "снять запрет на редактирование"    
{
    if (w0.WaitWindow("TMessageForm", "Подтверждение", 1, 700).Exists)
      {
         w0.Window("TMessageForm", "Подтверждение", 1).VCLObject("Yes").Click(); 
         delay (1500);       
      }
}

function find_amb_prescriptions(height, max_height)
{
  current_height=127
  while (current_height+height < max_height)
  {
      current_height=current_height+height;
      Aliases.Automedi.AMMain.pResume.pForm.pSPEGRE.TScrollBoxWithControls.VScroll.Pos=current_height;
  }  
}

function db_connection(query)
{
    var AConnection, RecSet, Cmd, Prm;
    AConnection = ADO.CreateConnection();
    AConnection.ConnectionString = "Provider=MSDASQL;Persist Security Info=False;User ID=sa;password=system;Data Source=gresova_1";
    AConnection.Open();
    Cmd = ADO.CreateCommand();
    Cmd = new ActiveXObject("ADODB.Command");
    Cmd.ActiveConnection = AConnection;
    Cmd.CommandType = adCmdText; 
    Cmd.CommandText =  query;
    RecSet = Cmd.Execute();
    return(RecSet)
}

 */


// это переменные для работы на БД 7_ДФ версии 10.4

/*
var w0_var=Sys.Process("Automedi");
var version = 4;

var comment = 1 // нужен ли комментарий при созании назначения: 0 -нет , 1 - да
var comment_text = "1239e9qewioJSOWIE"
var patients_id_var = 3492410;
var pr_drugs_id_var = 9   //id медикамента
var scheme_name="схема_постоянно *" //название схемы приема из контекстного меню медикамента
var pr_drugs_id_list = [9, 47, 55];   //id медикаментов, на основе которых делается составное назначение 
var pr_templates_id_var = 152; //id схемы приема
var intake_method_i_var = 2; //просто порядковый номер способа введения из глоссария 
var dose_calc_var = 13.56; //дозировка для ввода в калькулятор
var duration_var = 5;  //длительность назначения (дней, месяцев и т.д.)
var break_between_schemes_var = 7  //перерыв между схемами

var pr_drugs_id_composite_mnn = 620; //id медикамента со сложным МНН

var pr_template_schemes_id = 132;  //id типового назначения 
var pr_template_schemes_id_list = [4211, 4210, 4209, 4201];   //id типовых назначений, массив добавила на тот случай, если проверять буду сразу несколько типовых назначений 

var name_motconsu="Поликлиника - Направления/Назначения"


function patients_id()
{
   return (patients_id_var);
}

function pr_drugs_id()
{
   return (pr_drugs_id_var);
}

function return_version()
{
   return (version);                                                                        //!!!!!!!!!!!!!!!!!!!!!!!
}

function return_scheme_name()
{
   return (scheme_name);
}

function return_pr_template_schemes_id()
{
   return (pr_template_schemes_id);
}

function return_pr_template_schemes_id_list()
{
   return (pr_template_schemes_id_list);
}

function return_pr_drugs_id_list()
{
   return (pr_drugs_id_list);
}

function return_name_motconsu()
{
   return (name_motconsu);
}

function return_comment_text()
{                        
   return (comment_text);
}

function return_comment()
{
   return (comment);
}

function return_pr_drugs_id_composite_mnn()
{
   return (pr_drugs_id_composite_mnn)
}

function pr_templates_id()
{
   return (pr_templates_id_var)
}

function intake_method_i()
{
   return (intake_method_i_var)
}

function dose_calc()
{
   return (dose_calc_var)
}

function duration()
{
   return (duration_var)
}

function break_between_schemes()
{
   return (break_between_schemes_var)
}

function return_w1() // w1 - объект "амбулаторные назначения"  в записи "направления-назначения" 
{
    var w1 = Sys.Process("Automedi").VCLObject("AMMain").VCLObject("pResume").VCLObject("pForm").VCLObject("pSPEGRE").Window("TScrollBoxWithControls", "", 1).VCLObject("TFormContainer_0EA7FFE2B61A4DB89C46D8DB3914F581").VCLObject("TPatDocControl_06A7387926F24F439495B88DD13FEC23").Window("TPageControl", "", 1);
    return (w1)
}

function return_w2()  // w2 - глоссарий справа объекта "амбулаторные назначения"  
{
    var w2 = Sys.Process("Automedi").VCLObject("AMMain").VCLObject("pGlossaire").VCLObject("pMain").VCLObject("PageControl1").VCLObject("PanelGlossDrug").VCLObject("pcDrugs") // w2 - глоссарий справа объекта "амбулаторные назначения" 
    return (w2)
}

function return_w3()  // w3 - окно-редактор назначения
{
    var w3 = Sys.Process("Automedi").VCLObject("DirServEditor"); 
    return (w3)
}

function return_w4()            // w4 - окно-редактор рецепта 
{
    var w4 = Sys.Process("Automedi").VCLObject("fmPRDrugsRecipeEdit");  
    return (w4)
}

function return_w_checkpoint(w3)         // w_checkpoint - заготовка для полей в окне-редакторе назначения  (до схемы приема)                                                               
{
    if (w3.VCLObject("pRecord").VCLObject("pcPrescr").VCLObject("tsIntakeScheme").VCLObject("pnTemplate").WaitVCLObject("fmPRPlanBuilder" , 200).Exists)
    {
          var w_checkpoint = w3.VCLObject("pRecord").VCLObject("pcPrescr").VCLObject("tsIntakeScheme").VCLObject("pnTemplate").VCLObject("fmPRPlanBuilder");
    }
    else if  (w3.VCLObject("pRecord").VCLObject("pcPrescr").VCLObject("tsIntakeScheme").VCLObject("pnTemplate").WaitVCLObject("fmPRPlanBuilder_1" , 200).Exists)
    {
          var w_checkpoint = w3.VCLObject("pRecord").VCLObject("pcPrescr").VCLObject("tsIntakeScheme").VCLObject("pnTemplate").VCLObject("fmPRPlanBuilder_1");
    }
    else if (w3.VCLObject("pRecord").VCLObject("pcPrescr").VCLObject("tsIntakeScheme").VCLObject("pnTemplate").WaitVCLObject("fmPRPlanBuilder_2" , 200).Exists)
    {
          var w_checkpoint= w3.VCLObject("pRecord").VCLObject("pcPrescr").VCLObject("tsIntakeScheme").VCLObject("pnTemplate").VCLObject("fmPRPlanBuilder_2");
    }    
    return (w_checkpoint)
}

function return_w_checkpoint_1(w3)         // w_checkpoint_1 - заготовка для полей в окне-редакторе назначения  (схема приема)                                                           
{
    if (w3.VCLObject("pRecord").VCLObject("pcPrescr").VCLObject("tsIntakeScheme").VCLObject("pnTemplate").WaitVCLObject("fmPRPlanBuilder" , 200).Exists)
    {
          var w_temp = w3.VCLObject("pRecord").VCLObject("pcPrescr").VCLObject("tsIntakeScheme").VCLObject("pnTemplate").VCLObject("fmPRPlanBuilder");
    }
    else if  (w3.VCLObject("pRecord").VCLObject("pcPrescr").VCLObject("tsIntakeScheme").VCLObject("pnTemplate").WaitVCLObject("fmPRPlanBuilder_1" , 200).Exists)
    {
          var w_temp = w3.VCLObject("pRecord").VCLObject("pcPrescr").VCLObject("tsIntakeScheme").VCLObject("pnTemplate").VCLObject("fmPRPlanBuilder_1");
    }
    else if (w3.VCLObject("pRecord").VCLObject("pcPrescr").VCLObject("tsIntakeScheme").VCLObject("pnTemplate").WaitVCLObject("fmPRPlanBuilder_2" , 200).Exists)
    {
          var w_temp = w3.VCLObject("pRecord").VCLObject("pcPrescr").VCLObject("tsIntakeScheme").VCLObject("pnTemplate").VCLObject("fmPRPlanBuilder_2");
    } 
    //
    if (w_temp.VCLObject("pnPrTemplate").VCLObject("sbTemplates").WaitVCLObject("fmPREmbeddedTemplate" , 200).Exists)
    {
          var w_checkpoint_1 = w_temp.VCLObject("pnPrTemplate").VCLObject("sbTemplates").VCLObject("fmPREmbeddedTemplate");
    }
    else if  (w_temp.VCLObject("pnPrTemplate").VCLObject("sbTemplates").WaitVCLObject("fmPREmbeddedTemplate_1" , 200).Exists)
    {
          var w_checkpoint_1 = w_temp.VCLObject("pnPrTemplate").VCLObject("sbTemplates").VCLObject("fmPREmbeddedTemplate_1");
    }
    else if (w_temp.VCLObject("pnPrTemplate").VCLObject("sbTemplates").WaitVCLObject("fmPREmbeddedTemplate_2" , 200).Exists)
    {
          var w_checkpoint_1 = w_temp.VCLObject("pnPrTemplate").VCLObject("sbTemplates").VCLObject("fmPREmbeddedTemplate_2");
    } 
    //var w_checkpoint_1 = w_temp.VCLObject("pnPrTemplate").VCLObject("sbTemplates").VCLObject("fmPREmbeddedTemplate_1");
    return (w_checkpoint_1)
}

function return_w_scheme(w1)         // w_scheme поле для схемы приема в объекте "Амбулаторные назначения"                                                              
{
    if (w1.Window("TTabSheet", "Амбулаторные назначения", 1).VCLObject("PatDrugDocAmbForm").VCLObject("PanelTop").VCLObject("TabControl1").VCLObject("PanelNaznach").VCLObject("PanelTemplate").VCLObject("pnPrTemplate").VCLObject("sbTemplates").WaitVCLObject("fmPREmbeddedTemplate" , 200).Exists)
    {
          var w_scheme = w1.Window("TTabSheet", "Амбулаторные назначения", 1).VCLObject("PatDrugDocAmbForm").VCLObject("PanelTop").VCLObject("TabControl1").VCLObject("PanelNaznach").VCLObject("PanelTemplate").VCLObject("pnPrTemplate").VCLObject("sbTemplates").VCLObject("fmPREmbeddedTemplate")
    }
    else if (w1.Window("TTabSheet", "Амбулаторные назначения", 1).VCLObject("PatDrugDocAmbForm").VCLObject("PanelTop").VCLObject("TabControl1").VCLObject("PanelNaznach").VCLObject("PanelTemplate").VCLObject("pnPrTemplate").VCLObject("sbTemplates").WaitVCLObject("fmPREmbeddedTemplate_1" , 200).Exists)
    {
          var w_scheme = w1.Window("TTabSheet", "Амбулаторные назначения", 1).VCLObject("PatDrugDocAmbForm").VCLObject("PanelTop").VCLObject("TabControl1").VCLObject("PanelNaznach").VCLObject("PanelTemplate").VCLObject("pnPrTemplate").VCLObject("sbTemplates").VCLObject("fmPREmbeddedTemplate_1")
    }
    else if (w1.Window("TTabSheet", "Амбулаторные назначения", 1).VCLObject("PatDrugDocAmbForm").VCLObject("PanelTop").VCLObject("TabControl1").VCLObject("PanelNaznach").VCLObject("PanelTemplate").VCLObject("pnPrTemplate").VCLObject("sbTemplates").WaitVCLObject("fmPREmbeddedTemplate_2" , 200).Exists)
    {
         var w_scheme = w1.Window("TTabSheet", "Амбулаторные назначения", 1).VCLObject("PatDrugDocAmbForm").VCLObject("PanelTop").VCLObject("TabControl1").VCLObject("PanelNaznach").VCLObject("PanelTemplate").VCLObject("pnPrTemplate").VCLObject("sbTemplates").VCLObject("fmPREmbeddedTemplate_2")
    } 
    return (w_scheme)
}

function calculator_dose(w2, number)    //функция на калькуляторе набирает дозировку
{
    str_calc_number = String(number);
    for (i = 0; i < str_calc_number.length; i++)
    {
        if (str_calc_number.charAt(i)==".")
        {
            var button_name = "btnDecFrac"
        }
        else
        {
            var button_name="btn"+str_calc_number.charAt(i);
        }
        w2.VCLObject("tsAppSchemes").VCLObject("AppSchemesForm").VCLObject("fSimpleTemplateEdit").VCLObject(button_name).Click();         
    }
    w2.VCLObject("tsAppSchemes").VCLObject("AppSchemesForm").VCLObject("fSimpleTemplateEdit").VCLObject("btnDosage").Click();  
}

function intake(w1, i)
{
    if (version == 4)
    {
          //поле для способа введения
          w1.VCLObject("PanelNaznach").VCLObject("dblPrIntakeMethods").VCLObject("Code").Window("Edit", "", 1).Click(); 
          var j=i*15.6-5;
          Sys.Process("Automedi").VCLObject("AMMain").VCLObject("pGlossaire").VCLObject("pMain").VCLObject("PageControl1").VCLObject("GlossarySheet").VCLObject("tcGlossKind").Window("TGlossViewer", "", 1).DblClick(38, j);
    }
    else if (version == 5)
    {
          //поле для способа введения
          w1.VCLObject("PanelNaznach").VCLObject("SimplePanel").VCLObject("dblPrIntakeMethods").VCLObject("Code").Window("Edit", "", 1).Click(); 
          var j=i*15.6-5;
          Sys.Process("Automedi").VCLObject("AMMain").VCLObject("pGlossaire").VCLObject("pMain").VCLObject("PageControl1").VCLObject("GlossarySheet").VCLObject("tcGlossKind").Window("TGlossViewer", "", 1).DblClick(38, j);
    }
} 

function intake1(w0, i)
{  
    var j=i*15.6-5;
    w0.pRecord.VCLObject("pGlossaire").VCLObject("pMain").VCLObject("PageControl1").VCLObject("GlossarySheet").VCLObject("tcGlossKind").Window("TGlossViewer", "", 1).DblClick(38, j);
} 

function close_confirmation_window(w0)   //окно "Связь с приемом пищи"
{
    if (w0.WaitWindow("TMessageForm", "Подтверждение", -1, 1500).Exists)
      {
         w0.Window("TMessageForm", "Подтверждение", 1).VCLObject("No").Click();
         if (w0.WaitWindow("TMessageForm", "Подтверждение", -1, 1500).Exists)     //это нужно будет убрать сразу после того как ошибку исправят, второго предупреждения быть не должно
         {
             w0.Window("TMessageForm", "Подтверждение", 1).VCLObject("No").Click();
         }         
      }
}

function close_edit_window (w0)  //  окно "снять запрет на редактирование"    
{
    if (w0.WaitWindow("TMessageForm", "Подтверждение", 1, 700).Exists)
      {
         w0.Window("TMessageForm", "Подтверждение", 1).VCLObject("Yes").Click(); 
         delay (1500);       
      }
} 

function find_amb_prescriptions(height, max_height)
{
  current_height=127
  while (current_height+height < max_height)
  {
      current_height=current_height+height;
      Aliases.Automedi.AMMain.pResume.pForm.pSPEGRE.TScrollBoxWithControls.VScroll.Pos=current_height;
  }  
}

function db_connection(query)
{
    var AConnection, RecSet, Cmd, Prm;
    AConnection = ADO.CreateConnection();
    AConnection.ConnectionString = "Provider=MSDASQL;Persist Security Info=False;User ID=sa;password=system;Data Source=gresova_10_4";
    AConnection.Open();
    Cmd = ADO.CreateCommand();
    Cmd = new ActiveXObject("ADODB.Command");
    Cmd.ActiveConnection = AConnection;
    Cmd.CommandType = adCmdText; 
    Cmd.CommandText =  query;
    RecSet = Cmd.Execute();
    return(RecSet)
}

*/























