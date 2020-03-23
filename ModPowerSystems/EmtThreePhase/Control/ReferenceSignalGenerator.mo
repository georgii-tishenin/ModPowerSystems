within ModPowerSystems.EmtThreePhase.Control;

block ReferenceSignalGenerator
  Real omega = 2*pi*fref;
  Real theta = omega*time;
  constant SI.Angle[3] phaseShift = (0:2)*2*pi/3 "phase shift";
  Modelica.Blocks.Interfaces.RealInput Vref annotation(
    Placement(visible = true, transformation(origin = {-120, 58}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-110, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput fref annotation(
    Placement(visible = true, transformation(origin = {-120, -40}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-110, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput phi annotation(
    Placement(visible = true, transformation(origin = {0, -120}, extent = {{-20, -20}, {20, 20}}, rotation = 90), iconTransformation(origin = {0, -120}, extent = {{-20, -20}, {20, 20}}, rotation = 90)));
  Modelica.Blocks.Interfaces.RealOutput Vabc[3] annotation(
    Placement(visible = true, transformation(origin = {121, -1}, extent = {{-21, -21}, {21, 21}}, rotation = 0), iconTransformation(origin = {121, -1}, extent = {{-21, -21}, {21, 21}}, rotation = 0)));
equation
     Vabc[1] = Vref*cos(theta + phi + phaseShift[1]);
     Vabc[2] = Vref*cos(theta + phi - phaseShift[2]);
     Vabc[3] = Vref*cos(theta + phi - phaseShift[3]);
annotation(
    Diagram(graphics = {Rectangle(extent = {{-100, 100}, {100, -100}})}));
end ReferenceSignalGenerator;
