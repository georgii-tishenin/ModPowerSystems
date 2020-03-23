within ModPowerSystems.EmtThreePhase.Measurements;
model PLL
extends Modelica.Icons.RotationalSensor;

  Modelica.Blocks.Interfaces.RealInput V_abc[3] annotation (
    Placement(visible = true, transformation(origin = {-120, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput theta annotation (
    Placement(visible = true, transformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput omega annotation(
    Placement(visible = true, transformation(origin = {110, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  parameter Real f_nom=50;
  parameter Real omega_nom=2*pi*f_nom;
  parameter Real Kp_pll=0.25;
  parameter Real Ki_pll=2;
  parameter Real Kd_pll=1;
  Real phi_pll;
  Real freq;
  Real V_dq[2];    
  //Real V_abc_f[3];
  
initial equation
  theta=0;
  omega=omega_nom;
equation
  // ****** to add a LPF on Voltage measurement;
  //der(V_abc_f)=-1*V_abc_f*omega_nom + omega_nom*V_abc;
  //V_dq =Transforms.Functions.ABCtoDQ_Park(V_abc_f,theta);
  V_dq =Transforms.Functions.ABCtoDQ_Park(V_abc,theta);
  // ******
  
  der(theta)=omega;
  omega=omega_nom+Kp_pll*der(phi_pll)+Ki_pll*(phi_pll)+Kd_pll*der(V_dq[2]);
  der(phi_pll) = V_dq[2];
  freq=omega/(2*pi);
  annotation (
    Diagram(graphics={  Rectangle(extent = {{-100, 100}, {100, -100}}), Text(origin = {-2, 58}, extent = {{-48, 18}, {48, -18}}, textString = "PLL")}),
    Icon(graphics={  Rectangle(origin = {0, 26}, extent = {{-100, 74}, {100, -126}}), Text(origin = {-10, -48}, extent = {{-42, 14}, {66, -58}}, textString = "PLL"), Rectangle(origin = {0, -70}, lineThickness = 1.25, extent = {{-80, 30}, {80, -30}})}, coordinateSystem(initialScale = 0.1)));
end PLL;
