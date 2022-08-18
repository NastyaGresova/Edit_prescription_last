function Test4()     // создание составного назначения 
{
    var w0=Sys.Process("Automedi");    
    var pr_drugs_id_list = Runner.CallMethod("Unit_var.return_pr_drugs_id_list");  //id медикаментов, на основе которых делается составное назначение
  
    /*max_height = w0.VCLObject("AMMain").VCLObject("pResume").VCLObject("pForm").VCLObject("pSPEGRE").Window("TScrollBoxWithControls", "", 1).VScroll.Max; 
    height=w0.VCLObject("AMMain").VCLObject("pResume").Height
    Runner.CallMethod("Unit_var.find_amb_prescriptions",height, max_height);  */
    
    //w1 - объект "амбулаторные назначения"
    var w1 = Runner.CallMethod("Unit_var.return_w1");
    
    var w_AmbForm = w1.Window("TTabSheet", "Амбулаторные назначения", 1).VCLObject("PatDrugDocAmbForm");      
    
    Runner.CallMethod("Unit_var.intake", w_AmbForm.VCLObject("PanelTop").VCLObject("TabControl1"), Runner.CallMethod("Unit_var.intake_method_i"));
    Runner.CallMethod("Unit_var.close_edit_window", w0);   
    delay(1000);     
                      
    w_AmbForm.VCLObject("PanelTop").VCLObject("TabControl1").ClickTab("Составные");  
    
    // грид: 
    w_grid = w_AmbForm.VCLObject("pGrid").VCLObject("GridPanel").VCLObject("Grid");
    w_grid.VScroll.Pos=1;
  
    for (var i = 0; i < pr_drugs_id_list.length; i++)
    { 
        var w_Search = Runner.CallMethod("Unit_var.return_w2").VCLObject("tsDrugList").VCLObject("GridDrugsForm").VCLObject("pGrid").VCLObject("pSearch");
        w_Search.Window("TEdit", "", 1).Keys(pr_drugs_id_list[i]);
        //поле очищать надо после айдишника
        delay(2500) ;
        Runner.CallMethod("Unit_var.return_w2").VCLObject("tsDrugList").VCLObject("GridDrugsForm").VCLObject("tbAddDrug").Click();
        Runner.CallMethod("Unit_var.close_confirmation_window", w0); 
        w_Search.Window("TEdit", "", 1).ClickR();
        w_Search.Window("TEdit", "", 1).PopupMenu.Click("Выделить все");
        w_Search.Window("TEdit", "", 1).ClickR(); 
        w_Search.Window("TEdit", "", 1).PopupMenu.Click("Удалить");
    }  
    
    //заполнение (или незаполнение) комментария                                                                                                                                                                               
    if (Runner.CallMethod("Unit_var.return_comment") == 1)                                                                                                                                 
    {
        w_AmbForm.VCLObject("PanelTop").VCLObject("TabControl1").VCLObject("PanelNaznach").VCLObject("memComment").Keys(Runner.CallMethod("Unit_var.return_comment_text"));
    }
    
    w_AmbForm.VCLObject("PanelTop").VCLObject("TabControl1").VCLObject("PanelNaznach").VCLObject("btnAddDrugPrescr").Click();
    w_AmbForm.VCLObject("PanelTop").VCLObject("TabControl1").ClickTab("Простые"); 

    delay(2500);
  
    w_grid.VScroll.Pos=2;
    delay(1000);
    w_grid.VScroll.Pos=3;
    delay(1000); 
    w_grid.VScroll.Pos=2;
    delay(1000); 
  
    //открываю на просмотр                
    w_AmbForm.VCLObject("pTop").VCLObject("pTool").VCLObject("ToolBar").VCLObject("TToolButton_11").Click();

    // w3 - окно-редактор медикамента
    var w3 = Runner.CallMethod("Unit_var.return_w3");
  
    //делаю запросы к БД, чтобы дальше проверить, что в БД все правильно заполнено
    var query_patdirec_drugs = "select top 1 * from PATDIREC_DRUGS order by patdirec_id desc";
    RecSet_patdirec_drug = Runner.CallMethod("Unit_var.db_connection", query_patdirec_drugs ); 
  
    DRUG_DESCR = RecSet_patdirec_drug.Fields("DRUG_DESCR");
    IS_MIXT =  RecSet_patdirec_drug.Fields("IS_MIXT");
    PR_TYPE =  RecSet_patdirec_drug.Fields("PR_TYPE");
    DM_MEASURE_ID = RecSet_patdirec_drug.Fields("DM_MEASURE_ID");
    DOSE_COUNT = RecSet_patdirec_drug.Fields("DOSE_COUNT"); 
    PR_INTAKE_METHODS_ID = RecSet_patdirec_drug.Fields("PR_INTAKE_METHODS_ID");
    
    var query_patdirec = "select top 1 * from PATDIREC order by patdirec_id desc";
    RecSet_patdirec = Runner.CallMethod("Unit_var.db_connection", query_patdirec);
    
    DESCRIPTION = RecSet_patdirec.Fields("DESCRIPTION");
    COMMENTAIRE = RecSet_patdirec.Fields("COMMENTAIRE");                   
    CANCELLED  = RecSet_patdirec.Fields("CANCELLED"); 
    CANCELED_NOTE = RecSet_patdirec.Fields("CANCELED_NOTE"); 
    BEGIN_DATE_TIME = RecSet_patdirec.Fields("BEGIN_DATE_TIME"); 
    END_DATE_TIME  = RecSet_patdirec.Fields("END_DATE_TIME"); 
    TEMPLATE_XML  = RecSet_patdirec.Fields("TEMPLATE_XML"); 
    PATDIREC_TYPE = RecSet_patdirec.Fields("PATDIREC_TYPE"); 
    PATDIREC_KIND = RecSet_patdirec.Fields("PATDIREC_KIND");    
    REANIM = RecSet_patdirec.Fields("REANIM");
    
    //запрос для того чтоб узнать способ введения
    var query_intake_method = "select top 1 PR_INTAKE_METHODS.CODE from PATDIREC_DRUGS join PR_INTAKE_METHODS on  PATDIREC_DRUGS.PR_INTAKE_METHODS_ID = PR_INTAKE_METHODS.PR_INTAKE_METHODS_ID order by patdirec_id desc"
    RecSet_intake_method  = Runner.CallMethod("Unit_var.db_connection", query_intake_method);
    PR_INTAKE_METHODS_CODE = RecSet_intake_method.Fields("CODE"); 
    
    
    w_checkpoint = Runner.CallMethod("Unit_var.return_w_checkpoint", w3);
    
    aqObject.CheckProperty(w_checkpoint.VCLObject("pnHeader").VCLObject("pnPrMain").VCLObject("edMed"), "wText", 0, DRUG_DESCR);
    aqObject.CheckProperty(w_checkpoint.VCLObject("pnPrTemplate").VCLObject("memTotalDescription"), "wText", 0, DESCRIPTION);  
    aqObject.CheckProperty(w_checkpoint.VCLObject("pnHeader").VCLObject("pnPrMain").VCLObject("cbMU"), "wText", 0, ""); 
    aqObject.CheckProperty(w_checkpoint.VCLObject("pnHeader").VCLObject("pnPrMain").VCLObject("dblPrIntakeMethods").VCLObject("Code").Window("Edit", "", 1), "wText", 0, PR_INTAKE_METHODS_CODE); 

    if (w_checkpoint.VCLObject("pnHeader").VCLObject("pnPrMain").VCLObject("memComment").wText=="")
    {
          if (Number(COMMENTAIRE)!=0)
          {
              Log.Error("Field_COMMENTAIRE");
          }            
    }
    else   
    {  
         aqObject.CheckProperty(w_checkpoint.VCLObject("pnHeader").VCLObject("pnPrMain").VCLObject("memComment"), "wText", 0, COMMENTAIRE);
    }
    if (Number(CANCELLED)!=0)
    {
        Log.Error("Field_CANCELLED");
    }
  
    if (Number(CANCELED_NOTE)!=0)
    {
        Log.Error("Field_CANCELLED_NOTE");
    } 
  
    if (REANIM!=0)
    {
        Log.Error("Field_REANIM");
    }
  
    if (PATDIREC_TYPE!=5)
    {
        Log.Error("Field_PATDIREC_TYPE");
    }
  
    if (PATDIREC_KIND!=1)
    {
        Log.Error("Field_PATDIREC_KIND");
    }
    
    if (IS_MIXT!=1)
    {
        Log.Error("Field_IS_MIXT");
    }
 
    // добавила сообщение, где видно, сколько было насчитано доз, и схема 
    Log.Message ("DOSE_COUNT = " + String(DOSE_COUNT));
    Log.Message ("Схема:    " + String(DESCRIPTION));      
    delay(1500);

    //удаление назначения  
    w3.Close();
    delay(500);
    w_grid.VScroll.Pos=3;
    delay(500); 
    w_grid.VScroll.Pos=2;
    delay(500);

    w_AmbForm.VCLObject("pTop").VCLObject("pTool").VCLObject("ToolBar").VCLObject("TToolButton_13").Click();
    // подтверждение перед удалением:

    Sys.Process("Automedi").Window("TMessageForm", "Подтверждение", 1).VCLObject("Yes").Click();
    delay(5000);
    w_grid.VScroll.Pos=1;
}  