within ModPowerSystems.EmtThreePhase.Examples.BasicGrids;

model Slack_PiLine_ZLoad
  ModPowerSystems.EmtThreePhase.Slack.Slack slack1 annotation(
    Placement(visible = true, transformation(origin = {0, 64}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  ModPowerSystems.EmtThreePhase.Connections.PiLine piLine1 annotation(
    Placement(visible = true, transformation(origin = {0, -6}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  ModPowerSystems.EmtThreePhase.Loads.ZLoad zLoad1 annotation(
    Placement(visible = true, transformation(origin = {0, -74}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  ModPowerSystems.EmtThreePhase.Connections.BusBar busBar1 annotation(
    Placement(visible = true, transformation(origin = {0, 22}, extent = {{-10, 0}, {10, 20}}, rotation = 0)));
  ModPowerSystems.EmtThreePhase.Connections.BusBar busBar2 annotation(
    Placement(visible = true, transformation(origin = {0, -50}, extent = {{-10, 0}, {10, 20}}, rotation = 0)));
  inner Base.System system annotation(
    Placement(visible = true, transformation(origin = {-78, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(zLoad1.Plug1, busBar2.Plug1) annotation(
    Line(points = {{0, -64}, {0, -64}, {0, -40}, {0, -40}}));
  connect(piLine1.Plug2, busBar2.Plug1) annotation(
    Line(points = {{0, -16}, {0, -16}, {0, -40}, {0, -40}, {0, -40}, {0, -40}, {0, -40}}));
  connect(busBar1.Plug1, piLine1.Plug1) annotation(
    Line(points = {{0, 32}, {0, 32}, {0, 4}, {0, 4}}));
  connect(slack1.Plug1, busBar1.Plug1) annotation(
    Line(points = {{0, 54}, {0, 54}, {0, 32}, {0, 32}}));
annotation(
    experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-6, Interval = 0.0002));end Slack_PiLine_ZLoad;
