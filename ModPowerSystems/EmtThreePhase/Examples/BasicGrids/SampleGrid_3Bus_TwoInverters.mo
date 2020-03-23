within ModPowerSystems.EmtThreePhase.Examples.BasicGrids;

model SampleGrid_3Bus_TwoInverters
  ModPowerSystems.EmtThreePhase.Slack.Slack slack1(Vnom = 380, phiV = 0) annotation(
    Placement(visible = true, transformation(origin = {-22, 42}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  ModPowerSystems.EmtThreePhase.Connections.RxLine rxLine1(Vnom = 380, length = 0.2) annotation(
    Placement(visible = true, transformation(origin = {-22, 8}, extent = {{10, -10}, {-10, 10}}, rotation = 90)));
  ModPowerSystems.EmtThreePhase.Loads.ZLoad zLoad1(Pnom = {5e3, 5e3, 5e3}, Qnom = {5e2, 5e2, 5e2}, Vnom = 380) annotation(
    Placement(visible = true, transformation(origin = {18, -12}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner ModPowerSystems.Base.System system annotation(
    Placement(visible = true, transformation(origin = {-90, 86}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  ModPowerSystems.EmtThreePhase.Converters.InverterPQCtrl inv_LC_PQCtrl1 annotation(
    Placement(visible = true, transformation(origin = {-44, -2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  ModPowerSystems.EmtThreePhase.Basics.Ground ground1 annotation(
    Placement(visible = true, transformation(origin = {-70, -12}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  ModPowerSystems.EmtThreePhase.Basics.Ground ground2 annotation(
    Placement(visible = true, transformation(origin = {84, -12}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  ModPowerSystems.EmtThreePhase.Converters.InverterPQCtrl inv_LC_PQCtrl2(Q_obj = 4e2)  annotation(
    Placement(visible = true, transformation(origin = {68, -2}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  ModPowerSystems.EmtThreePhase.Connections.RxLine rxLine3(Vnom = 380, length = 0.2) annotation(
    Placement(visible = true, transformation(origin = {0, -2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  ModPowerSystems.EmtThreePhase.Connections.RxLine rxLine2(Vnom = 380, length = 0.2) annotation(
    Placement(visible = true, transformation(origin = {36, -2}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
equation
  connect(ground2.Plug1, inv_LC_PQCtrl2.Plug1) annotation(
    Line(points = {{84, -2}, {78, -2}}));
  connect(inv_LC_PQCtrl2.Plug2, rxLine2.Plug1) annotation(
    Line(points = {{58, -2}, {46, -2}}));
  connect(rxLine2.Plug2, zLoad1.Plug1) annotation(
    Line(points = {{26, -2}, {18, -2}}));
  connect(rxLine3.Plug2, zLoad1.Plug1) annotation(
    Line(points = {{10, -2}, {18, -2}}));
  connect(rxLine1.Plug2, rxLine3.Plug1) annotation(
    Line(points = {{-22, -2}, {-10, -2}}));
  connect(inv_LC_PQCtrl1.Plug1, ground1.Plug1) annotation(
    Line(points = {{-54, -2}, {-70, -2}}));
  connect(inv_LC_PQCtrl1.Plug2, rxLine1.Plug2) annotation(
    Line(points = {{-34, -2}, {-22, -2}}));
  connect(slack1.Plug1, rxLine1.Plug1) annotation(
    Line(points = {{-22, 32}, {-22, 18}}));
  annotation(
    Documentation(info = "<html><head></head><body><div style=\"font-size: 12px;\"><br></div></body></html>"));
end SampleGrid_3Bus_TwoInverters;
