within ModPowerSystems.EmtThreePhase.Examples.BasicGrids;

model DER_Feeder
  inner ModPowerSystems.Base.System system(freq_nom = 50) annotation(
    Placement(visible = true, transformation(origin = {-64, 92}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  ModPowerSystems.EmtThreePhase.Measurements.PLL pll1 annotation(
    Placement(visible = true, transformation(origin = {-91, -37}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  ModPowerSystems.EmtThreePhase.Measurements.PowerMeasurementDQ pq1 annotation(
    Placement(visible = true, transformation(origin = {-56, -46}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  ModPowerSystems.EmtThreePhase.Fault.Breaker breaker1(is_closed = true) annotation(
    Placement(visible = true, transformation(origin = {-58, -10}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  ModPowerSystems.EmtThreePhase.Loads.ZLoad zLoad1(Pnom = 5000, Qnom = 200, Vnom = 312) annotation(
    Placement(visible = true, transformation(origin = {27, -37}, extent = {{-9, -7}, {9, 7}}, rotation = 0)));
  ModPowerSystems.EmtThreePhase.Measurements.CurrentMeasurementABC currentMeasurementBlock1 annotation(
    Placement(visible = true, transformation(origin = {-4, -22}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  ModPowerSystems.EmtThreePhase.Basics.VCCS vccs1(phiV = 0.523599) annotation(
    Placement(visible = true, transformation(origin = {16, 68}, extent = {{6, -6}, {-6, 6}}, rotation = -90)));
  ModPowerSystems.EmtThreePhase.Basics.Inductor inductor1(L = {{0.002, 0, 0}, {0, 0.002, 0}, {0, 0, 0.002}}, i_0 = {0, 0, 0}) annotation(
    Placement(visible = true, transformation(origin = {-84, -10}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  ModPowerSystems.EmtThreePhase.Basics.Ground ground3(Vnom = 0) annotation(
    Placement(visible = true, transformation(origin = {-184, -32}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  ModPowerSystems.EmtThreePhase.Basics.VCVS vcvs1(phiV = 0) annotation(
    Placement(visible = true, transformation(origin = {-146, -22}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  ModPowerSystems.EmtThreePhase.Basics.Ground ground1 annotation(
    Placement(visible = true, transformation(origin = {-2, 82}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  ModPowerSystems.EmtThreePhase.Measurements.CurrentMeasurementABC currentMeasurementBlock2 annotation(
    Placement(visible = true, transformation(origin = {16, 22}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Interfaces.RealOutput P_VCVSI annotation(
    Placement(visible = true, transformation(origin = {142, -48}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-256, 286}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput Q_VCVSI annotation(
    Placement(visible = true, transformation(origin = {130, -72}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-256, 246}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Blocks.Sources.Constant I_ctrl(k = 0) annotation(
    Placement(visible = true, transformation(origin = {46, 76}, extent = {{6, -6}, {-6, 6}}, rotation = 0)));
  ModPowerSystems.Base.Interfaces.RealValue.ThreePhase.Plug plug1 annotation(
    Placement(visible = true, transformation(origin = {90, -35}, extent = {{-6, -5}, {6, 5}}, rotation = 0), iconTransformation(origin = {0, 304}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput Vi annotation(
    Placement(visible = true, transformation(origin = {-175, 13}, extent = {{-7, -7}, {7, 7}}, rotation = 0), iconTransformation(origin = {-235, 351}, extent = {{-7, -7}, {7, 7}}, rotation = 0)));
  ModPowerSystems.EmtThreePhase.Basics.Resistor resistor1 annotation(
    Placement(visible = true, transformation(origin = {-110, -22}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  parameter Boolean feeder_connected = true;
  ModPowerSystems.EmtThreePhase.Measurements.VoltagemeasurementDQ voltagemeasurementDQ1 annotation(
    Placement(visible = true, transformation(origin = {-129, -39}, extent = {{-7, -7}, {7, 7}}, rotation = 0)));
  ModPowerSystems.EmtThreePhase.Measurements.VoltagemeasurementDQ voltagemeasurementDQ2 annotation(
    Placement(visible = true, transformation(origin = {117, -1}, extent = {{-7, -7}, {7, 7}}, rotation = 0)));
  ModPowerSystems.EmtThreePhase.Measurements.PLL pll2 annotation(
    Placement(visible = true, transformation(origin = {145, -1}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  ModPowerSystems.EmtThreePhase.Measurements.CurrentmeasurementDQ currentmeasurementDQ1 annotation(
    Placement(visible = true, transformation(origin = {-26, -22}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(voltagemeasurementDQ1.V_dq[1], pll1.Vd) annotation(
    Line(points = {{-122, -38}, {-98, -38}, {-98, -36}, {-98, -36}}, color = {0, 0, 127}, thickness = 0.5));
  connect(inductor1.Plug1, breaker1.Plug2) annotation(
    Line(points = {{-74, -10}, {-68, -10}}));
  connect(currentmeasurementDQ1.Plug1, breaker1.Plug1) annotation(
    Line(points = {{-36, -22}, {-37, -22}, {-37, -10}, {-48, -10}}));
  connect(inductor1.Plug2, resistor1.Plug1) annotation(
    Line(points = {{-94, -10}, {-97, -10}, {-97, -22}, {-100, -22}}));
  connect(currentmeasurementDQ1.I_dq, pq1.I) annotation(
    Line(points = {{-16, -24}, {-70, -24}, {-70, -48}, {-64, -48}, {-64, -48}}, color = {0, 0, 127}, thickness = 0.5));
  connect(currentmeasurementDQ1.Theta, pll1.theta) annotation(
    Line(points = {{-38, -20}, {-84, -20}, {-84, -36}, {-86, -36}, {-86, -36}}, color = {0, 0, 127}));
  connect(currentMeasurementBlock1.Plug1, currentmeasurementDQ1.Plug2) annotation(
    Line(points = {{-14, -22}, {-16, -22}, {-16, -22}, {-16, -22}}));
  connect(voltagemeasurementDQ2.Plug1, plug1) annotation(
    Line(points = {{118, 6}, {114, 6}, {114, 26}, {90, 26}, {90, -34}, {90, -34}}));
  connect(pll2.theta, voltagemeasurementDQ2.Theta) annotation(
    Line(points = {{150, 0}, {160, 0}, {160, -22}, {102, -22}, {102, -2}, {108, -2}, {108, -2}}, color = {0, 0, 127}));
  connect(pll2.Vd, voltagemeasurementDQ2.V_dq[1]) annotation(
    Line(points = {{138, 0}, {124, 0}, {124, 0}, {124, 0}}, color = {0, 0, 127}));
  connect(plug1, zLoad1.Plug1) annotation(
    Line(points = {{90, -35}, {44, -35}, {44, -30}, {27, -30}}));
  connect(zLoad1.Plug1, currentMeasurementBlock1.Plug2) annotation(
    Line(points = {{27, -30}, {27, -23}, {6, -23}, {6, -22}}));
  connect(pq1.V, voltagemeasurementDQ1.V_dq) annotation(
    Line(points = {{-64, -44}, {-116, -44}, {-116, -38}, {-122, -38}, {-122, -38}}, color = {0, 0, 127}, thickness = 0.5));
  connect(pll1.theta, voltagemeasurementDQ1.Theta) annotation(
    Line(points = {{-86, -36}, {-84, -36}, {-84, -60}, {-146, -60}, {-146, -38}, {-138, -38}, {-138, -40}}, color = {0, 0, 127}));
  connect(resistor1.Plug2, voltagemeasurementDQ1.Plug1) annotation(
    Line(points = {{-120, -22}, {-130, -22}, {-130, -32}, {-128, -32}}));
  connect(resistor1.Plug2, vcvs1.Plug2) annotation(
    Line(points = {{-120, -22}, {-136, -22}, {-136, -22}, {-136, -22}}));
  connect(I_ctrl.y, vccs1.Vi) annotation(
    Line(points = {{39.4, 76}, {36, 76}, {36, 68}, {23.2, 68}, {23.2, 68}}, color = {0, 0, 127}));
  connect(currentMeasurementBlock2.Plug1, vccs1.Plug1) annotation(
    Line(points = {{16, 32}, {16, 32}, {16, 62}, {16, 62}}));
  connect(currentMeasurementBlock2.Plug2, currentMeasurementBlock1.Plug2) annotation(
    Line(points = {{16, 12}, {16, 12}, {16, -20}, {6, -20}, {6, -22}, {6, -22}}));
  connect(vccs1.Plug2, ground1.Plug1) annotation(
    Line(points = {{16, 74}, {16, 74}, {16, 100}, {-2, 100}, {-2, 92}, {-2, 92}}));
  connect(Vi, vcvs1.Vin) annotation(
    Line(points = {{-175, 13}, {-146, 13}, {-146, -10}, {-146, -10}}, color = {0, 0, 127}));
  connect(vcvs1.Plug1, ground3.Plug1) annotation(
    Line(points = {{-156, -22}, {-184, -22}, {-184, -22}, {-184, -22}}));
  connect(P_VCVSI, pq1.Pac) annotation(
    Line(points = {{142, -48}, {-48, -48}, {-48, -44}, {-50, -44}, {-50, -44.32}, {-49.4, -44.32}}, color = {0, 0, 127}));
  connect(pq1.Qac, Q_VCVSI) annotation(
    Line(points = {{-49.4, -48.28}, {-46, -48.28}, {-46, -84}, {94, -84}, {94, -72}, {130, -72}, {130, -72}}, color = {0, 0, 127}));
  annotation(
    Diagram(coordinateSystem(extent = {{-200, -200}, {200, 200}}, initialScale = 0.1)),
    Icon(coordinateSystem(extent = {{-200, -200}, {200, 200}})),
    __OpenModelica_commandLineOptions = "");
end DER_Feeder;
