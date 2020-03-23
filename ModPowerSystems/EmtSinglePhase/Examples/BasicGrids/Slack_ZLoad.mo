within ModPowerSystems.EmtSinglePhase.Examples.BasicGrids;

model Slack_ZLoad
  ModPowerSystems.EmtSinglePhase.Slack.Slack slack1(Vnom = 20e3)  annotation(
    Placement(visible = true, transformation(origin = {0, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  ModPowerSystems.EmtSinglePhase.Connections.BusBar busBar1(Vnom = 20e3)  annotation(
    Placement(visible = true, transformation(origin = {0, -18}, extent = {{-10, 0}, {10, 20}}, rotation = 0)));
  ModPowerSystems.EmtSinglePhase.Loads.ZLoad zLoad1(Vnom = 20e3)  annotation(
    Placement(visible = true, transformation(origin = {0, -36}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(zLoad1.Pin1, busBar1.Pin1) annotation(
    Line(points = {{0, -26}, {0, -26}, {0, -8}, {0, -8}}));
  connect(slack1.Pin1, busBar1.Pin1) annotation(
    Line(points = {{0, 10}, {0, -8}}));

end Slack_ZLoad;
