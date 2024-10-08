within ModPowerSystems.EmtThreePhase.Converters;

model PQInverter
    extends ModPowerSystems.Base.Interfaces.RealValue.ThreePhase.TwoPin;
    outer ModPowerSystems.Base.System system;
    parameter Real L_lc_filter[3,3] = {{3e-2, 0, 0}, {0, 3e-2, 0}, {0, 0, 3e-2}} "Inductance of LC filter";
    parameter Real C_lc_filter[3,3] = {{1e-6,0,0}, {0,1e-6,0}, {0,0,1e-6}} "Capacitance of LC filter";
    parameter Real V_nominal = 380 "Nominal voltage";
    parameter Real P_obj=4e3 "objective Active Power";
    parameter Real Q_obj=4e2 "objective Reactive Power";      
  
    ModPowerSystems.EmtThreePhase.Measurements.CurrentMeasurementABC currentMeasurementABC1 annotation(
      Placement(visible = true, transformation(origin = {22, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    ModPowerSystems.EmtThreePhase.Basics.Ground ground2 annotation(
      Placement(visible = true, transformation(origin = {-14, -36}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    ModPowerSystems.EmtThreePhase.Basics.Inductor inductor1(L = L_lc_filter) annotation(
      Placement(visible = true, transformation(origin = {-34, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    ModPowerSystems.EmtThreePhase.Basics.Capacitor capacitor1(C = C_lc_filter) annotation(
      Placement(visible = true, transformation(origin = {-14, -10}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
    ModPowerSystems.EmtThreePhase.Measurements.VoltageMeasurementABC voltageMeasurementABC1 annotation(
      Placement(visible = true, transformation(origin = {-14, 34}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
    ModPowerSystems.EmtThreePhase.Control.PQInverterControl pQInverterControl(P_ref = P_obj, Q_ref = Q_obj) annotation(
    Placement(visible = true, transformation(origin = {-16, 76}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  ModPowerSystems.EmtThreePhase.Basics.VCVS vcvs annotation(
    Placement(visible = true, transformation(origin = {-70, 0}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
equation
  connect(currentMeasurementABC1.Plug2, Plug2) annotation(
    Line(points = {{32, 0}, {100, 0}}));
  connect(capacitor1.Plug1, currentMeasurementABC1.Plug1) annotation(
    Line(points = {{-14, 0}, {12, 0}}));
  connect(voltageMeasurementABC1.Plug1, capacitor1.Plug1) annotation(
    Line(points = {{-14, 24}, {-14, 0}}));
  connect(capacitor1.Plug2, ground2.Plug1) annotation(
    Line(points = {{-14, -20}, {-13, -20}, {-13, -20}, {-14, -20}, {-14, -26}, {-13, -26}, {-13, -26}, {-14, -26}}));
  connect(inductor1.Plug2, capacitor1.Plug1) annotation(
    Line(points = {{-24, 0}, {-14, 0}, {-14, 0}, {-14, 0}}));
  connect(voltageMeasurementABC1.v_abc, pQInverterControl.V_in) annotation(
    Line(points = {{2, 34}, {10, 34}, {10, 82}, {-4, 82}}, color = {0, 0, 127}));
  connect(currentMeasurementABC1.i_abc, pQInverterControl.I_in) annotation(
    Line(points = {{32, -2}, {36, -2}, {36, 74}, {-4, 74}}, color = {0, 0, 127}));
  connect(pQInverterControl.V_out, vcvs.Vin) annotation(
    Line(points = {{-26, 76}, {-70, 76}, {-70, 12}}, color = {0, 0, 127}, thickness = 0.5));
  connect(vcvs.Plug2, Plug1) annotation(
    Line(points = {{-80, 0}, {-100, 0}}));
  connect(vcvs.Plug1, inductor1.Plug1) annotation(
    Line(points = {{-60, 0}, {-44, 0}}));
  annotation(
      Documentation(info = "<html><head></head><body><div style=\"font-size: 12px;\">inputs to VCVS_inv:</div><div style=\"font-size: 12px;\">* V_dq;</div><div style=\"font-size: 12px;\">*theta;</div><div style=\"font-size: 12px;\"><br></div><span style=\"font-size: 12px;\">the V_dq and theta input to VCVS are both constants.</span></body></html>"),
      Icon(graphics = {Ellipse(origin = {-55, -2}, extent = {{-27, 26}, {27, -26}}), Line(origin = {-15.52, 1.21}, points = {{-12.8536, -1.20711}, {-12.8536, -1.20711}, {15.1464, -1.20711}, {15.1464, -1.20711}}, thickness = 1), Rectangle(origin = {30, -1}, lineThickness = 0.75, extent = {{-30, 15}, {30, -15}}), Text(origin = {32, -2}, extent = {{-38, 16}, {38, -16}}, textString = "LC"), Line(origin = {79, 0}, points = {{-19, 0}, {19, 0}, {19, 0}}, thickness = 0.75), Line(origin = {-80.8489, -0.170593}, points = {{-19, 0}, {-1, 0}, {-1, 0}}, thickness = 0.75), Rectangle(origin = {54, 56}, lineThickness = 0.5, extent = {{-18, 14}, {12, -8}}), Text(origin = {55, 58}, extent = {{-13, 10}, {7, -6}}, textString = "PLL"), Rectangle(origin = {-20, 58}, extent = {{-70, 10}, {42, -10}}), Text(origin = {-32, 55}, extent = {{-72, 9}, {58, -3}}, textString = "CONTROLLER"), Line(origin = {73, 29}, points = {{7, -29}, {7, 29}, {-7, 29}}, arrow = {Arrow.None, Arrow.Filled}), Line(origin = {29, 58}, points = {{7, 0}, {-7, 0}}, arrow = {Arrow.None, Arrow.Filled}), Line(origin = {-58, 36}, rotation = 180, points = {{0, 12}, {0, -12}, {0, -12}}, thickness = 0.75, arrow = {Arrow.Filled, Arrow.None}), Rectangle(origin = {0, 20}, extent = {{-100, 60}, {100, -60}}), Text(origin = {0, -68}, extent = {{-60, 16}, {60, -16}}, textString = "%name")}, coordinateSystem(initialScale = 0.1)));
  end PQInverter;
