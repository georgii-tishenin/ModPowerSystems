within ModPowerSystems.EmtThreePhase.Examples.BasicGrids;

model Slack_RxLine_VoltageSourceAC
  ModPowerSystems.EmtThreePhase.Slack.Slack slack(Vnom = 24e3, phiV = 0) annotation(
    Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 180, origin = {0, 26})));
  ModPowerSystems.EmtThreePhase.Connections.RxLine rxLine(Vnom = 24e3, i_0 = {18324.89, -11060.47, -7264.42}, length = 1, r = {{0.032, 0, 0}, {0, 0.032, 0}, {0, 0, 0.032}}, x = {{0.377, 0, 0}, {0, 0.377, 0}, {0, 0, 0.377}}) annotation(
    Placement(visible = true, transformation(origin = {-24, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 270)));
  ModPowerSystems.EmtThreePhase.Connections.BusBar N0(Vnom = 24e3) annotation(
    Placement(visible = true, transformation(origin = {0, -6}, extent = {{-10, 0}, {10, 20}}, rotation = 0)));
  ModPowerSystems.EmtThreePhase.Connections.BusBar N1(Vnom = 24e3) annotation(
    Placement(visible = true, transformation(origin = {0, -64}, extent = {{-10, 0}, {10, 20}}, rotation = 0)));
  ModPowerSystems.EmtThreePhase.Basics.VoltageAC voltageAC1(Vpeak = 24e3 * 1.05, phiV = 0.346039)  annotation(
    Placement(visible = true, transformation(origin = {0, -68}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  ModPowerSystems.EmtThreePhase.Basics.Ground ground1 annotation(
    Placement(visible = true, transformation(origin = {0, -94}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner ModPowerSystems.Base.System system annotation(
    Placement(visible = true, transformation(origin = {-56, 64}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  ModPowerSystems.EmtThreePhase.Measurements.PowerMeasurementDQ powerMeasurementDQ1 annotation(
    Placement(visible = true, transformation(origin = {86, -38}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  ModPowerSystems.EmtThreePhase.Transforms.ABCtoDQ0_Park aBCtoDQ0_Park1 annotation(
    Placement(visible = true, transformation(origin = {46, -26}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  ModPowerSystems.EmtThreePhase.Measurements.VoltageMeasurementABC voltageMeasurementABC1 annotation(
    Placement(visible = true, transformation(origin = {30, -86}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  ModPowerSystems.EmtThreePhase.Measurements.CurrentMeasurementABC currentMeasurementABC1 annotation(
    Placement(visible = true, transformation(origin = {0, -36}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  ModPowerSystems.EmtThreePhase.Measurements.PLLIdeal pLLIdeal1(theta_0 = 0.346039)  annotation(
    Placement(visible = true, transformation(origin = {39, 17}, extent = {{-11, -11}, {11, 11}}, rotation = 0)));
  ModPowerSystems.EmtThreePhase.Transforms.ABCtoDQ0_Park aBCtoDQ0_Park2 annotation(
    Placement(visible = true, transformation(origin = {46, -58}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(rxLine.Plug1, N0.Plug1) annotation(
    Line(points = {{-24, 0}, {0, 0}, {0, 4}}));
  connect(currentMeasurementABC1.Plug2, rxLine.Plug2) annotation(
    Line(points = {{0, -26}, {0, -23}, {-24, -23}, {-24, -20}}));
  connect(aBCtoDQ0_Park1.f_dq, powerMeasurementDQ1.V) annotation(
    Line(points = {{58, -26}, {68, -26}, {68, -34}, {74, -34}, {74, -36}}, color = {0, 0, 127}, thickness = 0.5));
  connect(aBCtoDQ0_Park2.f_dq, powerMeasurementDQ1.I) annotation(
    Line(points = {{58, -58}, {64, -58}, {64, -42}, {74, -42}, {74, -42}}, color = {0, 0, 127}, thickness = 0.5));
  connect(aBCtoDQ0_Park2.theta, pLLIdeal1.theta) annotation(
    Line(points = {{36, -56}, {18, -56}, {18, -8}, {62, -8}, {62, 10}, {51, 10}, {51, 17}}, color = {0, 0, 127}));
  connect(pLLIdeal1.theta, aBCtoDQ0_Park1.theta) annotation(
    Line(points = {{51, 17}, {62, 17}, {62, -8}, {18, -8}, {18, -24}, {36, -24}}, color = {0, 0, 127}));
  connect(voltageMeasurementABC1.v_abc, aBCtoDQ0_Park2.f_abc) annotation(
    Line(points = {{46, -86}, {52, -86}, {52, -72}, {26, -72}, {26, -40}, {46, -40}, {46, -46}, {46, -46}}, color = {0, 0, 127}, thickness = 0.5));
  connect(voltageMeasurementABC1.Plug1, N1.Plug1) annotation(
    Line(points = {{30, -76}, {16, -76}, {16, -54}, {0, -54}}));
  connect(currentMeasurementABC1.Plug1, N1.Plug1) annotation(
    Line(points = {{0, -46}, {0, -46}, {0, -54}, {0, -54}}));
  connect(currentMeasurementABC1.i_abc, aBCtoDQ0_Park1.f_abc) annotation(
    Line(points = {{2, -26}, {6, -26}, {6, -30}, {28, -30}, {28, -14}, {46, -14}, {46, -14}}, color = {0, 0, 127}, thickness = 0.5));
  connect(voltageAC1.Plug2, ground1.Plug1) annotation(
    Line(points = {{0, -78}, {0, -78}, {0, -78}, {0, -78}, {0, -84}, {0, -84}, {0, -84}, {0, -84}}));
  connect(voltageAC1.Plug1, N1.Plug1) annotation(
    Line(points = {{0, -58}, {0, -54}}));
  connect(slack.Plug1, N0.Plug1) annotation(
    Line(points = {{0, 16}, {0, 4}}));
  annotation(
    Icon(coordinateSystem(preserveAspectRatio = false)),
    Diagram(coordinateSystem(preserveAspectRatio = false)),
    experiment(StartTime = 0, StopTime = 2, Tolerance = 1e-06, Interval = 0.001),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"));
end Slack_RxLine_VoltageSourceAC;
