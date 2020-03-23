within ModPowerSystems.EmtThreePhase.Examples.BasicGrids;

model Slack_ZLoad
  ModPowerSystems.EmtThreePhase.Slack.Slack slack1(Vnom = 20e3)  annotation(
    Placement(visible = true, transformation(origin = {0, 34}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  ModPowerSystems.EmtThreePhase.Connections.BusBar busBar1(Vnom = 20e3)  annotation(
    Placement(visible = true, transformation(origin = {0, -4}, extent = {{-10, 0}, {10, 20}}, rotation = 0)));
  Loads.ZLoad zLoad1(Vnom = 20e3)  annotation(
    Placement(visible = true, transformation(origin = {0, -22}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(zLoad1.Plug1, busBar1.Plug1) annotation(
    Line(points = {{0, -12}, {0, -12}, {0, 6}, {0, 6}}));
  connect(slack1.Plug1, busBar1.Plug1) annotation(
    Line(points = {{0, 24}, {0, 24}, {0, 6}, {0, 6}, {0, 6}, {0, 6}}));

end Slack_ZLoad;
