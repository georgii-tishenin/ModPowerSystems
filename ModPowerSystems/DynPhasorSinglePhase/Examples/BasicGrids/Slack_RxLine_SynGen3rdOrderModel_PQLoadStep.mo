within ModPowerSystems.DynPhasorSinglePhase.Examples.BasicGrids;
model Slack_RxLine_SynGen3rdOrderModel_PQLoadStep
  final parameter String LoadProfileFile = Modelica.Utilities.Files.loadResource("modelica://ModPowerSystems/../ExampleSimulationData/LoadProfile_Step3.txt");
  final parameter String LoadProfileName = "loadStep";

  ModPowerSystems.DynPhasorSinglePhase.Generation.SynchronousGenerator_3rdOrderModel synchronousGenerator_Park(Q_init = -156467200 / 555e6, theta_volt_init = 2.1014 / 180 * Modelica.Constants.pi, vt_init = 1.05,
    Vnom=24e3,
    P_init=300e6/555e6)                                                                                                                                                                                             annotation (
    Placement(visible = true, transformation(extent = {{-10, -56}, {10, -36}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant Pm(k = 300e6) annotation (
    Placement(visible = true, transformation(extent = {{-60, -48}, {-50, -38}}, rotation = 0)));
  ModPowerSystems.DynPhasorSinglePhase.Slack.Slack slack(Vnom = 24e3, phiV(displayUnit = "deg") = 0) annotation (
    Placement(visible = true, transformation(origin = {0, 26}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  inner Base.System system(freq_nom = 60) annotation (
    Placement(transformation(extent = {{-70, 54}, {-50, 74}})));
  ModPowerSystems.DynPhasorSinglePhase.Generation.Controllers.ExciterSteadyState exciterSteadyState(theta_volt_init = 2.1014 / 180 * Modelica.Constants.pi, vt_init = 1.05) annotation (
    Placement(visible = true, transformation(extent = {{-32, -66}, {-22, -54}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant Q(k = -156467200) annotation (
    Placement(visible = true, transformation(extent = {{-60, -68}, {-50, -58}}, rotation = 0)));
  ModPowerSystems.DynPhasorSinglePhase.Connections.RxLine rxLine1(length = 1, r = 0.05, x = 0.1,
    Vnom=24e3)                                                                                   annotation (
    Placement(visible = true, transformation(origin = {0, -8}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  ModPowerSystems.DynPhasorSinglePhase.Connections.BusBar N0(Vnom = 24e3) annotation (
    Placement(visible = true, transformation(origin = {0, -2}, extent = {{-10, 0}, {10, 20}}, rotation = 0)));
  ModPowerSystems.DynPhasorSinglePhase.Connections.BusBar N1(Vnom = 24e3) annotation (
    Placement(visible = true, transformation(origin = {0, -38}, extent = {{-10, 0}, {10, 20}}, rotation = 0)));
ModPowerSystems.DynPhasorSinglePhase.Loads.PQLoadProfile PQ1(Vnom = 24e3, profileFileName = LoadProfileFile, profileName = LoadProfileName)  annotation (
    Placement(visible = true, transformation(origin = {28, -44}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(PQ1.Pin1, N1.Pin1) annotation (
    Line(points={{28,-34},{2,-34},{2,-30},{0,-30},{0,-28}}));
  connect(rxLine1.Pin1, N0.Pin1) annotation (
    Line(points={{0,2},{0,8}}));
  connect(slack.Pin1, N0.Pin1) annotation (
    Line(points={{0,16},{0,8}}));
  connect(rxLine1.Pin2, N1.Pin1) annotation (
    Line(points={{0,-18},{0,-28}}));
  connect(synchronousGenerator_Park.Pin1, N1.Pin1) annotation (
    Line(points={{0,-36},{0,-28}}));
  connect(Pm.y, synchronousGenerator_Park.P_m_in) annotation (
    Line(points={{-49.5,-43},{-17.75,-43},{-17.75,-40},{-14.025,-40},{-14.025,
          -44},{-10.3,-44}},                                                                                  color = {0, 0, 127}));
  connect(Pm.y, exciterSteadyState.P) annotation (
    Line(points={{-49.5,-43},{-44.75,-43},{-44.75,-39},{-40,-39},{-40,-57.6},{
          -33,-57.6}},                                                                                  color = {0, 0, 127}));
  connect(Q.y, exciterSteadyState.Q) annotation (
    Line(points={{-49.5,-63},{-41.75,-63},{-41.75,-58.4},{-37.375,-58.4},{
          -37.375,-62.4},{-33,-62.4}},                                                                              color = {0, 0, 127}));
  connect(exciterSteadyState.vfd, synchronousGenerator_Park.v_fd_in) annotation (
    Line(points={{-21,-60},{-19.5,-60},{-19.5,-56},{-18,-56},{-18,-48},{-18,-44},
          {-14.15,-44},{-14.15,-48},{-10.3,-48}},                                                                                           color = {0, 0, 127}));
  annotation (
    Icon(coordinateSystem(preserveAspectRatio = false)),
    Diagram(coordinateSystem(preserveAspectRatio = false)),
    experiment(
      StopTime=30,
      Interval=0.001,
      __Dymola_fixedstepsize=1e-005,
      __Dymola_Algorithm="Euler"));
end Slack_RxLine_SynGen3rdOrderModel_PQLoadStep;
