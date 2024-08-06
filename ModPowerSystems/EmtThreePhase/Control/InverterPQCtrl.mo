within ModPowerSystems.EmtThreePhase.Control;

block InverterPQCtrl
  Modelica.Blocks.Interfaces.RealInput V_in[3] annotation(
    Placement(visible = true, transformation(origin = {-120, 62}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, 62}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput V_dq_con[2] annotation(
    Placement(visible = true, transformation(origin = {108, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {108, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput I_in[3] annotation(
    Placement(visible = true, transformation(origin = {-120, -22}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, -22}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  ModPowerSystems.EmtThreePhase.Control.CurrentCtrl currentCtrl1 annotation(
    Placement(visible = true, transformation(origin = {65, -1}, extent = {{-21, -21}, {21, 21}}, rotation = 0)));
  parameter Real P_ref=500;
  parameter Real Q_ref=200;
  parameter Real omega_nom;
  Modelica.Blocks.Interfaces.RealInput theta annotation(
    Placement(visible = true, transformation(origin = {-120, 20}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, 20}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  ModPowerSystems.EmtThreePhase.Transforms.ABCtoDQ0_Park aBCtoDQ0_Park1 annotation(
    Placement(visible = true, transformation(origin = {-58, 42}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  ModPowerSystems.EmtThreePhase.Transforms.ABCtoDQ0_Park aBCtoDQ0_Park2 annotation(
    Placement(visible = true, transformation(origin = {-56, -68}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  ModPowerSystems.EmtThreePhase.Control.PowerCtrl powerCtrl1(P_ref=P_ref,Q_ref=Q_ref, omega_nom = omega_nom) annotation(
    Placement(visible = true, transformation(origin = { -1, 45}, extent = {{-21, -21}, {21, 21}}, rotation = 0)));
equation
  connect(aBCtoDQ0_Park2.f_dq, currentCtrl1.I_dq) annotation(
    Line(points = {{-45, -68}, {66, -68}, {66, -23}, {65, -23}}, color = {0, 0, 127}, thickness = 0.5));
  connect(aBCtoDQ0_Park2.f_dq, powerCtrl1.I_dq) annotation(
    Line(points = {{-44, -68}, {-34, -68}, {-34, 40}, {-26, 40}, {-26, 40}}, color = {0, 0, 127}, thickness = 0.5));
  connect(aBCtoDQ0_Park1.f_dq, powerCtrl1.V_dq) annotation(
    Line(points = {{-46, 42}, {-44, 42}, {-44, 50}, {-26, 50}, {-26, 50}}, color = {0, 0, 127}, thickness = 0.5));
  connect(powerCtrl1.I_inv_q_con, currentCtrl1.I_inv_q_con) annotation(
    Line(points = {{22, 42}, {27, 42}, {27, -5}, {40, -5}}, color = {0, 0, 127}));
  connect(powerCtrl1.I_inv_d_con, currentCtrl1.I_inv_d_con) annotation(
    Line(points = {{22, 47}, {31, 47}, {31, 3}, {40, 3}}, color = {0, 0, 127}));
  connect(currentCtrl1.V_dq_con, V_dq_con) annotation(
    Line(points = {{88, -1}, {93, -1}, {93, 0}, {108, 0}}, color = {0, 0, 127}, thickness = 0.5));
  connect(theta, aBCtoDQ0_Park1.theta) annotation(
    Line(points = {{-120, 20}, {-74, 20}, {-74, 43.5}, {-68, 43.5}, {-68, 43}}, color = {0, 0, 127}));
  connect(V_in, aBCtoDQ0_Park1.f_abc) annotation(
    Line(points = {{-120, 62}, {-58, 62}, {-58, 54}}, color = {0, 0, 127}, thickness = 0.5));
  connect(I_in, aBCtoDQ0_Park2.f_abc) annotation(
    Line(points = {{-120, -22}, {-56, -22}, {-56, -56}}, color = {0, 0, 127}, thickness = 0.5));
  connect(aBCtoDQ0_Park2.theta, theta) annotation(
    Line(points = {{-66, -67}, {-74, -67}, {-74, 20}, {-120, 20}}, color = {0, 0, 127}));
  annotation(
    Icon(coordinateSystem(initialScale = 0.1), graphics = {Text(origin = {-2, 81}, extent = {{-50, 23}, {50, -23}}, textString = "Inverter"), Text(origin = {-14, 56}, extent = {{-84, 14}, {102, -24}}, textString = "Control"), Text(origin = {-32, 26}, extent = {{-48, 12}, {104, -30}}, textString = "(PQ)"), Rectangle(extent = {{-100, 100}, {100, -100}}), Rectangle(origin = {-39, -42}, extent = {{-31, 18}, {31, -18}}), Text(origin = {-39, -39}, extent = {{-19, 9}, {19, -9}}, textString = "power"), Rectangle(origin = {45, -42}, extent = {{-31, 18}, {31, -18}}), Text(origin = {45, -39}, extent = {{-19, 9}, {19, -9}}, textString = "current"), Line(origin = {-82.2, -41.6}, points = {{-11, 0}, {11, 0}}, arrow = {Arrow.None, Arrow.Open}), Line(origin = {1.8, -41.6}, points = {{-11, 0}, {11, 0}}, arrow = {Arrow.None, Arrow.Open}), Line(origin = {83.8, -41.6}, points = {{-9, 0}, {9, 0}}, arrow = {Arrow.None, Arrow.Open}), Line(origin = {-1.2, -58.6}, points = {{80, 17}, {80, -17}, {-80, -17}, {-80, 17}}, arrow = {Arrow.None, Arrow.Open}), Text(origin = {84, -34}, extent = {{-8, 8}, {8, -8}}, textString = "v", textStyle = {TextStyle.Italic})}),
  Documentation(info = "<html><head></head><body><div style=\"font-size: 12px;\">parametrized following ssmd [1], based on commit&nbsp;<span style=\"color: rgb(46, 46, 46); font-family: Menlo, 'DejaVu Sans Mono', 'Liberation Mono', Consolas, 'Ubuntu Mono', 'Courier New', 'andale mono', 'lucida console', monospace; font-size: 14px; orphans: 2; white-space: nowrap; widows: 2; background-color: rgb(250, 250, 250);\">d675e1ff</span>&nbsp;&nbsp;.</div><div style=\"font-size: 12px;\">equations refered to [2].<br><div><br></div><div>[1]&nbsp;<a href=\"https://git.rwth-aachen.de/acs/public/simulation/ssmd\">https://git.rwth-aachen.de/acs/public/simulation/ssmd</a></div></div><span style=\"font-size: 12px;\">[2] A. Angioni, E. De Din et el., \"A state-space model for distribution networks\"</span></body></html>"));
end InverterPQCtrl;
