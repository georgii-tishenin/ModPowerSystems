within ModPowerSystems.DynPhasorThreePhase.Examples.BasicGrids;

model Slack_PiLine_ZLoad
  ModPowerSystems.DynPhasorThreePhase.Slack.Slack slack annotation(
    Placement(visible = true, transformation(origin = {0, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  ModPowerSystems.DynPhasorThreePhase.Connections.PiLine piLine1 annotation(
    Placement(visible = true, transformation(origin = {0, 4}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  ModPowerSystems.DynPhasorThreePhase.Loads.ZLoad zLoad1(Pnom = {5e6 / 3, 5e6 / 3, 5e6 / 3}, Qnom = {2.5e6 / 3, 2.5e6 / 3, 2.5e6 / 3})  annotation(
    Placement(visible = true, transformation(origin = {0, -56}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  ModPowerSystems.DynPhasorThreePhase.Connections.BusBar N0 annotation(
    Placement(visible = true, transformation(origin = {0, 14}, extent = {{-10, 0}, {10, 20}}, rotation = 0)));
  ModPowerSystems.DynPhasorThreePhase.Connections.BusBar N1 annotation(
    Placement(visible = true, transformation(origin = {0, -34}, extent = {{-10, 0}, {10, 20}}, rotation = 0)));
  inner Base.System system annotation(
    Placement(visible = true, transformation(origin = {-62, 66}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(slack.Plug1, N0.Plug1) annotation(
    Line(points = {{0, 40}, {0, 24}}));
  connect(N0.Plug1, piLine1.Plug1) annotation(
    Line(points = {{0, 24}, {0, 14}}));
  connect(piLine1.Plug2, N1.Plug1) annotation(
    Line(points = {{0, -6}, {0, -24}}));
  connect(zLoad1.Plug1, N1.Plug1) annotation(
    Line(points = {{0, -46}, {0, -46}, {0, -24}, {0, -24}, {0, -24}, {0, -24}}));
end Slack_PiLine_ZLoad;
