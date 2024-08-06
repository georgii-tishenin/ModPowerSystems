within ModPowerSystems.EmtThreePhase.Control;

block PQInverterControl
  parameter Real K_pll_p=0.25 "PLL proportional gain";
  parameter Real K_pll_i=2 "PLL integral gain";
  parameter Real K_pll_d=1 "PLL derivative gain";
  parameter Real f_nominal=50 "nominal frequency";
  parameter Real P_ref=500;
  parameter Real Q_ref=200;
  ModPowerSystems.EmtThreePhase.Control.PowerCtrl powerCtrl1(P_ref=P_ref,Q_ref=Q_ref)  annotation(
    Placement(visible = true, transformation(origin = {-11, 13}, extent = {{-13, -13}, {13, 13}}, rotation = 0)));
  inner ModPowerSystems.EmtThreePhase.Measurements.PLL pll1(Kd_pll = K_pll_d, Ki_pll = K_pll_i, Kp_pll = K_pll_p, f_nom = f_nominal) annotation(
    Placement(visible = true, transformation(origin = {-82, 11}, extent = {{-10, -11}, {10, 11}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput V_in[3] annotation(
    Placement(visible = true, transformation(origin = {-120, 62}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, 62}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput I_in[3] annotation(
    Placement(visible = true, transformation(origin = {-120, -22}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, -22}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Transforms.ABCtoDQ0_Park aBCtoDQ0_Park2 annotation(
    Placement(visible = true, transformation(origin = {-45, -61}, extent = {{-7, -7}, {7, 7}}, rotation = 0)));
  Transforms.ABCtoDQ0_Park aBCtoDQ0_Park1 annotation(
    Placement(visible = true, transformation(origin = {-45, 45}, extent = {{-7, -7}, {7, 7}}, rotation = 0)));
  ModPowerSystems.EmtThreePhase.Control.CurrentCtrl currentCtrl1 annotation(
    Placement(visible = true, transformation(origin = {36, 1.77636e-15}, extent = {{-14, -14}, {14, 14}}, rotation = 0)));
  ModPowerSystems.EmtThreePhase.Transforms.DQtoABC_Park dQtoABC_Park annotation(
    Placement(visible = true, transformation(origin = {72, 5.55112e-16}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput V_out[3] annotation(
    Placement(visible = true, transformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(aBCtoDQ0_Park2.f_dq, powerCtrl1.I_dq) annotation(
    Line(points = {{-37, -61}, {-34, -61}, {-34, 10}, {-27, 10}}, color = {0, 0, 127}, thickness = 0.5));
  connect(powerCtrl1.I_inv_q_con, currentCtrl1.I_inv_q_con) annotation(
    Line(points = {{3, 11}, {10, 11}, {10, -3}, {19, -3}}, color = {0, 0, 127}));
  connect(I_in, aBCtoDQ0_Park2.f_abc) annotation(
    Line(points = {{-120, -22}, {-45, -22}, {-45, -53}}, color = {0, 0, 127}, thickness = 0.5));
  connect(pll1.theta, aBCtoDQ0_Park2.theta) annotation(
    Line(points = {{-71, 11}, {-58, 11}, {-58, -60}, {-52, -60}}, color = {0, 0, 127}));
  connect(aBCtoDQ0_Park2.f_dq, currentCtrl1.I_dq) annotation(
    Line(points = {{-37, -61}, {36, -61}, {36, -15}}, color = {0, 0, 127}, thickness = 0.5));
  connect(V_in, pll1.V_abc) annotation(
    Line(points = {{-120, 62}, {-100, 62}, {-100, 11}, {-94, 11}}, color = {0, 0, 127}, thickness = 0.5));
  connect(powerCtrl1.I_inv_d_con, currentCtrl1.I_inv_d_con) annotation(
    Line(points = {{3, 14}, {14, 14}, {14, 3}, {19, 3}}, color = {0, 0, 127}));
  connect(aBCtoDQ0_Park1.f_dq, powerCtrl1.V_dq) annotation(
    Line(points = {{-37, 45}, {-34, 45}, {-34, 16}, {-27, 16}}, color = {0, 0, 127}, thickness = 0.5));
  connect(pll1.theta, aBCtoDQ0_Park1.theta) annotation(
    Line(points = {{-71, 11}, {-58, 11}, {-58, 46}, {-52, 46}}, color = {0, 0, 127}));
  connect(V_in, aBCtoDQ0_Park1.f_abc) annotation(
    Line(points = {{-120, 62}, {-45, 62}, {-45, 53}}, color = {0, 0, 127}, thickness = 0.5));
  connect(currentCtrl1.V_dq_con, dQtoABC_Park.v_dq) annotation(
    Line(points = {{52, 0}, {62, 0}}, color = {0, 0, 127}, thickness = 0.5));
  connect(dQtoABC_Park.v_abc, V_out) annotation(
    Line(points = {{81, 0}, {110, 0}}, color = {0, 0, 127}));
  connect(pll1.theta, dQtoABC_Park.theta) annotation(
    Line(points = {{-71, 11}, {-66, 11}, {-66, 76}, {72, 76}, {72, 10}}, color = {0, 0, 127}));
  annotation(
    Icon(coordinateSystem(initialScale = 0.1), graphics = {Text(origin = {-2, 81}, extent = {{-50, 23}, {50, -23}}, textString = "Inverter"), Text(origin = {-14, 56}, extent = {{-84, 14}, {102, -24}}, textString = "Control"), Text(origin = {-32, 26}, extent = {{-48, 12}, {104, -30}}, textString = "(PQ)"), Rectangle(extent = {{-100, 100}, {100, -100}}), Rectangle(origin = {-39, -42}, extent = {{-31, 18}, {31, -18}}), Text(origin = {-39, -39}, extent = {{-19, 9}, {19, -9}}, textString = "power"), Rectangle(origin = {45, -42}, extent = {{-31, 18}, {31, -18}}), Text(origin = {45, -39}, extent = {{-19, 9}, {19, -9}}, textString = "current"), Line(origin = {-82.2, -41.6}, points = {{-11, 0}, {11, 0}}, arrow = {Arrow.None, Arrow.Open}), Line(origin = {1.8, -41.6}, points = {{-11, 0}, {11, 0}}, arrow = {Arrow.None, Arrow.Open}), Line(origin = {83.8, -41.6}, points = {{-9, 0}, {9, 0}}, arrow = {Arrow.None, Arrow.Open}), Line(origin = {-1.2, -58.6}, points = {{80, 17}, {80, -17}, {-80, -17}, {-80, 17}}, arrow = {Arrow.None, Arrow.Open}), Text(origin = {84, -34}, extent = {{-8, 8}, {8, -8}}, textString = "v", textStyle = {TextStyle.Italic})}),
  Documentation(info = "<html><head></head><body><div style=\"font-size: 12px;\">parametrized following ssmd [1], based on commit&nbsp;<span style=\"color: rgb(46, 46, 46); font-family: Menlo, 'DejaVu Sans Mono', 'Liberation Mono', Consolas, 'Ubuntu Mono', 'Courier New', 'andale mono', 'lucida console', monospace; font-size: 14px; orphans: 2; white-space: nowrap; widows: 2; background-color: rgb(250, 250, 250);\">d675e1ff</span>&nbsp;&nbsp;.</div><div style=\"font-size: 12px;\">equations refered to [2].<br><div><br></div><div>[1]&nbsp;<a href=\"https://git.rwth-aachen.de/acs/public/simulation/ssmd\">https://git.rwth-aachen.de/acs/public/simulation/ssmd</a></div></div><span style=\"font-size: 12px;\">[2] A. Angioni, E. De Din et el., \"A state-space model for distribution networks\"</span></body></html>"));
end PQInverterControl;
