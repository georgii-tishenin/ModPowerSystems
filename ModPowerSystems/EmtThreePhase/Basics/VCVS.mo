within ModPowerSystems.EmtThreePhase.Basics;

model VCVS
  extends ModPowerSystems.Base.Interfaces.RealValue.ThreePhase.OnePort;
  parameter SI.Angle phiV = 0 "Initial Voltage Angle";
  constant SI.Angle[3] phaseShift = (0:2) * 2 * pi / 3 "phase shift";
  Modelica.Blocks.Interfaces.RealInput Vin[3] annotation(
    Placement(visible = true, transformation(origin = {0, 120}, extent = {{-20, -20}, {20, 20}}, rotation = -90), iconTransformation(origin = {0, 120}, extent = {{-20, -20}, {20, 20}}, rotation = -90)));
  ModPowerSystems.Base.System system;
equation
  v[1] = Vin [1];
  v[2] = Vin [2];
  v[3] = Vin [3];
  annotation(
    Icon(coordinateSystem(preserveAspectRatio = false, initialScale = 0.1), graphics = {Ellipse(extent = {{50, 50}, {-50, -50}}, endAngle = 360), Line(points = {{-100, 0}, {-50, 0}}), Line(points = {{96, 0}, {50, 0}}), Line(points = {{28, -4}}), Text(origin = {0, 4}, fillPattern = FillPattern.Solid, extent = {{40, -30}, {-40, 30}}, textString = "~"), Line(origin = {0, 75}, points = {{0, 25}, {0, -23}, {0, -25}, {0, -25}})}),
    Diagram(coordinateSystem(preserveAspectRatio = false)));
end VCVS;
