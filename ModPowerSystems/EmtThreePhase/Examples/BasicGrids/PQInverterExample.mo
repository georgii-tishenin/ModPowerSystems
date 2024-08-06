within ModPowerSystems.EmtThreePhase.Examples.BasicGrids;

model PQInverterExample
  Connections.RxLine rxLine1(length = 0.2) annotation(
    Placement(visible = true, transformation(origin = {46, -12}, extent = {{10, -10}, {-10, 10}}, rotation = 90)));
  Basics.Ground ground1 annotation(
    Placement(visible = true, transformation(origin = {-56, -32}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner Base.System system annotation(
    Placement(visible = true, transformation(origin = {-64, 36}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Loads.ZLoad zLoad1(Pnom = {5e3, 5e3, 5e3}, Qnom = {5e2, 5e2, 5e2}, Vnom = 380) annotation(
    Placement(visible = true, transformation(origin = {46, -52}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Slack.Slack slack1(Vnom = 380, phiV = 0) annotation(
    Placement(visible = true, transformation(origin = {46, 32}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  ModPowerSystems.EmtThreePhase.Converters.PQInverter pQInverter annotation(
    Placement(visible = true, transformation(origin = {-18, -22}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(slack1.Plug1, rxLine1.Plug1) annotation(
    Line(points = {{46, 22}, {46, -2}}));
  connect(rxLine1.Plug2, zLoad1.Plug1) annotation(
    Line(points = {{46, -22}, {46, -22}, {46, -42}, {46, -42}}));
  connect(ground1.Plug1, pQInverter.Plug1) annotation(
    Line(points = {{-56, -22}, {-28, -22}}));
  connect(pQInverter.Plug2, rxLine1.Plug2) annotation(
    Line(points = {{-8, -22}, {46, -22}}));
protected
end PQInverterExample;
