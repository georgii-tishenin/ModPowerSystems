within ModPowerSystems.EmtThreePhase.Measurements;
model VoltageMeasurementABC
  extends ModPowerSystems.Base.Interfaces.RealValue.ThreePhase.OnePortGrounded;

  Modelica.Blocks.Interfaces.RealOutput v_abc[3] annotation (
    Placement(visible = true, transformation(origin = {106, -2}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {160, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));

equation
  v_abc = v[:];
  i = zeros(3);

  annotation (
    Icon(coordinateSystem(initialScale = 0.1), graphics = {Rectangle(origin = {-62, 66}, rotation = -90, extent = {{-34, -38}, {166, 162}}), Line(origin = {88.8914, -0.350028}, points = {{10, 0}, {52, 0}}), Text(origin = {-35, 58}, extent = {{-19, 12}, {83, -62}}, textString = "Vabc"), Text(origin = {25, -33}, extent = {{-115, 37}, {73, -31}}, textString = "measurement")}),
    Diagram);
end VoltageMeasurementABC;
