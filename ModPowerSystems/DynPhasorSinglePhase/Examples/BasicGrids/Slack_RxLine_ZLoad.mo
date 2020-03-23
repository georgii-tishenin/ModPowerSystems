within ModPowerSystems.DynPhasorSinglePhase.Examples.BasicGrids;
model Slack_RxLine_ZLoad

  ModPowerSystems.DynPhasorSinglePhase.Slack.Slack slack(Vnom = 24e3, phiV(displayUnit = "deg") = 0) annotation (
    Placement(visible = true, transformation(origin = {0, 26}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  inner Base.System system(freq_nom = 60) annotation (
    Placement(transformation(extent = {{-70, 54}, {-50, 74}})));
  ModPowerSystems.DynPhasorSinglePhase.Connections.RxLine rxLine1(length = 1, r = 0.05, x = 0.1,
    Vnom=24e3)                                                                                   annotation (
    Placement(visible = true, transformation(origin={0,-10},   extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  ModPowerSystems.DynPhasorSinglePhase.Connections.BusBar N0(Vnom = 24e3) annotation (
    Placement(visible = true, transformation(origin = {0, -2}, extent = {{-10, 0}, {10, 20}}, rotation = 0)));
  ModPowerSystems.DynPhasorSinglePhase.Connections.BusBar N1(Vnom = 24e3) annotation (
    Placement(visible = true, transformation(origin = {0, -38}, extent = {{-10, 0}, {10, 20}}, rotation = 0)));
  Loads.ZLoad Z1(
    Vnom=24e3,
    Pnom=100.00e6,
    Qnom=0) annotation (Placement(transformation(extent={{-10,-56},{10,-36}})));

equation
  connect(rxLine1.Pin1, N0.Pin1) annotation (
    Line(points={{0,0},{0,8}}));
  connect(slack.Pin1, N0.Pin1) annotation (
    Line(points={{0,16},{0,8}}));
  connect(rxLine1.Pin2, N1.Pin1) annotation (
    Line(points={{0,-20},{0,-28}}));
  connect(N1.Pin1, Z1.Pin1)
    annotation (Line(points={{0,-28},{0,-36}}, color={0,0,0}));
  annotation (
    Icon(coordinateSystem(preserveAspectRatio = false)),
    Diagram(coordinateSystem(preserveAspectRatio = false)),
    experiment(StopTime=30, Interval=0.001, StartTime = 0, Tolerance = 1e-06));
end Slack_RxLine_ZLoad;
