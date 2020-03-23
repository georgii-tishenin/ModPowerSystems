within ModPowerSystems.EmtThreePhase.Measurements;

model VoltagemeasurementDQ
extends ModPowerSystems.Base.Interfaces.RealValue.ThreePhase.OnePortGrounded;
  Modelica.Blocks.Interfaces.RealInput Theta annotation(
    Placement(visible = true, transformation(origin = {-118, 82}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-115, -1}, extent = {{-15, -15}, {15, 15}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput V_dq[3] annotation(
    Placement(visible = true, transformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
    i = zeros(3);
    V_dq =Transforms.Functions.ABCtoQD0_Krause(v, Theta);    
annotation(
    Icon(graphics = {Rectangle(extent = {{-100, 100}, {100, -100}}), Text(origin = {-38, 8}, extent = {{-16, 30}, {100, -44}}, textString = "Voltage measurement DQ")}, coordinateSystem(initialScale = 0.1)));end VoltagemeasurementDQ;
