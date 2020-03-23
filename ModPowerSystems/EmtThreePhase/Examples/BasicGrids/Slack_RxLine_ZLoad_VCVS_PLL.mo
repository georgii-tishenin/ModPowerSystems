within ModPowerSystems.EmtThreePhase.Examples.BasicGrids;

model Slack_RxLine_ZLoad_VCVS_PLL
  ModPowerSystems.EmtThreePhase.Slack.Slack slack1(Vnom = 380, phiV = 0) annotation(
    Placement(visible = true, transformation(origin = {68, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  ModPowerSystems.EmtThreePhase.Connections.RxLine rxLine1(Vnom = 380, length = 0.2) annotation(
    Placement(visible = true, transformation(origin = {68, -14}, extent = {{10, -10}, {-10, 10}}, rotation = 90)));
  ModPowerSystems.EmtThreePhase.Loads.ZLoad zLoad1(Pnom = {5e3, 5e3, 5e3}, Qnom = {5e2, 5e2, 5e2}, Vnom = 380) annotation(
    Placement(visible = true, transformation(origin = {68, -42}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner ModPowerSystems.Base.System system annotation(
    Placement(visible = true, transformation(origin = {-68, 76}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  ModPowerSystems.EmtThreePhase.Basics.Ground ground1 annotation(
    Placement(visible = true, transformation(origin = {-70, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  ModPowerSystems.EmtThreePhase.Basics.Ground ground2 annotation(
    Placement(visible = true, transformation(origin = {-2, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  ModPowerSystems.EmtThreePhase.Basics.Inductor inductor1(L = {{3e-2, 0, 0}, {0, 3e-2, 0}, {0, 0, 3e-2}})  annotation(
    Placement(visible = true, transformation(origin = {-22,-24}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  ModPowerSystems.EmtThreePhase.Basics.Capacitor capacitor1 annotation(
    Placement(visible = true, transformation(origin = {-2, -34}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  ModPowerSystems.EmtThreePhase.Basics.VCVS_DQ vCVS_Inv_Av1(Vnom = 380)  annotation(
    Placement(visible = true, transformation(origin = {-54, -24}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  ModPowerSystems.EmtThreePhase.Measurements.VoltageMeasurementABC voltageMeasurementABC1 annotation(
    Placement(visible = true, transformation(origin = {-2, 10}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  ModPowerSystems.EmtThreePhase.Measurements.PLL pll1 annotation(
    Placement(visible = true, transformation(origin = {-2, 40}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
equation
  connect(voltageMeasurementABC1.v_abc, pll1.V_abc) annotation(
    Line(points = {{14, 10}, {21, 10}, {21, 10}, {28, 10}, {28, 40}, {12, 40}, {12, 40}, {10, 40}}, color = {0, 0, 127}, thickness = 0.5));
  connect(pll1.theta, vCVS_Inv_Av1.theta) annotation(
    Line(points = {{-13, 40}, {-36, 40}, {-36, 40}, {-59, 40}, {-59, -12}, {-59, -12}, {-59, -12}, {-59, -12}}, color = {0, 0, 127}));
  connect(voltageMeasurementABC1.Plug1, capacitor1.Plug1) annotation(
    Line(points = {{-2, 0}, {-2, 0}, {-2, -24}, {-2, -24}, {-2, -24}, {-2, -24}}));
  connect(vCVS_Inv_Av1.Plug2, ground1.Plug1) annotation(
    Line(points = {{-64, -24}, {-70, -24}, {-70, -30}, {-70, -30}, {-70, -30}, {-70, -30}}));
  connect(vCVS_Inv_Av1.Plug1, inductor1.Plug1) annotation(
    Line(points = {{-44, -24}, {-38, -24}, {-38, -24}, {-32, -24}, {-32, -24}, {-32, -24}, {-32, -24}, {-32, -24}}));
  connect(capacitor1.Plug1, rxLine1.Plug2) annotation(
    Line(points = {{-2, -24}, {15.5, -24}, {15.5, -24}, {33, -24}, {33, -24}, {68, -24}, {68, -24}, {68, -24}, {68, -24}, {68, -24}}));
  connect(inductor1.Plug2, capacitor1.Plug1) annotation(
    Line(points = {{-12, -24}, {-7, -24}, {-7, -24}, {-2, -24}, {-2, -24}, {-2, -24}, {-2, -24}, {-2, -24}}));
  connect(capacitor1.Plug2, ground2.Plug1) annotation(
    Line(points = {{-2, -44}, {-2, -44}, {-2, -44}, {-2, -44}, {-2, -44}, {-2, -44}, {-2, -50}, {-2, -50}, {-2, -50}, {-2, -50}}));
  connect(rxLine1.Plug2, zLoad1.Plug1) annotation(
    Line(points = {{68, -24}, {68, -32}}));
  connect(slack1.Plug1, rxLine1.Plug1) annotation(
    Line(points = {{68, 20}, {68, -4}}));
  /************ test with constant input
  vCVS_Inv_Av1.V_dq_in={220,0};
  vCVS_Inv_Av1.theta=system.theta;
  */
  
  /************ test with input from PLL
  */
  vCVS_Inv_Av1.V_dq_in=pll1.V_dq;
    connect(pll1.theta, vCVS_Inv_Av1.theta) annotation(
    Line(points = {{-13, 40}, {-36, 40}, {-36, 40}, {-59, 40}, {-59, -12}, {-59, -12}, {-59, -12}, {-59, -12}}, color = {0, 0, 127}));
  
  annotation(
    Documentation(info = "<html><head></head><body><p>* this is intended to validate the VCVS_DQ model, pll and dq transform.&nbsp;<br>* expected results:</p><p><span class=\"Apple-tab-span\" style=\"white-space:pre\">	</span>**&nbsp;VCVS_DQ.v [:] = rxline1.v2 [:]&nbsp;<br><span class=\"Apple-tab-span\" style=\"white-space:pre\">	</span>**&nbsp;VCVS_DQ.i [:] close to 0.</p><p><br>* input to the controlled voltage source (VCVS_DQ) is V_dq from the PLL.</p><div style=\"font-size: 12px;\"><br></div></body></html>"));
end Slack_RxLine_ZLoad_VCVS_PLL;
