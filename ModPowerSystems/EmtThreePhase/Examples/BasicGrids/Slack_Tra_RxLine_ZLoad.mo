within ModPowerSystems.EmtThreePhase.Examples.BasicGrids;

model Slack_Tra_RxLine_ZLoad
  ModPowerSystems.EmtThreePhase.Slack.Slack slack1(Vnom = 110e3)  annotation(
    Placement(visible = true, transformation(origin = {0, 78}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  ModPowerSystems.EmtThreePhase.Transformers.Transformer transformer1 annotation(
    Placement(visible = true, transformation(origin = {0, 32}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  inner Base.System system annotation(
    Placement(visible = true, transformation(origin = {-68, 64}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  ModPowerSystems.EmtThreePhase.Loads.ZLoad zLoad1(Vnom = 20e3)  annotation(
    Placement(visible = true, transformation(origin = {0, -68}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  ModPowerSystems.EmtThreePhase.Connections.BusBar busBar1(Vnom = 110e3)  annotation(
    Placement(visible = true, transformation(origin = {0, 44}, extent = {{-10, 0}, {10, 20}}, rotation = 0)));
  ModPowerSystems.EmtThreePhase.Connections.BusBar busBar2(Vnom = 20e3)  annotation(
    Placement(visible = true, transformation(origin = {0, -2}, extent = {{-10, 0}, {10, 20}}, rotation = 0)));
  ModPowerSystems.EmtThreePhase.Connections.RxLine rxLine1(Vnom = 20e3)  annotation(
    Placement(visible = true, transformation(origin = {0, -14}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  ModPowerSystems.EmtThreePhase.Connections.BusBar busBar3(Vnom = 20e3)  annotation(
    Placement(visible = true, transformation(origin = {0, -50}, extent = {{-10, 0}, {10, 20}}, rotation = 0)));
equation
  connect(zLoad1.Plug1, busBar3.Plug1) annotation(
    Line(points = {{0, -58}, {0, -58}, {0, -40}, {0, -40}}));
  connect(rxLine1.Plug2, busBar3.Plug1) annotation(
    Line(points = {{0, -24}, {0, -24}, {0, -40}, {0, -40}}));
  connect(busBar2.Plug1, rxLine1.Plug1) annotation(
    Line(points = {{0, 8}, {0, 8}, {0, -4}, {0, -4}, {0, -4}}));
  connect(transformer1.Plug2, busBar2.Plug1) annotation(
    Line(points = {{0, 22}, {0, 22}, {0, 8}, {0, 8}}));
  connect(transformer1.Plug1, busBar1.Plug1) annotation(
    Line(points = {{0, 42}, {0, 42}, {0, 54}, {0, 54}, {0, 54}}));
  connect(slack1.Plug1, busBar1.Plug1) annotation(
    Line(points = {{0, 68}, {0, 68}, {0, 54}, {0, 54}, {0, 54}, {0, 54}}));
end Slack_Tra_RxLine_ZLoad;
