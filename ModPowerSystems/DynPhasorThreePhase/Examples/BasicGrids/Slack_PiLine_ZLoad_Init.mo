within ModPowerSystems.DynPhasorThreePhase.Examples.BasicGrids;
model Slack_PiLine_ZLoad_Init
inner ModPowerSystems.Base.System system
    annotation (Placement(transformation(extent={{-100,80},{-80,100}})));
  ModPowerSystems.DynPhasorThreePhase.Slack.Slack slack(Vnom = 110e3, phiV = 0) 
    annotation (Placement(transformation(extent={{-10,30},{10,10}})));
  ModPowerSystems.DynPhasorThreePhase.Connections.BusBar N0( v( re( start = {63508.529610858845, -31754.264805429408, -31754.264805429408}), im( start = {0.0, -55000.000000000015, 55000.000000000015})))
    annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
  ModPowerSystems.DynPhasorThreePhase.Connections.BusBar N1( v( re( start = {63429.497596117304, -31813.537332965832, -31615.960263151443}), im( start = {-114.07117444304384, -54874.520680300055, 54988.59185474309})))
    annotation (Placement(transformation(extent={{-10,-38},{10,-18}})));
  ModPowerSystems.DynPhasorThreePhase.Connections.PiLine piLine( b = {{4e-05, 0, 0}, {0, 4e-05, 0}, {0, 0, 4e-05}}, g = {{0.0, 0, 0}, {0, 0.0, 0}, {0, 0, 0.0}}, length = 20, r = {{0.207, 0, 0}, {0, 0.207, 0}, {0, 0, 0.207}}, x = {{0.121, 0, 0}, {0, 0.121, 0}, {0, 0, 0.121}}, i_rx( re( start = {26.232596242048345, -2.533992419250312, -23.698603822798024}), im( start = {12.219394091132092, -28.827791798400114, 16.608397707268026})))
   annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={0,-14})));
  ModPowerSystems.DynPhasorThreePhase.Loads.ZLoad zLoad1( Pnom = {1666666.6666666667, 1666666.6666666667, 1666666.6666666667}, Qnom = {833333.3333333334, 833333.3333333334, 833333.3333333334}, Vnom = 110000.0, i( re( start = {26.186967772271124, -24.483800691370337, -1.7031670809007802}), im( start = {-13.152404947314832, -16.102376865213774, 29.254781812528602})))
   annotation(
    Placement(visible = true, transformation(origin = {0, -54}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(zLoad1.Plug1, N1.Plug1) 
   annotation(
    Line(points = {{0, -44}, {0, -28}}));
  connect(slack.Plug1, N0.Plug1) 
   annotation(
    Line(points = {{0, 10}, {0, 10}, {0, 0}}, color = {0, 0, 0}));
  connect(N0.Plug1, piLine.Plug1) 
   annotation(
    Line(points = {{0, 0}, {0, 0}, {0, -4}}, color = {0, 0, 0}));
  connect(N1.Plug1, piLine.Plug2) 
   annotation(
    Line(points = {{0, -28}, {0, -28}, {0, -24}, {-1.77636e-015, -24}}, color = {0, 0, 0}));
  annotation (Placement(transformation(extent={{-10,32},{10,12}})),
                Placement(transformation(extent={{-100,80},{-80,100}})),
              Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}})));
end Slack_PiLine_ZLoad_Init;