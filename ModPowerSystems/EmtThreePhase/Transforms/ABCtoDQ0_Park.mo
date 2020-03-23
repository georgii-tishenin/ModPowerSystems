within ModPowerSystems.EmtThreePhase.Transforms;
model ABCtoDQ0_Park
  Modelica.Blocks.Interfaces.RealOutput f_dq[2] annotation (
    Placement(visible = true, transformation(origin = {112, -2}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput f_abc[3] annotation (
    Placement(visible = true, transformation(origin = {-104, -38}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {0, 120}, extent = {{-20, -20}, {20, 20}}, rotation = -90)));
  Modelica.Blocks.Interfaces.RealInput theta annotation(
    Placement(visible = true, transformation(origin = {-104, 12}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-104, 12}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
equation
  f_dq =Transforms.Functions.ABCtoDQ_Park(f_abc,theta);
annotation (
    Icon(graphics = {Rectangle(origin = {0, 1}, extent = {{-100, 99}, {100, -101}}), Text(origin = {-35, 64}, extent = {{-55, 32}, {21, -46}}, textString = "abc"), Text(origin = {65, -34}, extent = {{-55, 32}, {21, -46}}, textString = "dq"), Line(points = {{100, 100}, {-100, -100}, {-100, -100}}, thickness = 0.5), Text(origin = {-85, -9}, extent = {{-9, 5}, {9, -5}}, textString = "theta"), Text(origin = {0, 90}, extent = {{-14, 6}, {14, -6}}, textString = "abc")}, coordinateSystem(initialScale = 0.1)),
    Diagram(graphics = {Rectangle(extent = {{-100, 100}, {100, -100}})}));
end ABCtoDQ0_Park;