function Test10()   // создать простое назначение, редактировать схему в окне-редакторе 
{
      var w0 = Sys.Process("Automedi");
      //w1 - объект "амбулаторные назначения"
      var w1 = Runner.CallMethod("Unit_var.return_w1");
  
      var w_AmbForm = w1.Window("TTabSheet", "Амбулаторные назначения", 1).VCLObject("PatDrugDocAmbForm");  
      
     /* max_height = w0.VCLObject("AMMain").VCLObject("pResume").VCLObject("pForm").VCLObject("pSPEGRE").Window("TScrollBoxWithControls", "", 1).VScroll.Max; 
      height=w0.VCLObject("AMMain").VCLObject("pResume").Height
      Runner.CallMethod("Unit_var.find_amb_prescriptions",height, max_height);   */
      
      // грид: 
      w_grid = w_AmbForm.VCLObject("pGrid").VCLObject("GridPanel").VCLObject("Grid");
      w_grid.VScroll.Pos=1;
      delay(600);
    
      //нужно сперва создать назначение:
      w_AmbForm.VCLObject("PanelTop").VCLObject("TabControl1").VCLObject("PanelNaznach").VCLObject("SimplePanel").VCLObject("edMed").Click();

      // w2 - глоссарий справа
      var w2 = Runner.CallMethod("Unit_var.return_w2"); 
      w2.VCLObject("tsDrugList").VCLObject("GridDrugsForm").VCLObject("pGrid").VCLObject("pSearch").Window("TEdit", "", 1).Keys(Runner.CallMethod("Unit_var.pr_drugs_id"));
      delay(1000);
      w2.VCLObject("tsDrugList").VCLObject("GridDrugsForm").VCLObject("tbAddDrug").Click();
        
      Runner.CallMethod("Unit_var.close_edit_window", w0);       
      Runner.CallMethod("Unit_var.close_confirmation_window", w0);
      Runner.CallMethod("Unit_var.intake", w_AmbForm.VCLObject("PanelTop").VCLObject("TabControl1"), Runner.CallMethod("Unit_var.intake_method_i"));
      Runner.CallMethod("Unit_var.close_edit_window", w0);

      //заполнение (или незаполнение) комментария                                                                                                                                                                               
      if (Runner.CallMethod("Unit_var.return_comment") == 1)                                                                                                                                 
      {
          w_AmbForm.VCLObject("PanelTop").VCLObject("TabControl1").VCLObject("PanelNaznach").VCLObject("memComment").Keys(Runner.CallMethod("Unit_var.return_comment_text"));
      }
      
      delay(1000); 
      w1.Window("TTabSheet", "Амбулаторные назначения", 1).VCLObject("PatDrugDocAmbForm").VCLObject("PanelTop").VCLObject("TabControl1").VCLObject("PanelNaznach").VCLObject("btnAddDrugPrescr").Click();
      delay(1500);
                   
      for  (i = 0; i < 3; i++)  
      {
                  w_grid.VScroll.Pos=2;
                  delay(500);
                  w_grid.VScroll.Pos=3;
                  delay(500); 
                  w_grid.VScroll.Pos=2;
                  delay(500);         
                  w1.Window("TTabSheet", "Амбулаторные назначения", 1).VCLObject("PatDrugDocAmbForm").VCLObject("pTop").VCLObject("pTool").VCLObject("ToolBar").VCLObject("TToolButton_12").Click(); 
                  // w3 - окно-редактор медикамента
                  var w3 = Runner.CallMethod("Unit_var.return_w3");
                  delay(1700);
          
                  w_checkpoint_1 = Runner.CallMethod("Unit_var.return_w_checkpoint_1", w3);
                  
                  var version = Runner.CallMethod("Unit_var.return_version");
                  
                  /*if (version == 4)
                  {
                      var  w_checkpoint_1 =  w_checkpoint.VCLObject("pnPrTemplate").VCLObject("sbTemplates").VCLObject("fmPREmbeddedTemplate_1");
                  }
    
                  else if (version == 5)
                  {
                      var  w_checkpoint_1 =  w_checkpoint.VCLObject("pnPrTemplate").VCLObject("sbTemplates").VCLObject("fmPREmbeddedTemplate");
                  }   */
                  
                  if (w_checkpoint_1.VCLObject("pnMain").VCLObject("pnLeft").VCLObject("pnTemplate").WaitWindow("TComboBox", "", i+1, 1500).Exists)        
                  {   
                        //Log.Message("ok!!!"+String(i+1))
                        str =  w_checkpoint_1.VCLObject("pnMain").VCLObject("pnLeft").VCLObject("pnTemplate").Window("TComboBox", "", (i+1)).wItemList;
                        n  = w_checkpoint_1.VCLObject("pnMain").VCLObject("pnLeft").VCLObject("pnTemplate").Window("TComboBox", "", i+1).wItemCount;
                        w3.VCLObject("tbClose").Click();
                    
                        if ( str.indexOf("постоянно")!= -1)  //длительность 
                        {     
                              Log.Message("ok!!!"+String(i+1));
                              Log.Message(str);
                                            
                              for (j = 0; j < n; j++)
                              {          
                                        w_grid.VScroll.Pos=2;
                                        delay(500);
                                        w_grid.VScroll.Pos=3;
                                        delay(500); 
                                        w_grid.VScroll.Pos=2;
                                        delay(500);         
                                        w1.Window("TTabSheet", "Амбулаторные назначения", 1).VCLObject("PatDrugDocAmbForm").VCLObject("pTop").VCLObject("pTool").VCLObject("ToolBar").VCLObject("TToolButton_12").Click(); 
    
                                        delay(1200);
                    
                                        w_checkpoint_1.VCLObject("pnMain").VCLObject("pnLeft").VCLObject("pnTemplate").Window("TComboBox", "", (i+1)).ClickItem(j);
                    
                                        // w3 - окно-редактор медикамента
                                        var w3 = Runner.CallMethod("Unit_var.return_w3");         
                                        //current_combo_box.ClickItem(i);
                                        delay(600); 
                                        //duration = current_combo_box.wText; 
                                        w3.VCLObject("tbClose").Click();
    
                                        delay(2000);       
        
                                        //дальше проверка что в схему в БД попало:   
                                        var query0 = "select top 1 * from PATDIREC where PATDIREC.PATIENTS_ID=" +String(Runner.CallMethod("Unit_var.patients_id"))+ " ORDER BY PATDIREC_ID DESC" 
  
                                        RecSet1 = Runner.CallMethod("Unit_var.db_connection", query0);
                                        var PATDIREC_ID = RecSet1.Fields("PATDIREC_ID").Value ; 
     
                                        var query = "DECLARE @PATDIREC_ID INT = " + String(PATDIREC_ID) + " declare @s_xml XML, @d_xml int; CREATE TABLE TABLEVARIABLE  (first nvarchar(100), second nvarchar(100)); set @s_xml = (select TEMPLATE_XML from patdirec where patdirec_id=@PATDIREC_ID); exec sp_xml_preparedocument @d_xml OUTPUT, @s_xml; INSERT INTO TABLEVARIABLE (first, second)  SELECT k AS PR_VAR_NAME, v AS PR_VAR_VALUE FROM OPENXML (@d_xml, '/config/TEMPLATE_NODE/PR_VAR_NODE') with (k nvarchar(100) 'PR_VAR_NAME', v nvarchar(100) 'PR_VAR_VALUE');"
    
                                        Runner.CallMethod("Unit_var.db_connection", query);
                                        var query1 = "select * from TABLEVARIABLE"
                                        RecSet = Runner.CallMethod("Unit_var.db_connection", query1); 
                                        while (! RecSet.EOF )
                                        {  
                                            if (String(RecSet.Fields("first").Value) == "LM")
                                            {
                                                if (RecSet.Fields("second").Value != (j+2))
                                                  {
                                                      Log.Message(String(RecSet.Fields("first").Value)+ "   " + String(RecSet.Fields("second").Value) + "!!!!!!!"); 
                                                      Log.Error ("duration");
                                                  }
                                            }
        
                                            Log.Message(String(RecSet.Fields("first").Value)+ "   " + String(RecSet.Fields("second").Value));
                                            RecSet.MoveNext();
                                        }  
                                        var query2 = "drop table TABLEVARIABLE"
                                        Runner.CallMethod("Unit_var.db_connection", query2);
     
                                        w_grid.VScroll.Pos=2;
                                        delay(1000);
                                        w_grid.VScroll.Pos=3;
                                        delay(1000); 
                                        w_grid.VScroll.Pos=2;
                                        delay(1000);
                  
                                }     
                          }
                    else if (str.indexOf("мин.")!= -1)       // интервал    ... через ...
                    {
                          Log.Message("ok!!!"+String(i+1));
                          Log.Message(str);
                          for (j = 0; j < n; j++)
                          {          
                                      w_grid.VScroll.Pos=2;
                                      delay(500);
                                      w_grid.VScroll.Pos=3;
                                      delay(500); 
                                      w_grid.VScroll.Pos=2;
                                      delay(500);         
                                      w1.Window("TTabSheet", "Амбулаторные назначения", 1).VCLObject("PatDrugDocAmbForm").VCLObject("pTop").VCLObject("pTool").VCLObject("ToolBar").VCLObject("TToolButton_12").Click(); 
    
                                      delay(1200);
                    
                                      w_checkpoint_1.VCLObject("pnMain").VCLObject("pnLeft").VCLObject("pnTemplate").Window("TComboBox", "", (i+1)).ClickItem(j);
                    
                                      // w3 - окно-редактор медикамента
                                      var w3 = Runner.CallMethod("Unit_var.return_w3"); 
                                              
                                      delay(600);      
                                      w3.VCLObject("tbClose").Click();
    
                                      delay(2000);       
        
                                      //дальше проверка что в схему в БД попало:   
                                      var query0 = "select top 1 * from PATDIREC where PATDIREC.PATIENTS_ID=" +String(Runner.CallMethod("Unit_var.patients_id"))+ " ORDER BY PATDIREC_ID DESC" 
  
                                      RecSet1 = Runner.CallMethod("Unit_var.db_connection", query0);
                                      var PATDIREC_ID = RecSet1.Fields("PATDIREC_ID").Value ; 
     
                                      var query = "DECLARE @PATDIREC_ID INT = " + String(PATDIREC_ID) + " declare @s_xml XML, @d_xml int; CREATE TABLE TABLEVARIABLE  (first nvarchar(100), second nvarchar(100)); set @s_xml = (select TEMPLATE_XML from patdirec where patdirec_id=@PATDIREC_ID); exec sp_xml_preparedocument @d_xml OUTPUT, @s_xml; INSERT INTO TABLEVARIABLE (first, second)  SELECT k AS PR_VAR_NAME, v AS PR_VAR_VALUE FROM OPENXML (@d_xml, '/config/TEMPLATE_NODE/PR_VAR_NODE') with (k nvarchar(100) 'PR_VAR_NAME', v nvarchar(100) 'PR_VAR_VALUE');"
    
                                      Runner.CallMethod("Unit_var.db_connection", query);
                                      var query1 = "select * from TABLEVARIABLE"
                                      RecSet = Runner.CallMethod("Unit_var.db_connection", query1); 
                                      while (! RecSet.EOF )
                                      {  
                                          if (String(RecSet.Fields("first").Value) == "IM")
                                          {
                                              if (RecSet.Fields("second").Value != (j))
                                              {
                                                  Log.Message(String(RecSet.Fields("first").Value)+ "   " + String(RecSet.Fields("second").Value) + "!!!!!!!"); 
                                                  Log.Error ("интервал");
                                              }
                                          }
                                          Log.Message(String(RecSet.Fields("first").Value)+ "   " + String(RecSet.Fields("second").Value));
                                          RecSet.MoveNext();
                                      }  
                                      var query2 = "drop table TABLEVARIABLE"
                                      Runner.CallMethod("Unit_var.db_connection", query2);
     
                                      w_grid.VScroll.Pos=2;
                                      delay(500);
                                      w_grid.VScroll.Pos=3;
                                      delay(500); 
                                      w_grid.VScroll.Pos=2;
                                      delay(500);                   
                           }                                        
                    }
                    else       // количество приемов за период времени (в час, в день, и т.д.)
                    {
                          Log.Message("ok!!!"+String(i+1));
                          Log.Message(str);
                          for (j = 0; j < n; j++)
                          {          
                                      w_grid.VScroll.Pos=2;
                                      delay(500);
                                      w_grid.VScroll.Pos=3;
                                      delay(500); 
                                      w_grid.VScroll.Pos=2;
                                      delay(500);         
                                      w1.Window("TTabSheet", "Амбулаторные назначения", 1).VCLObject("PatDrugDocAmbForm").VCLObject("pTop").VCLObject("pTool").VCLObject("ToolBar").VCLObject("TToolButton_12").Click(); 
    
                                      delay(1200);
                    
                                      w_checkpoint_1.VCLObject("pnMain").VCLObject("pnLeft").VCLObject("pnTemplate").Window("TComboBox", "", (i+1)).ClickItem(j);
                    
                                      // w3 - окно-редактор медикамента
                                      var w3 = Runner.CallMethod("Unit_var.return_w3");         
                                      delay(600);      
                                      w3.VCLObject("tbClose").Click();
    
                                      delay(2000);       
        
                                      //дальше проверка что в схему в БД попало:   
                                      var query0 = "select top 1 * from PATDIREC where PATDIREC.PATIENTS_ID=" +String(Runner.CallMethod("Unit_var.patients_id"))+ " ORDER BY PATDIREC_ID DESC" 
  
                                      RecSet1 = Runner.CallMethod("Unit_var.db_connection", query0);
                                      var PATDIREC_ID = RecSet1.Fields("PATDIREC_ID").Value ; 
     
                                      var query = "DECLARE @PATDIREC_ID INT = " + String(PATDIREC_ID) + " declare @s_xml XML, @d_xml int; CREATE TABLE TABLEVARIABLE  (first nvarchar(100), second nvarchar(100)); set @s_xml = (select TEMPLATE_XML from patdirec where patdirec_id=@PATDIREC_ID); exec sp_xml_preparedocument @d_xml OUTPUT, @s_xml; INSERT INTO TABLEVARIABLE (first, second)  SELECT k AS PR_VAR_NAME, v AS PR_VAR_VALUE FROM OPENXML (@d_xml, '/config/TEMPLATE_NODE/PR_VAR_NODE') with (k nvarchar(100) 'PR_VAR_NAME', v nvarchar(100) 'PR_VAR_VALUE');"
    
                                      Runner.CallMethod("Unit_var.db_connection", query);
                                      var query1 = "select * from TABLEVARIABLE"
                                      RecSet = Runner.CallMethod("Unit_var.db_connection", query1); 
                                      while (! RecSet.EOF )
                                      {  
                                          if (String(RecSet.Fields("first").Value) == "IMA")
                                          {
                                              if (RecSet.Fields("second").Value != (j+1))
                                              {
                                                  Log.Message(String(RecSet.Fields("first").Value)+ "   " + String(RecSet.Fields("second").Value) + "!!!!!!!"); 
                                                  Log.Error ("количество приемов за период времени");
                                              }
                                          }
        
                                          Log.Message(String(RecSet.Fields("first").Value)+ "   " + String(RecSet.Fields("second").Value));
                                          RecSet.MoveNext();
                                      }  
                                      var query2 = "drop table TABLEVARIABLE"
                                      Runner.CallMethod("Unit_var.db_connection", query2);
     
                                      w_grid.VScroll.Pos=2;
                                      delay(500);
                                      w_grid.VScroll.Pos=3;
                                      delay(500); 
                                      w_grid.VScroll.Pos=2;
                                      delay(500);                   
                           }                                        
                    }       
              }
              else
              {
                          var w3 = Runner.CallMethod("Unit_var.return_w3");         
                          delay(1200);      
                          w3.VCLObject("tbClose").Click();
              }
        }

      delay(2000);
 
      w_grid.VScroll.Pos=2;
      delay(500);
      w_grid.VScroll.Pos=3;
      delay(500); 
      w_grid.VScroll.Pos=2;
      delay(500); 
  
      //открываю на просмотр          
      w_AmbForm.VCLObject("pTop").VCLObject("pTool").VCLObject("ToolBar").VCLObject("TToolButton_11").Click();
    
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
 
      w_checkpoint = Runner.CallMethod("Unit_var.return_w_checkpoint", w3);
      
      aqObject.CheckProperty(w_checkpoint.VCLObject("pnHeader").VCLObject("pnPrMain").VCLObject("edMed"), "wText", 0, DRUG_DESCR);
      aqObject.CheckProperty(w_checkpoint.VCLObject("pnPrTemplate").VCLObject("memTotalDescription"), "wText", 0, DESCRIPTION);  
  
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
          Log.Error("Field_CANCELLED") ;
      }
  
      if (Number(CANCELED_NOTE)!=0)
      {
          Log.Error("Field_CANCELLED_NOTE") ;
      } 
  
      if (REANIM!=0)
      {
          Log.Error("Field_REANIM") ;
      }
  
      if (PATDIREC_TYPE!=5)
      {
          Log.Error("Field_PATDIREC_TYPE") ;
      }
  
      if (PATDIREC_KIND!=1)
      {
          Log.Error("Field_PATDIREC_KIND") ;
      }
    
      if (IS_MIXT!=0)
      {
          Log.Error("Field_IS_MIXT") ;
      }
      
      
      // добавила сообщение, где видно, сколько было насчитано доз, и схема 
      Log.Message ("DOSE_COUNT = " + String(DOSE_COUNT));
      Log.Message ("Схема:    " + String(DESCRIPTION));
               
      delay(1200);
  
      //удаление назначения  
      w3.VCLObject("tbClose").Click(); 
      w_grid.VScroll.Pos=2;
      delay(500);
      w_grid.VScroll.Pos=3;
      delay(500); 
      w_grid.VScroll.Pos=2;
      delay(500);
  
      w_AmbForm.VCLObject("pTop").VCLObject("pTool").VCLObject("ToolBar").VCLObject("TToolButton_13").Click();
      // подтверждение перед удалением:
      Sys.Process("Automedi").Window("TMessageForm", "Подтверждение", 1).VCLObject("Yes").Click();
      delay(2500);
      w_grid.VScroll.Pos=1;
}