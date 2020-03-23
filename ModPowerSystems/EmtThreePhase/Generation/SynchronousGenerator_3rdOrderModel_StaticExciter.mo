within ModPowerSystems.EmtThreePhase.Generation;

model SynchronousGenerator_3rdOrderModel_StaticExciter
  extends ModPowerSystems.Base.Interfaces.RealValue.ThreePhase.OnePortGrounded;
  ModPowerSystems.EmtThreePhase.Generation.Controllers.ExciterSteadyState exciterSteadyState(H = H, L_l = L_l, L_lfd = L_lfd, L_md = L_md, L_mq = L_mq, P_nom = P_nom, R_fd = R_fd, R_s = R_s, V_nom = V_nom, f_nom = f_nom, p = p, theta_volt_init = Volt_theta / 180 * Modelica.Constants.pi, vt_init = Volt_abs / V_nom) annotation(
    Placement(visible = true, transformation(origin = {-40, 8}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
 // general machine characteristics
  parameter Real V_nom = 24e3 "Nominal phase-to-phase RMS voltage";
  parameter Real P_nom = 555e6 "Nominal turbine (active) power (MW)";
  parameter Real f_nom = 60 "Nominal frequency";
  parameter Real p = 1 "Number of pole pairs";
  parameter Real H = 3.7 "Inertia constant";
  // machine parameters in per-unit system
  parameter Real R_s = 0.003 "Stator Resistance";
  parameter Real L_l = 0.15 "Stator leakage";
  parameter Real L_md = 1.6599 "d axis mutual inductance";
  parameter Real L_mq = 1.61 "q axis mutual inductance";
  parameter Real R_fd = 0.0006 "Rotor Resistance";
  parameter Real L_lfd = 0.1648 "Rotor leakage";
  // steady state operating point
  parameter Real P_out = 300e6 "Operating point active power [W]";
  parameter Real Q_out = -8.17432e7 "Operating point active power [VA]";
  parameter Real Volt_abs = 25.2e3 "Voltage magnitude in steady state [V]";
  parameter Real Volt_theta = 10.5259 "Voltage angle in steady state [deg]";
  
  Modelica.Blocks.Sources.Constant P_m(k = P_out) annotation(
    Placement(visible = true, transformation(extent = {{-94, 8}, {-84, 18}}, rotation = 0)));
  ModPowerSystems.EmtThreePhase.Generation.SynchronousGenerator_3rdOrderModel synchronousGenerator_3rdOrderModel(H = H, L_l = L_l, L_lfd = L_lfd, L_md = L_md, L_mq = L_mq, P_init = P_out / P_nom, P_nom = P_nom, Q_init = Q_out / P_nom, R_fd = R_fd, R_s = R_s, V_nom = V_nom, f_nom = f_nom, p = p, theta_volt_init = Volt_theta / 180 * Modelica.Constants.pi, vt_init = Volt_abs / V_nom) annotation(
    Placement(visible = true, transformation(origin = {0, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant Q(k = Q_out) annotation(
    Placement(visible = true, transformation(extent = {{-94, -22}, {-84, -12}}, rotation = 0)));
equation
  connect(P_m.y, exciterSteadyState.P) annotation(
    Line(points = {{-83.5, 13}, {-52, 13}, {-52, 12}}, color = {0, 0, 127}));
 connect(synchronousGenerator_3rdOrderModel.Plug1, Plug1) annotation(
    Line(points = {{0, 20}, {0, 100}}));
 connect(synchronousGenerator_3rdOrderModel.P_m_in, P_m.y) annotation(
    Line(points = {{-10, 12}, {-14, 12}, {-14, 28}, {-68, 28}, {-68, 14}, {-84, 14}}, color = {0, 0, 127}));
  connect(Q.y, exciterSteadyState.Q) annotation(
    Line(points = {{-84, -16}, {-70, -16}, {-70, 4}, {-54, 4}, {-54, 4}, {-52, 4}}, color = {0, 0, 127}));
 connect(exciterSteadyState.vfd, synchronousGenerator_3rdOrderModel.v_fd_in) annotation(
    Line(points = {{-28, 8}, {-10, 8}}, color = {0, 0, 127}));
  annotation(
    Diagram(coordinateSystem(preserveAspectRatio = false, initialScale = 0.1)),
    Icon(coordinateSystem(preserveAspectRatio = false, initialScale = 0.1), graphics = {Ellipse(extent = {{-60, 58}, {60, -62}}, endAngle = 360), Ellipse(extent = {{-40, 38}, {40, -42}}, endAngle = 360), Text(extent = {{-30, 26}, {30, -26}}, textString = "SG"), Line(points = {{0, 94}, {0, 58}})}));
end SynchronousGenerator_3rdOrderModel_StaticExciter;
