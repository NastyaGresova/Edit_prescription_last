function Test1()
{
  //Selects the 'Медикаменты' tab of the 'PageControl1' tab control.
  Aliases.Automedi.AMMain.pGlossaire.pMain.PageControl1.ClickTab("Медикаменты");
  //Clicks at point (61, 6) of the 'TEdit' object.
  Aliases.Automedi.AMMain.pGlossaire.pMain.PageControl1.PanelGlossDrug.pcDrugs.tsAppSchemes.AppSchemesForm.pGrid.pSearch.TEdit.Click(61, 6);
  //Clicks at point (61, 6) of the 'TEdit' object with the right mouse button.
  Aliases.Automedi.AMMain.pGlossaire.pMain.PageControl1.PanelGlossDrug.pcDrugs.tsAppSchemes.AppSchemesForm.pGrid.pSearch.TEdit.ClickR(61, 6);
  //Moves the mouse cursor to the menu item specified and then simulates a single click.
  Aliases.Automedi.AMMain.pGlossaire.pMain.PageControl1.PanelGlossDrug.pcDrugs.tsAppSchemes.AppSchemesForm.pGrid.pSearch.TEdit.PopupMenu.Click("Выделить все");
  //Clicks at point (39, 9) of the 'TEdit' object with the right mouse button.
  Aliases.Automedi.AMMain.pGlossaire.pMain.PageControl1.PanelGlossDrug.pcDrugs.tsAppSchemes.AppSchemesForm.pGrid.pSearch.TEdit.ClickR(39, 9);
  //Moves the mouse cursor to the menu item specified and then simulates a single click.
  Aliases.Automedi.AMMain.pGlossaire.pMain.PageControl1.PanelGlossDrug.pcDrugs.tsAppSchemes.AppSchemesForm.pGrid.pSearch.TEdit.PopupMenu.Click("Удалить");
}