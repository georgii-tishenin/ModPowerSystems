within ModPowerSystems.EmtThreePhase.Measurements;
class PLLIdeal
  parameter Modelica.SIunits.Frequency freq_nom = 50;
  parameter Modelica.SIunits.Angle theta_0 = 0;
  Real omega;
  Modelica.Blocks.Interfaces.RealOutput theta annotation (
    Placement(visible = true, transformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  omega = 2*pi*freq_nom;
  theta = theta_0 + omega*time;

annotation (
    Icon(graphics = {Rectangle(origin = {-40, 39}, extent = {{-60, 41}, {140, -119}}), Text(origin = {-77, 58}, extent = {{157, -118}, {-3, 2}}, textString = "PLLIdeal", fontSize = 36)}, coordinateSystem(initialScale = 0.1)));
end PLLIdeal;
