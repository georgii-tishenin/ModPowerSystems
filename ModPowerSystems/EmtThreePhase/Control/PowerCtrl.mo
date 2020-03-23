within ModPowerSystems.EmtThreePhase.Control;
block PowerCtrl

  Modelica.Blocks.Interfaces.RealInput V_dq[2] annotation(
    Placement(visible = true, transformation(origin = {-120, 20}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, 20}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput I_dq[2] annotation(
    Placement(visible = true, transformation(origin = {-120, -20}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, -20}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput I_inv_d_con annotation(
  Placement(visible = true, transformation(origin = {108, 8}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {108, 8}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput I_inv_q_con annotation(
    Placement(visible = true, transformation(origin = {108, -14}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {108, -14}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  
  // low-pass filtered power input
  Real P;
  Real Q;
  
  // states associated with power errors
  Real phi_d;
  Real phi_q;

  // objective P,Q values
  outer parameter Real P_ref;
  outer parameter Real Q_ref;

  // inner PI controller parameters
  parameter Real Kp_vd=0.001;
  parameter Real Ki_vd=0.08;
  parameter Real Kp_vq=0.001;
  parameter Real Ki_vq=0.08;

   Real I_d;
   Real I_q;
   Real V_d;
   Real V_q;
   
  outer ModPowerSystems.EmtThreePhase.Measurements.PLL pll1;

equation
  V_d = V_dq[1];
  V_q = V_dq[2];
  I_d = I_dq[1];
  I_q = I_dq[2];
  
  // calculating power with dq frame values, use (1)
  // or with inst values, use (2)
  
  //****************************************(1)*********************************************
  //power input after Low-Pass Filter, eq. 4 and 5 of [2]
  der(P) = (-1 * P * pll1.omega_nom) 
          + (3 / 2)
          * pll1.omega_nom
          * (V_d * I_d + V_q * I_q);
  der(Q) = (-1 * Q * pll1.omega_nom) 
          + (3 / 2) 
          * pll1.omega_nom
          * (V_q * I_d - V_d * I_q);
  //****************************************(1)*********************************************

  //****************************************(2)*********************************************
  /*
  der(P)=-1*P*pll1.omega_nom
           + (3/2) * pll1.omega_nom
           * ( pll1.V_abc[1] * I_abc[1]
           + pll1.V_abc[2] * I_abc[2] 
           + pll1.V_abc[3] * I_abc[3]);
  */
  
  /*
  der(Q)= -1 * Q * pll1.omega_nom
           + (3/2) * pll1.omega_nom * (1/sqrt(3))
           * ((pll1.V_abc[2] - pll1.V_abc[3]) * I_abc[1]
           - (pll1.V_abc[3] - pll1.V_abc[1]) * I_abc[2]
           - (pll1.V_abc[1] - pll1.V_abc[2]) * I_abc[3]);
  */
  //****************************************(2)*********************************************

  // eq. 6 and 7 of [2]
  der(phi_d) = P_ref - P;
  der(phi_q) = -Q_ref + Q; // aligned to q

  // eq. 8 and 9 of [2]
  I_inv_d_con=(Ki_vd*phi_d+Kp_vd*der(phi_d));
  I_inv_q_con=(Ki_vq*phi_q+Kp_vq*der(phi_q));

annotation(
    Documentation(info = "<html><head></head><body><div>parametrized following ssmd [1], based on commit&nbsp;<span style=\"color: rgb(46, 46, 46); font-family: Menlo, 'DejaVu Sans Mono', 'Liberation Mono', Consolas, 'Ubuntu Mono', 'Courier New', 'andale mono', 'lucida console', monospace; font-size: 14px; orphans: 2; white-space: nowrap; widows: 2; background-color: rgb(250, 250, 250);\">d675e1ff</span>&nbsp;&nbsp;.</div><div>equations refered to [2] .<br><div><br></div><div>[1]&nbsp;<a href=\"https://git.rwth-aachen.de/acs/public/simulation/ssmd\">https://git.rwth-aachen.de/acs/public/simulation/ssmd</a></div></div>[2] A. Angioni, E. De Din et el., \"A state-space model for distribution networks\"</body></html>"),
  Icon(graphics = {Rectangle(origin = {-1, 1}, extent = {{-99, 99}, {101, -101}}), Text(origin = {14, 14}, extent = {{-76, 34}, {48, -10}}, textString = "Power"), Text(origin = {51, -48}, extent = {{-117, 36}, {15, 0}}, textString = "Controller"), Text(origin = {-90, 25}, extent = {{-6, 7}, {6, -7}}, textString = "v", textStyle = {TextStyle.Bold, TextStyle.Italic}), Text(origin = {-92, -21}, extent = {{-6, 7}, {6, -7}}, textString = "i", textStyle = {TextStyle.Bold, TextStyle.Italic}), Text(origin = {78, 11}, extent = {{-6, 7}, {6, -7}}, textString = "i", textStyle = {TextStyle.Bold, TextStyle.Italic}), Text(origin = {78, -15}, extent = {{-6, 7}, {6, -7}}, textString = "i", textStyle = {TextStyle.Bold, TextStyle.Italic}), Text(origin = {87, 8}, extent = {{-3, 2}, {9, -6}}, textString = "d"), Text(origin = {85, -16}, extent = {{-3, 2}, {9, -6}}, textString = "q")}, coordinateSystem(initialScale = 0.1)));
    end PowerCtrl;
