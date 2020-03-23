within ModPowerSystems.EmtThreePhase.Control;
block CurrentCtrl
  Modelica.Blocks.Interfaces.RealInput I_inv_d_con annotation(
    Placement(visible = true, transformation(origin = {-120, 20}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, 20}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput I_inv_q_con annotation(
    Placement(visible = true, transformation(origin = {-120, -20}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, -20}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput V_dq_con[2] annotation(
    Placement(visible = true, transformation(origin = {108, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {108, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput I_dq[2] annotation(
    Placement(visible = true, transformation(origin = {0, -106}, extent = {{-20, -20}, {20, 20}}, rotation = 90), iconTransformation(origin = {0, -106}, extent = {{-20, -20}, {20, 20}}, rotation = 90)));

  parameter Real Ki_cd = 1400;
  parameter Real Kp_cd =3.77;
  parameter Real Ki_cq = 1400;
  parameter Real Kp_cq =3.77;
  Real gamma_d;
  Real gamma_q;
  Real I_d;
  Real I_q;
equation
  I_d=I_dq[1];
  I_q=I_dq[2];
  
  // equations 10 & 11 in [2]
  der(gamma_d)=I_inv_d_con-I_d;
  der(gamma_q)=I_inv_q_con-I_q;
  
  // with cross coupling of dq current, use (1) or (2), remember also to modify corresponding Inductance in grid model into "inner"
  // without cross coupling, use (3)
  
  /*******(1) original equations 12 & 13 in [2]
  outer ModPowerSystems.EmtThreePhase.Basics.Inductor L_inv;
  V_dq_con[1] = -1*pll.omega_nom*L_inv.L[1,1]*Ki_cd+gamma_d+Kp_cd*der(gamma_d);
  V_dq_con[2] = pll.omega_nom*L_inv.L[1,1]*Ki_cq+gamma_q+Kp_cq*der(gamma_q);
  */

  /*******(2) modified equations 12 & 13 in [2]
  outer ModPowerSystems.EmtThreePhase.Basics.Inductor L_inv;
  V_dq_con[1] = -1*pll.omega_nom*L_inv.L[1,1]*I_q+Ki_cd*gamma_d+Kp_cd*der(gamma_d);
  V_dq_con[2] = pll.omega_nom*L_inv.L[1,1]*I_d+Ki_cq*gamma_q+Kp_cq*der(gamma_q);
  */
  
  /*******(3) modified equations 12 & 13 in [2], without cross-coupling */
  V_dq_con[1] = Ki_cd*gamma_d+Kp_cd*der(gamma_d);
  V_dq_con[2] = Ki_cq*gamma_q+Kp_cq*der(gamma_q);

  annotation(
    Icon(graphics = {Text(origin = {-8, -26}, extent = {{-52, 32}, {70, -32}}, textString = "Controller"), Rectangle(extent = {{-100, 100}, {100, -100}}), Text(origin = {-9, 25}, extent = {{-51, 33}, {65, -37}}, textString = "Current"),Text(origin = {84, 1}, extent = {{-6, 7}, {6, -7}}, textString = "v", textStyle = {TextStyle.Bold, TextStyle.Italic}), Text(origin = {-92, 21}, extent = {{-6, 7}, {6, -7}}, textString = "i", textStyle = {TextStyle.Bold, TextStyle.Italic}), Text(origin = {-90, -19}, extent = {{-6, 7}, {6, -7}}, textString = "i", textStyle = {TextStyle.Bold, TextStyle.Italic}), Text(origin = {-85, 18}, extent = {{-3, 2}, {9, -6}}, textString = "d"), Text(origin = {-83, -20}, extent = {{-3, 2}, {9, -6}}, textString = "q")}, coordinateSystem(initialScale = 0.1)),
    Documentation(info = "<html><head></head><body><div style=\"font-size: 12px;\">parametrized following ssmd [1], based on commit&nbsp;<span style=\"color: rgb(46, 46, 46); font-family: Menlo, 'DejaVu Sans Mono', 'Liberation Mono', Consolas, 'Ubuntu Mono', 'Courier New', 'andale mono', 'lucida console', monospace; font-size: 14px; orphans: 2; white-space: nowrap; widows: 2; background-color: rgb(250, 250, 250);\">d675e1ff</span>&nbsp;&nbsp;.</div><div style=\"font-size: 12px;\">equations refered to [2] .<br><div><br></div><div>[1]&nbsp;<a href=\"https://git.rwth-aachen.de/acs/public/simulation/ssmd\">https://git.rwth-aachen.de/acs/public/simulation/ssmd</a></div></div><span style=\"font-size: 12px;\">[2] A. Angioni, E. De Din et el., \"A state-space model for distribution networks\"</span></body></html>"));
end CurrentCtrl;
