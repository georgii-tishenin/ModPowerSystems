within ModPowerSystems.EmtThreePhase.Measurements;
model CurrentMeasurementABC
  extends ModPowerSystems.Base.Interfaces.RealValue.ThreePhase.OnePort;
  Modelica.Blocks.Interfaces.RealOutput i_abc[3] annotation (
    Placement(visible = true, transformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {107, -17}, extent = {{-7, -7}, {7, 7}}, rotation = 0)));
equation
  v = zeros(3);
  i_abc[:] = i[:];
  annotation (
    Icon(graphics={  Ellipse(origin = {1, 1}, extent = {{-11, 11}, {11, -11}}, endAngle = 360), Line(origin = {-83, 0}, points = {{-17, 0}, {73, 0}}), Line(origin = {12, 0}, points = {{0, 0}}), Line(origin = {14, 0}, points = {{0, 0}}), Line(origin = {56.1708, 1.17082}, points = {{-44.1708, -1.17082}, {39.8292, -1.17082}, {43.8292, 0.82918}}), Text(extent = {{-2, 6}, {4, -2}}, textString = "A"), Rectangle(origin = {0, 1}, extent = {{-100, 27}, {100, -29}})}, coordinateSystem(initialScale = 0.1)));
end CurrentMeasurementABC;
