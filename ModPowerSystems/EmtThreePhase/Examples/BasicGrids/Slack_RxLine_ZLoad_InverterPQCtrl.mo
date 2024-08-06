within ModPowerSystems.EmtThreePhase.Examples.BasicGrids;

model Slack_RxLine_ZLoad_InverterPQCtrl
  ModPowerSystems.EmtThreePhase.Slack.Slack slack1(Vnom = 380, phiV = 0) annotation(
    Placement(visible = true, transformation(origin = {46, 32}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  ModPowerSystems.EmtThreePhase.Connections.RxLine rxLine1(length = 0.2) annotation(
    Placement(visible = true, transformation(origin = {46, -12}, extent = {{10, -10}, {-10, 10}}, rotation = 90)));
  ModPowerSystems.EmtThreePhase.Loads.ZLoad zLoad1(Pnom = {5e3, 5e3, 5e3}, Qnom = {5e2, 5e2, 5e2}, Vnom = 380) annotation(
    Placement(visible = true, transformation(origin = {46, -52}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner ModPowerSystems.Base.System system annotation(
    Placement(visible = true, transformation(origin = {-64, 36}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  ModPowerSystems.EmtThreePhase.Converters.InverterPQCtrl inv_LC_PQCtrl1 annotation(
    Placement(visible = true, transformation(origin = {-20, -22}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  ModPowerSystems.EmtThreePhase.Basics.Ground ground1 annotation(
    Placement(visible = true, transformation(origin = {-56, -32}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(rxLine1.Plug2, zLoad1.Plug1) annotation(
    Line(points = {{46, -22}, {46, -22}, {46, -42}, {46, -42}}));
  connect(inv_LC_PQCtrl1.Plug1, ground1.Plug1) annotation(
    Line(points = {{-30, -22}, {-56, -22}}));
  connect(inv_LC_PQCtrl1.Plug2, rxLine1.Plug2) annotation(
    Line(points = {{-10, -22}, {46, -22}}));
  connect(slack1.Plug1, rxLine1.Plug1) annotation(
    Line(points = {{46, 22}, {46, -2}}));
  annotation(
    Documentation(info = "<html><head></head><body><p>* a compact version of&nbsp;</p><p><span style=\"font-family: 'Courier New'; font-size: 12pt;\">slack_single_inv_withCtrl</span>&nbsp;</p><p>within&nbsp;<span style=\"font-family: 'Courier New'; font-size: 12pt;\">BasicGrids</span></p>
</body></html>"));
end Slack_RxLine_ZLoad_InverterPQCtrl;
