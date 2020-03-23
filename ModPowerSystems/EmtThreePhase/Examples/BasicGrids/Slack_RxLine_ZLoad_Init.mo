within ModPowerSystems.EmtThreePhase.Examples.BasicGrids;
model Slack_RxLine_ZLoad_Init
inner ModPowerSystems.Base.System system
    annotation (Placement(transformation(extent={{-100,80},{-80,100}})));
  ModPowerSystems.EmtThreePhase.Slack.Slack slack( Vnom = 110000.0, phiV = 0, v( start = {89814.62390204989, -44907.31195102492, -44907.31195102492}), i( start = {-37.02894077119425, 34.55425712418914, 2.4746836470050937}))
    annotation (Placement(transformation(extent={{-10,30},{10,10}})));
  ModPowerSystems.EmtThreePhase.Connections.BusBar N0( v( start = {89814.62390204989, -44907.31195102492, -44907.31195102492}), i( start = {0.0, -0.0, -0.0}))
    annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
  ModPowerSystems.EmtThreePhase.Connections.BusBar N1( v( start = {89616.50290333139, -44819.45130275497, -44797.05160057639}), i( start = {0.0, -0.0, -0.0}))
    annotation (Placement(transformation(extent={{-10,-38},{10,-18}})));
  ModPowerSystems.EmtThreePhase.Connections.RxLine rxLine( length = 20, r = {{0.207, 0, 0}, {0, 0.207, 0}, {0, 0, 0.207}}, x = {{0.121, 0, 0}, {0, 0.121, 0}, {0, 0, 0.121}}, v( start = {198.12099871849236, -87.86064826995492, -110.26035044853737}), i( start = {37.02894077119424, -34.55425712418915, -2.4746836470050804}))
   annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={0,-14})));
  ModPowerSystems.EmtThreePhase.Loads.ZLoad zLoad1( Pnom = {1666666.6666666667, 1666666.6666666667, 1666666.6666666667}, Qnom = {833333.3333333334, 833333.3333333334, 833333.3333333334}, Vnom = 110000.0, v( start = {89616.50290333139, -44819.45130275497, -44797.05160057639}), i( start = {37.02894077119424, -34.55425712418915, -2.4746836470050804}))
   annotation(
    Placement(visible = true, transformation(origin = {0, -54}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(zLoad1.Plug1, N1.Plug1) 
   annotation(
    Line(points = {{0, -44}, {0, -28}}));
  connect(slack.Plug1, N0.Plug1) 
   annotation(
    Line(points = {{0, 10}, {0, 10}, {0, 0}}, color = {0, 0, 0}));
  connect(N0.Plug1, rxLine.Plug1) 
   annotation(
    Line(points = {{0, 0}, {0, 0}, {0, -4}}, color = {0, 0, 0}));
  connect(N1.Plug1, rxLine.Plug2) 
   annotation(
    Line(points = {{0, -28}, {0, -28}, {0, -24}, {-1.77636e-015, -24}}, color = {0, 0, 0}));
  annotation (Placement(transformation(extent={{-10,32},{10,12}})),
                Placement(transformation(extent={{-100,80},{-80,100}})),
              Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}})));
end Slack_RxLine_ZLoad_Init;
