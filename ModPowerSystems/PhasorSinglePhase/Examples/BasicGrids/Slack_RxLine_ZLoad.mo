within ModPowerSystems.PhasorSinglePhase.Examples.BasicGrids;
model Slack_RxLine_ZLoad
inner ModPowerSystems.Base.System system
    annotation (Placement(transformation(extent={{-100,80},{-80,100}})));
  ModPowerSystems.PhasorSinglePhase.Slack.Slack slack(Vnom = 110e3, phiV = 0) 
    annotation (Placement(transformation(extent={{-10,30},{10,10}})));
  ModPowerSystems.PhasorSinglePhase.Connections.BusBar N0
    annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
  ModPowerSystems.PhasorSinglePhase.Connections.BusBar N1
    annotation (Placement(transformation(extent={{-10,-38},{10,-18}})));
  ModPowerSystems.PhasorSinglePhase.Connections.RxLine rxLine(Vnom = 110e3,length = 20, r = 0.207, x = 0.121)  
   annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={0,-14})));
  ModPowerSystems.PhasorSinglePhase.Loads.ZLoad zLoad1(Pnom = 5e6, Qnom = 2.5e6, Vnom = 110e3)  
   annotation(
    Placement(visible = true, transformation(origin = {0, -54}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(zLoad1.Pin1, N1.Pin1) 
   annotation(
    Line(points = {{0, -44}, {0, -28}}));
  connect(slack.Pin1, N0.Pin1) 
   annotation(
    Line(points = {{0, 10}, {0, 10}, {0, 0}}, color = {0, 0, 0}));
  connect(N0.Pin1, rxLine.Pin1) 
   annotation(
    Line(points = {{0, 0}, {0, 0}, {0, -4}}, color = {0, 0, 0}));
  connect(N1.Pin1, rxLine.Pin2) 
   annotation(
    Line(points = {{0, -28}, {0, -28}, {0, -24}, {-1.77636e-015, -24}}, color = {0, 0, 0}));
  annotation (Placement(transformation(extent={{-10,32},{10,12}})),
                Placement(transformation(extent={{-100,80},{-80,100}})),
              Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}})));
end Slack_RxLine_ZLoad;
