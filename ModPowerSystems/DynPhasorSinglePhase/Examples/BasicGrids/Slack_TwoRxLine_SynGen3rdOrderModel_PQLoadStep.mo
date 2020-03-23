within ModPowerSystems.DynPhasorSinglePhase.Examples.BasicGrids;
model Slack_TwoRxLine_SynGen3rdOrderModel_PQLoadStep
  final parameter String LoadProfileFile = Modelica.Utilities.Files.loadResource("modelica://ModPowerSystems/../ExampleSimulationData/LoadProfile_Step4.txt");
  final parameter String LoadProfileName = "loadStep";

  ModPowerSystems.DynPhasorSinglePhase.Generation.SynchronousGenerator_3rdOrderModel synchronousGenerator_Park(                                                                                     vt_init = 1.05,
    Vnom=24e3,
    P_init=300e6/555e6,
    Q_init=-3.80682e+07/555e6,
    theta_volt_init=4.37569/180*Modelica.Constants.pi)                                                                                                                                                              annotation (
    Placement(visible = true, transformation(extent={{-10,-84},{10,-64}},      rotation = 0)));
  Modelica.Blocks.Sources.Constant Pm(k = 300e6) annotation (
    Placement(visible = true, transformation(extent={{-60,-76},{-50,-66}},      rotation = 0)));
  ModPowerSystems.DynPhasorSinglePhase.Slack.Slack slack(Vnom = 24e3, phiV(displayUnit = "deg") = 0) annotation (
    Placement(visible = true, transformation(origin = {0, 26}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  inner Base.System system(freq_nom = 60) annotation (
    Placement(transformation(extent = {{-70, 54}, {-50, 74}})));
  ModPowerSystems.DynPhasorSinglePhase.Generation.Controllers.ExciterSteadyState exciterSteadyState(theta_volt_init = 2.1014 / 180 * Modelica.Constants.pi, vt_init = 1.05) annotation (
    Placement(visible = true, transformation(extent={{-32,-94},{-22,-82}},      rotation = 0)));
  Modelica.Blocks.Sources.Constant Q(k=-3.80682e+07) annotation (
    Placement(visible = true, transformation(extent={{-60,-96},{-50,-86}},      rotation = 0)));
  ModPowerSystems.DynPhasorSinglePhase.Connections.RxLine L01(
    length=1,
    r=0.05,
    x=0.1,
    Vnom=24e3) annotation (Placement(visible=true, transformation(
        origin={0,-8},
        extent={{-10,-10},{10,10}},
        rotation=-90)));
  ModPowerSystems.DynPhasorSinglePhase.Connections.BusBar N0(Vnom = 24e3) annotation (
    Placement(visible = true, transformation(origin = {0, -2}, extent = {{-10, 0}, {10, 20}}, rotation = 0)));
  ModPowerSystems.DynPhasorSinglePhase.Connections.BusBar N1(Vnom = 24e3) annotation (
    Placement(visible = true, transformation(origin = {0, -38}, extent = {{-10, 0}, {10, 20}}, rotation = 0)));
  ModPowerSystems.DynPhasorSinglePhase.Connections.RxLine L12(
    length=1,
    r=0.05,
    x=0.1,
    Vnom=24e3) annotation (Placement(visible=true, transformation(
        origin={0,-44},
        extent={{-10,-10},{10,10}},
        rotation=-90)));
  ModPowerSystems.DynPhasorSinglePhase.Connections.BusBar N2(Vnom = 24e3) annotation (
    Placement(visible = true, transformation(origin={0,-68},    extent = {{-10, 0}, {10, 20}}, rotation = 0)));
Loads.PQLoadProfile                                      PQ1(Vnom = 24e3, profileFileName = LoadProfileFile, profileName = LoadProfileName)  annotation (
    Placement(visible = true, transformation(origin={36,-38},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(L01.Pin1, N0.Pin1) annotation (Line(points={{0,2},{0,8}}));
  connect(slack.Pin1, N0.Pin1) annotation (
    Line(points={{0,16},{0,8}}));
  connect(L01.Pin2, N1.Pin1) annotation (Line(points={{0,-18},{0,-28}}));
  connect(Pm.y, synchronousGenerator_Park.P_m_in) annotation (
    Line(points={{-49.5,-71},{-17.75,-71},{-17.75,-68},{-14.025,-68},{-14.025,-72},
          {-10.3,-72}},                                                                                       color = {0, 0, 127}));
  connect(Pm.y, exciterSteadyState.P) annotation (
    Line(points={{-49.5,-71},{-44.75,-71},{-44.75,-67},{-40,-67},{-40,-85.6},{-33,
          -85.6}},                                                                                      color = {0, 0, 127}));
  connect(Q.y, exciterSteadyState.Q) annotation (
    Line(points={{-49.5,-91},{-41.75,-91},{-41.75,-86.4},{-37.375,-86.4},{-37.375,
          -90.4},{-33,-90.4}},                                                                                      color = {0, 0, 127}));
  connect(exciterSteadyState.vfd, synchronousGenerator_Park.v_fd_in) annotation (
    Line(points={{-21,-88},{-19.5,-88},{-19.5,-84},{-18,-84},{-18,-76},{-18,-72},
          {-14.15,-72},{-14.15,-76},{-10.3,-76}},                                                                                           color = {0, 0, 127}));
  connect(N1.Pin1, L12.Pin1) annotation (Line(points={{0,-28},{0,-28},{0,-34},{1.77636e-015,
          -34}}, color={0,0,0}));
  connect(L12.Pin2, N2.Pin1)
    annotation (Line(points={{0,-54},{0,-56},{0,-58}}, color={0,0,0}));
  connect(synchronousGenerator_Park.Pin1, N2.Pin1)
    annotation (Line(points={{0,-64},{0,-58}}, color={0,0,0}));
  connect(N1.Pin1, PQ1.Pin1)
    annotation (Line(points={{0,-28},{18,-28},{36,-28}}, color={0,0,0}));
  annotation (
    Icon(coordinateSystem(preserveAspectRatio = false)),
    Diagram(coordinateSystem(preserveAspectRatio = false)),
    experiment(
      StopTime=30,
      Interval=0.001,
      __Dymola_fixedstepsize=1e-005,
      __Dymola_Algorithm="Euler"));
end Slack_TwoRxLine_SynGen3rdOrderModel_PQLoadStep;
