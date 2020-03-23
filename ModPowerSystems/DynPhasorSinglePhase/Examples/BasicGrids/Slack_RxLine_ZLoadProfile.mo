within ModPowerSystems.DynPhasorSinglePhase.Examples.BasicGrids;
model Slack_RxLine_ZLoadProfile
  final parameter String LoadProfileFile = Modelica.Utilities.Files.loadResource("modelica://ModPowerSystems/../ExampleSimulationData/LoadProfile_Step5.txt");
  final parameter String LoadProfileName = "loadStep";
  ModPowerSystems.DynPhasorSinglePhase.Slack.Slack slack(Vnom = 24e3, phiV(displayUnit = "deg") = 0) annotation (
    Placement(visible = true, transformation(origin = {0, 26}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  inner Base.System system(freq_nom = 60) annotation (
    Placement(transformation(extent = {{-70, 54}, {-50, 74}})));
  ModPowerSystems.DynPhasorSinglePhase.Connections.RxLine rxLine1(length = 1, r = 0.05, x = 0.1, Vnom = 24e3) annotation (
    Placement(visible = true, transformation(origin = {0, -8}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  ModPowerSystems.DynPhasorSinglePhase.Connections.BusBar N0(Vnom = 24e3) annotation (
    Placement(visible = true, transformation(origin = {0, -2}, extent = {{-10, 0}, {10, 20}}, rotation = 0)));
  ModPowerSystems.DynPhasorSinglePhase.Connections.BusBar N1(Vnom = 24e3) annotation (
    Placement(visible = true, transformation(origin = {0, -38}, extent = {{-10, 0}, {10, 20}}, rotation = 0)));
  ModPowerSystems.DynPhasorSinglePhase.Loads.ZLoadProfile Z1(Pnom = 1, Qnom = 0,Vnom = 24e3, profileFileName = LoadProfileFile, profileName = LoadProfileName, smoothnessSetting = Modelica.Blocks.Types.Smoothness.ConstantSegments) annotation (
    Placement(visible = true, transformation(origin = {0, -48}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(Z1.Pin1, N1.Pin1) annotation (
    Line(points = {{0, -38}, {0, -38}, {0, -30}, {0, -28}}));
  connect(rxLine1.Pin1, N0.Pin1) annotation (
    Line(points = {{0, 2}, {0, 8}}));
  connect(slack.Pin1, N0.Pin1) annotation (
    Line(points = {{0, 16}, {0, 8}}));
  connect(rxLine1.Pin2, N1.Pin1) annotation (
    Line(points = {{0, -18}, {0, -28}}));
  annotation (
    Icon(coordinateSystem(preserveAspectRatio = false)),
    Diagram(coordinateSystem(preserveAspectRatio = false)),
    experiment(
      StartTime=4,
      StopTime=6,
      Interval=1e-005,
      Tolerance=1e-006));
end Slack_RxLine_ZLoadProfile;
