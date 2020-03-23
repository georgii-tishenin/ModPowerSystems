within ModPowerSystems.EmtThreePhase.Examples.BasicGrids;

model Slack_RxLine_ZLoad
  ModPowerSystems.EmtThreePhase.Slack.Slack slack(Vnom = 110000.0, phiV = 0) annotation(
    Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 180, origin = {0, 26})));
  ModPowerSystems.EmtThreePhase.Loads.ZLoad zLoad(Vnom = 110000.0, Pnom = {1666666.6666666667, 1666666.6666666667, 1666666.6666666667}, Qnom = {833333.3333333334, 833333.3333333334, 833333.3333333334})  annotation(
    Placement(visible = true, transformation(extent = {{-10, -76}, {10, -56}}, rotation = 0)));
  ModPowerSystems.EmtThreePhase.Connections.RxLine rxLine( length = 20, r = {{0.207, 0, 0}, {0, 0.207, 0}, {0, 0, 0.207}}, x = {{0.121, 0, 0}, {0, 0.121, 0}, {0, 0, 0.121}}) annotation(
    Placement(visible = true, transformation(origin = {0, -18}, extent = {{-10, -10}, {10, 10}}, rotation = 270)));
  ModPowerSystems.EmtThreePhase.Connections.BusBar N0(Vnom = 110000.0) annotation(
    Placement(visible = true, transformation(origin = {0, -6}, extent = {{-10, 0}, {10, 20}}, rotation = 0)));
  ModPowerSystems.EmtThreePhase.Connections.BusBar N1(Vnom = 110000.0) annotation(
    Placement(visible = true, transformation(origin = {0, -50}, extent = {{-10, 0}, {10, 20}}, rotation = 0)));
  inner Base.System system annotation(
    Placement(visible = true, transformation(origin = {-74, 58}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(zLoad.Plug1, N1.Plug1) annotation(
    Line(points = {{0, -56}, {0, -40}}));
  connect(rxLine.Plug1, N0.Plug1) annotation(
    Line(points = {{0, -8}, {0, 4}}));
  connect(slack.Plug1, N0.Plug1) annotation(
    Line(points = {{0, 16}, {0, 4}}));
  connect(rxLine.Plug2, N1.Plug1) annotation(
    Line(points = {{0, -28}, {0, -40}}));
  annotation(
    Icon(coordinateSystem(preserveAspectRatio = false)),
    Diagram(coordinateSystem(preserveAspectRatio = false)),
    experiment(StartTime = 0, StopTime = 2, Tolerance = 1e-06, Interval = 0.001),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"));
end Slack_RxLine_ZLoad;
