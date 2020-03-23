within ModPowerSystems.DynPhasorThreePhase.Examples.BasicGrids;
model Slack_Tra_ZLoad_Init
  inner ModPowerSystems.Base.System system
    annotation (Placement(transformation(extent={{-100,80},{-80,100}})));
  ModPowerSystems.DynPhasorThreePhase.Slack.Slack slack
    annotation (Placement(transformation(extent={{-10,28},{10,8}})));
  ModPowerSystems.DynPhasorThreePhase.Connections.BusBar N0( v( re( start = {63508.529610858845, -31754.264805429408, -31754.264805429408}), im( start = {0.0, -55000.000000000015, 55000.000000000015})))
    annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
  ModPowerSystems.DynPhasorThreePhase.Transformers.Transformer transformer( Vnom1 = 110000.0, Vnom2 = 20000.0, URr = 0.63, Ukr = 12.04, Sr = 10000000.0, Imp( i( re( start = {24.881105859014998, -22.525426231465794, -2.3556796275491956}), im( start = {-11.645008631257785, -15.725165432527938, 27.37017406378572}))))
   annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={0,-14})));
  ModPowerSystems.DynPhasorThreePhase.Connections.BusBar N1( Vnom = 20000.0, v( re( start = {11204.489738851695, -6158.240022172431, -5046.24971667926}), im( start = {-642.0079022127379, -9382.368799181273, 10024.376701394009})))
    annotation (Placement(transformation(extent={{-10,-40},{10,-20}})));
  ModPowerSystems.DynPhasorThreePhase.Loads.ZLoad zLoad( Vnom = 20000.0, Pnom = {1666666.6666666667, 1666666.6666666667, 1666666.6666666667}, Qnom = {666666.6666666666, 666666.6666666666, 666666.6666666666}, i( re( start = {136.84608222458246, -123.88984427306171, -12.956237951520702}), im( start = {-64.04754747191768, -86.48840987890372, 150.53595735082138})))
   annotation (Placement(transformation(extent={{-10,-54},{10,-34}})));
equation
  connect(slack.Plug1, N0.Plug1)
    annotation (Line(points={{0,8},{0,4},{0,0}},    color={0,0,0}));
  connect(transformer.Plug1, N0.Plug1)
    annotation (Line(points={{0,-4},{0,0}},  color={0,0,0}));
  connect(transformer.Plug2, N1.Plug1)
    annotation (Line(points={{0,-24},{0,-30}},
                                             color={0,0,0}));
  connect(N1.Plug1, zLoad.Plug1)
    annotation (Line(points={{0,-30},{0,-34}},
                                             color={0,0,0}));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}})));
end Slack_Tra_ZLoad_Init;