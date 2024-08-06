within ModPowerSystems.EmtThreePhase.Converters;

model InverterPQCtrl
    extends ModPowerSystems.Base.Interfaces.RealValue.ThreePhase.TwoPin;
    outer ModPowerSystems.Base.System system;
    parameter Real L_lc_filter[3,3] = {{3e-2, 0, 0}, {0, 3e-2, 0}, {0, 0, 3e-2}} "Inductance of LC filter";
    parameter Real C_lc_filter[3,3] = {{1e-6,0,0}, {0,1e-6,0}, {0,0,1e-6}} "Capacitance of LC filter";
    parameter Real V_nominal = 380 "Nominal voltage";
    parameter Real P_obj=4e3 "objective Active Power";
    parameter Real Q_obj=4e2 "objective Reactive Power";
    parameter Real f_nominal=50 "nominal frequency";
    parameter Real omega_nom = 2*pi*f_nominal;
    parameter Real K_pll_p=0.25 "PLL proportional gain";
    parameter Real K_pll_i=2 "PLL integral gain";
    parameter Real K_pll_d=1 "PLL derivative gain";
  
  
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
    inner ModPowerSystems.EmtThreePhase.Measurements.PLL pll1(omega_nom=omega_nom,Kp_pll=K_pll_p,Ki_pll=K_pll_i,Kd_pll=K_pll_d) annotation(
      Placement(visible = true, transformation(origin = {64, 76}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    ModPowerSystems.EmtThreePhase.Basics.VCVS_DQ vCVS_Inv_Av1(Vnom = V_nominal) annotation(
      Placement(visible = true, transformation(origin = {-66, 0}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
    ModPowerSystems.EmtThreePhase.Control.InverterPQCtrl inv_PQ_Controller1(P_ref = P_obj, Q_ref = Q_obj, omega_nom = omega_nom) annotation(
      Placement(visible = true, transformation(origin = {-42, 76}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  equation
    connect(voltageMeasurementABC1.v_abc, inv_PQ_Controller1.V_in) annotation(
      Line(points = {{2, 34}, {2, 82}, {-30, 82}}, color = {0, 0, 127}, thickness = 0.5));
    connect(currentMeasurementABC1.Plug2, Plug2) annotation(
      Line(points = {{32, 0}, {100, 0}}));
    connect(capacitor1.Plug1, currentMeasurementABC1.Plug1) annotation(
      Line(points = {{-14, 0}, {12, 0}}));
    connect(currentMeasurementABC1.i_abc, inv_PQ_Controller1.I_in) annotation(
      Line(points = {{33, -2}, {40, -2}, {40, 74}, {-30, 74}}, color = {0, 0, 127}, thickness = 0.5));
    connect(voltageMeasurementABC1.v_abc, pll1.V_abc) annotation(
      Line(points = {{2, 34}, {47, 34}, {47, 76}, {52, 76}}, color = {0, 0, 127}, thickness = 0.5));
    connect(pll1.theta, inv_PQ_Controller1.theta) annotation(
      Line(points = {{75, 76}, {85, 76}, {85, 94}, {11, 94}, {11, 78}, {-10, 78}, {-10, 78}, {-31, 78}}, color = {0, 0, 127}));
    connect(inv_PQ_Controller1.V_dq_con, vCVS_Inv_Av1.V_dq_in) annotation(
      Line(points = {{-53, 76}, {-66, 76}, {-66, 12}}, color = {0, 0, 127}, thickness = 0.5));
    connect(pll1.theta, vCVS_Inv_Av1.theta) annotation(
      Line(points = {{75, 76}, {80, 76}, {80, 88}, {-72, 88}, {-72, 12}}, color = {0, 0, 127}));
    connect(vCVS_Inv_Av1.Plug2, Plug1) annotation(
      Line(points = {{-76, 0}, {-100, 0}}));
    connect(vCVS_Inv_Av1.Plug1, inductor1.Plug1) annotation(
      Line(points = {{-56, 0}, {-44, 0}, {-44, 0}, {-44, 0}}));
    connect(voltageMeasurementABC1.Plug1, capacitor1.Plug1) annotation(
      Line(points = {{-14, 24}, {-14, 0}}));
    connect(capacitor1.Plug2, ground2.Plug1) annotation(
      Line(points = {{-14, -20}, {-13, -20}, {-13, -20}, {-14, -20}, {-14, -26}, {-13, -26}, {-13, -26}, {-14, -26}}));
    connect(inductor1.Plug2, capacitor1.Plug1) annotation(
      Line(points = {{-24, 0}, {-14, 0}, {-14, 0}, {-14, 0}}));
    annotation(
      Documentation(info = "<html><head></head><body><div style=\"font-size: 12px;\">inputs to VCVS_inv:</div><div style=\"font-size: 12px;\">* V_dq;</div><div style=\"font-size: 12px;\">*theta;</div><div style=\"font-size: 12px;\"><br></div><span style=\"font-size: 12px;\">the V_dq and theta input to VCVS are both constants.</span></body></html>"),
      Icon(graphics = {Ellipse(origin = {-55, -2}, extent = {{-27, 26}, {27, -26}}, endAngle = 360), Line(origin = {-15.52, 1.21}, points = {{-12.8536, -1.20711}, {-12.8536, -1.20711}, {15.1464, -1.20711}, {15.1464, -1.20711}}, thickness = 1), Rectangle(origin = {30, -1}, lineThickness = 0.75, extent = {{-30, 15}, {30, -15}}), Text(origin = {32, -2}, extent = {{-38, 16}, {38, -16}}, textString = "LC"), Line(origin = {79, 0}, points = {{-19, 0}, {19, 0}, {19, 0}}, thickness = 0.75), Line(origin = {-80.8489, -0.170593}, points = {{-19, 0}, {-1, 0}, {-1, 0}}, thickness = 0.75), Rectangle(origin = {54, 56}, lineThickness = 0.5, extent = {{-18, 14}, {12, -8}}), Text(origin = {55, 58}, extent = {{-13, 10}, {7, -6}}, textString = "PLL"), Rectangle(origin = {-20, 58}, extent = {{-70, 10}, {42, -10}}), Text(origin = {-32, 55}, extent = {{-72, 9}, {58, -3}}, textString = "CONTROLLER"), Line(origin = {73, 29}, points = {{7, -29}, {7, 29}, {-7, 29}}, arrow = {Arrow.None, Arrow.Filled}), Line(origin = {29, 58}, points = {{7, 0}, {-7, 0}}, arrow = {Arrow.None, Arrow.Filled}), Line(origin = {-58, 36}, rotation = 180, points = {{0, 12}, {0, -12}, {0, -12}}, thickness = 0.75, arrow = {Arrow.Filled, Arrow.None}), Rectangle(origin = {0, 20}, extent = {{-100, 60}, {100, -60}}), Text(origin = {0, -68}, extent = {{-60, 16}, {60, -16}}, textString = "%name")}, coordinateSystem(initialScale = 0.1)));
  end InverterPQCtrl;
