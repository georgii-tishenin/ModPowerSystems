within ModPowerSystems.EmtThreePhase.Measurements;

model CurrentmeasurementDQ
extends ModPowerSystems.Base.Interfaces.RealValue.ThreePhase.OnePort;
  Modelica.Blocks.Interfaces.RealInput Theta annotation(
    Placement(visible = true, transformation(origin = {-118, 82}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-112, 22}, extent = {{-12, -12}, {12, 12}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput I_dq[3] annotation(
    Placement(visible = true, transformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {109, -25}, extent = {{-9, -9}, {9, 9}}, rotation = 0)));
  equation
    v = zeros(3);
    I_dq =Transforms.Functions.ABCtoQD0_Krause(i, Theta);    
annotation(
    Icon(coordinateSystem(initialScale = 0.1), graphics = {Line(origin = {-56, 0}, points = {{-38, 0}, {38, 0}, {40, 0}}), Line(origin = {55, 0}, points = {{37, 0}, {-37, 0}}), Ellipse(origin = {1, 1}, extent = {{-17, 17}, {17, -17}}, endAngle = 360), Text(origin = {13, 19}, extent = {{-25, -35}, {1, 1}}, textString = "A"), Rectangle(extent = {{-100, 40}, {100, -40}})}));
end CurrentmeasurementDQ;
