within ModPowerSystems.EmtThreePhase.Transforms;

model DQtoABC_Park
  Modelica.Blocks.Interfaces.RealInput v_dq[2] annotation (
    Placement(visible = true, transformation(origin = {-120, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput v_abc[3] annotation (
    Placement(visible = true, transformation(origin = {112, -2}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput theta annotation (
    Placement(visible = true, transformation(origin = {-116, 60}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {0, 120}, extent = {{-20, -20}, {20, 20}}, rotation = -90)));
equation
  v_abc =Transforms.Functions.DQtoABC_Park(v_dq, theta);
annotation (
    Icon(graphics = {Rectangle(extent = {{-100, 100}, {100, -100}}), Text(origin = {65, -34}, extent = {{-55, 32}, {21, -46}}, textString = "abc"), Text(origin = {-35, 64}, extent = {{-55, 32}, {21, -46}}, textString = "dq"), Line(origin = {0, 0.636364},points = {{100, 100}, {-100, -100}, {-100, -100}}, thickness = 0.5)}, coordinateSystem(initialScale = 0.1)));
end DQtoABC_Park;
