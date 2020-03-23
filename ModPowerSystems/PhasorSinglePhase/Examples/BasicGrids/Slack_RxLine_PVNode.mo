within ModPowerSystems.PhasorSinglePhase.Examples.BasicGrids;
model Slack_RxLine_PVNode
  inner ModPowerSystems.Base.System system 
   annotation (
    Placement(transformation(extent = {{-100, 80}, {-80, 100}})));
  ModPowerSystems.PhasorSinglePhase.Slack.Slack slack(Vnom = 24e3, phiV = 0) 
   annotation (
    Placement(visible = true, transformation(extent = {{-10, 30}, {10, 10}}, rotation = 0)));
  ModPowerSystems.PhasorSinglePhase.Connections.BusBar N0(Vnom = 24e3) 
   annotation (
    Placement(visible = true, transformation(extent = {{-10, -4}, {10, 16}}, rotation = 0)));
  ModPowerSystems.PhasorSinglePhase.Connections.BusBar N1(Vnom = 24e3) 
   annotation (
    Placement(visible = true, transformation(extent = {{-10, -40}, {10, -20}}, rotation = 0)));
  ModPowerSystems.PhasorSinglePhase.Generation.PVNode pVNode1(Pgen = 300e6, Vabs = 1.05, Vnom = 24e3) 
   annotation (
    Placement(visible = true, transformation(origin = {0, -54}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  ModPowerSystems.PhasorSinglePhase.Connections.RxLine rxLine(Vnom = 24e3, length = 1, r = 0.05, x = 0.1)  
   annotation(
    Placement(visible = true, transformation(origin = {0, -12}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
equation
  connect(rxLine.Pin1, N1.Pin1) 
   annotation(
    Line(points = {{0, -22}, {0, -30}}));
  connect(rxLine.Pin2, N0.Pin1) 
   annotation(
    Line(points = {{0, -2}, {0, 6}}));
  connect(slack.Pin1, N0.Pin1) 
   annotation(
    Line(points = {{0, 10}, {0, 6}}));
  connect(pVNode1.Pin1, N1.Pin1) 
   annotation(
    Line(points = {{0, -44}, {0, -30}}));
  annotation (
    Placement(transformation(extent = {{-10, 32}, {10, 12}})),
    Placement(transformation(extent = {{-100, 80}, {-80, 100}})),
    Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}})));
end Slack_RxLine_PVNode;
