within ModPowerSystems.EmtThreePhase.Examples.BasicGrids;

model SampleGrid_4Bus_TwoInverters
  ModPowerSystems.EmtThreePhase.Slack.Slack slack1(Vnom = 380, phiV = 0) annotation(
    Placement(visible = true, transformation(origin = {-22, 42}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  ModPowerSystems.EmtThreePhase.Connections.RxLine rxLine1(Vnom = 380, length = 0.2) annotation(
    Placement(visible = true, transformation(origin = {-22, 8}, extent = {{10, -10}, {-10, 10}}, rotation = 90)));
  ModPowerSystems.EmtThreePhase.Loads.ZLoad zLoad1(Pnom = {1e3, 1e3, 1e3}, Qnom = {1e2, 1e2, 1e2}, Vnom = 380) annotation(
    Placement(visible = true, transformation(origin = {12, -12}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner ModPowerSystems.Base.System system annotation(
    Placement(visible = true, transformation(origin = {-60, 66}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  ModPowerSystems.EmtThreePhase.Converters.InverterPQCtrl inv_1(Q_obj = 1e2)  annotation(
    Placement(visible = true, transformation(origin = {-44, -2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  ModPowerSystems.EmtThreePhase.Basics.Ground ground1 annotation(
    Placement(visible = true, transformation(origin = {-70, -12}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  ModPowerSystems.EmtThreePhase.Basics.Ground ground2 annotation(
    Placement(visible = true, transformation(origin = {84, 24}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  ModPowerSystems.EmtThreePhase.Converters.InverterPQCtrl inv_2(Q_obj = 2e2)  annotation(
    Placement(visible = true, transformation(origin = {60, 34}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  ModPowerSystems.EmtThreePhase.Connections.RxLine rxLine3(Vnom = 380, length = 0.2) annotation(
    Placement(visible = true, transformation(origin = {30, -2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  ModPowerSystems.EmtThreePhase.Connections.RxLine rxLine2(Vnom = 380, length = 2) annotation(
    Placement(visible = true, transformation(origin = {-4, -2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  ModPowerSystems.EmtThreePhase.Connections.RxLine rxLine4(Vnom = 380, length = 0.2) annotation(
    Placement(visible = true, transformation(origin = {60, -2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  ModPowerSystems.EmtThreePhase.Loads.ZLoad zLoad2(Pnom = {1e3, 1e3, 1e3}, Qnom = {1e2, 1e2, 1e2}, Vnom = 380) annotation(
    Placement(visible = true, transformation(origin = {82, -12}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(ground2.Plug1, inv_2.Plug1) annotation(
    Line(points = {{84, 34}, {70, 34}}));
  connect(rxLine1.Plug2, rxLine2.Plug1) annotation(
    Line(points = {{-22, -2}, {-14, -2}}));
  connect(rxLine2.Plug2, zLoad1.Plug1) annotation(
    Line(points = {{6, -2}, {12, -2}}));
  connect(slack1.Plug1, rxLine1.Plug1) annotation(
    Line(points = {{-22, 32}, {-22, 18}}));
  connect(inv_1.Plug2, rxLine1.Plug2) annotation(
    Line(points = {{-34, -2}, {-22, -2}}));
  connect(rxLine4.Plug2, zLoad2.Plug1) annotation(
    Line(points = {{70, -2}, {82, -2}}));
  connect(rxLine3.Plug2, rxLine4.Plug1) annotation(
    Line(points = {{40, -2}, {50, -2}}));
  connect(rxLine3.Plug1, zLoad1.Plug1) annotation(
    Line(points = {{20, -2}, {12, -2}}));
  connect(inv_2.Plug2, rxLine3.Plug2) annotation(
    Line(points = {{50, 34}, {40, 34}, {40, -2}, {40, -2}, {40, -2}}));
  connect(inv_1.Plug1, ground1.Plug1) annotation(
    Line(points = {{-54, -2}, {-70, -2}}));
  annotation(
    Documentation(info = "<html><head></head><body><div style=\"font-size: 12px;\">* total q injection by inverters are larger than consumption by loads</div><div style=\"font-size: 12px;\">* observabal voltage rise on Bus3 and Bus1&nbsp;</div></body></html>"),
    Diagram(coordinateSystem(initialScale = 0.1), graphics = {Text(origin = {-21, -8}, lineColor = {0, 104, 0}, fillColor = {255, 255, 255}, extent = {{-5, 4}, {5, -4}}, textString = "Bus1"), Text(origin = {11, 6}, lineColor = {0, 104, 0}, fillColor = {0, 85, 0}, extent = {{-5, 4}, {5, -4}}, textString = "Bus2"), Text(origin = {41, -8}, lineColor = {0, 104, 0}, fillColor = {0, 85, 0}, extent = {{-5, 4}, {5, -4}}, textString = "Bus3"), Text(origin = {83, 4}, lineColor = {0, 104, 0}, fillColor = {0, 85, 0}, extent = {{-5, 4}, {5, -4}}, textString = "Bus4"), Rectangle(origin = {-21, -8}, lineColor = {0, 85, 0}, extent = {{-5, 2}, {5, -2}}), Rectangle(origin = {11, 6}, lineColor = {0, 85, 0}, extent = {{-5, 2}, {5, -2}}), Rectangle(origin = {41, -8}, lineColor = {0, 85, 0}, extent = {{-5, 2}, {5, -2}}), Rectangle(origin = {83, 4}, lineColor = {0, 85, 0}, extent = {{-5, 2}, {5, -2}})}));
end SampleGrid_4Bus_TwoInverters;
