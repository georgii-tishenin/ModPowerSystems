within ModPowerSystems.EmtThreePhase.Examples.BasicGrids;

model Slack_RxLine_ZLoad_PLL
  ModPowerSystems.EmtThreePhase.Slack.Slack slack1(Vnom = 380, phiV = 0) annotation(
    Placement(visible = true, transformation(origin = {-2, 56}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  ModPowerSystems.EmtThreePhase.Connections.RxLine rxLine1(length = 0.1)  annotation(
    Placement(visible = true, transformation(origin = {-2, 12}, extent = {{10, -10}, {-10, 10}}, rotation = 90)));
  ModPowerSystems.EmtThreePhase.Loads.ZLoad zLoad1(Pnom = {0.5e4, 0.5e4, 0.5e4},Qnom = {0.5e2, 0.5e2, 0.5e2}, Vnom = 380)  annotation(
    Placement(visible = true, transformation(origin = {-2, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  ModPowerSystems.EmtThreePhase.Measurements.VoltageMeasurementABC voltageMeasurementABC1 annotation(
    Placement(visible = true, transformation(origin = {42, -16}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  inner ModPowerSystems.Base.System system annotation(
    Placement(visible = true, transformation(origin = {-66, 72}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
ModPowerSystems.EmtThreePhase.Measurements.PLL pll1 annotation(
    Placement(visible = true, transformation(origin = {70, 34}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  ModPowerSystems.EmtThreePhase.Transforms.ABCtoDQ0_Park aBCtoDQ0_Park1 annotation(
    Placement(visible = true, transformation(origin = {-48, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  ModPowerSystems.EmtThreePhase.Measurements.CurrentMeasurementABC currentMeasurementABC1 annotation(
    Placement(visible = true, transformation(origin = {-2, -34}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Real I_dq[2];
equation
  connect(currentMeasurementABC1.i_abc, aBCtoDQ0_Park1.f_abc) annotation(
    Line(points = {{-3.7, -44.7}, {-3.7, -47.95}, {-3.7, -47.95}, {-3.7, -51.2}, {-15.7, -51.2}, {-15.7, -5.7}, {-47.7, -5.7}, {-47.7, -17.7}}, color = {0, 0, 127}, thickness = 0.5));
  connect(rxLine1.Plug2, currentMeasurementABC1.Plug1) annotation(
    Line(points = {{-2, 2}, {-2, 2}, {-2, 2}, {-2, 2}, {-2, -24}, {-2, -24}, {-2, -24}, {-2, -24}}));
  connect(currentMeasurementABC1.Plug2, zLoad1.Plug1) annotation(
    Line(points = {{-2, -44}, {-2, -44}, {-2, -60}, {-2, -60}}));
  connect(pll1.theta, aBCtoDQ0_Park1.theta) annotation(
    Line(points = {{81, 34}, {93, 34}, {93, 48}, {-27, 48}, {-27, 0}, {-75, 0}, {-75, -28}, {-59, -28}, {-59, -28}}, color = {0, 0, 127}));
  connect(voltageMeasurementABC1.v_abc, pll1.V_abc) annotation(
    Line(points = {{42, 0}, {43.5, 0}, {43.5, 0}, {45, 0}, {45, 34}, {58, 34}}, color = {0, 0, 127}, thickness = 0.5));
  connect(voltageMeasurementABC1.Plug1, rxLine1.Plug2) annotation(
    Line(points = {{32, -16}, {15, -16}, {15, -16}, {-2, -16}, {-2, 2}, {-2, 2}, {-2, 2}, {-2, 2}}));
  connect(slack1.Plug1, rxLine1.Plug1) annotation(
    Line(points = {{-2, 46}, {-2, 46}, {-2, 46}, {-2, 46}, {-2, 22}, {-2, 22}}));
  I_dq=ModPowerSystems.EmtThreePhase.Transforms.Functions.ABCtoDQ_Park(currentMeasurementABC1.i_abc,system.theta);
end Slack_RxLine_ZLoad_PLL;
