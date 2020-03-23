within ModPowerSystems.EmtThreePhase.Examples.BasicCircuits;

model VoltageSource_RL_Init
  inner ModPowerSystems.Base.System system
    annotation (Placement(transformation(extent={{-100,80},{-80,100}})));
  ModPowerSystems.EmtThreePhase.Basics.VoltageAC voltageSource( v( start = {10.0, -4.999999999999998, -4.999999999999998}), i( start = {-0.9199966835037537, 2.9630324412069196, -2.043035757703166}))
    annotation (Placement(transformation(extent={{-42,6},{-22,26}})));
  ModPowerSystems.EmtThreePhase.Basics.Resistor resistor( v( start = {0.9199966835037515, -2.9630324412069187, 2.0430357577031675}), i( start = {0.9199966835037515, -2.9630324412069187, 2.0430357577031675}))
   annotation (
      Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=0,
        origin={-4,16})));
  ModPowerSystems.EmtThreePhase.Basics.Ground ground( v( start = {0.0, -0.0, -0.0}), i( start = {0.9199966835037515, -2.9630324412069187, 2.0430357577031675}))
    annotation (Placement(transformation(extent={{-62,-36},{-42,-16}})));
  ModPowerSystems.EmtThreePhase.Basics.Inductor inductor( L = {{0.01, 0, 0}, {0, 0.01, 0}, {0, 0, 0.01}}, v( start = {9.080003316496247, -2.0369675587930787, -7.043035757703166}), i( start = {0.9199966835037515, -2.9630324412069187, 2.0430357577031675}))
   annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={14,0})));
  ModPowerSystems.EmtThreePhase.Basics.Ground ground3( v( start = {0.0, -0.0, -0.0}), i( start = {-0.9199966835037537, 2.9630324412069196, -2.043035757703166}))
    annotation (Placement(transformation(extent={{4,-38},{24,-18}})));
equation
  connect(resistor.Plug1, inductor.Plug2)
    annotation (Line(points={{6,16},{14,16},{14,10}}, color={0,0,0}));
  connect(ground.Plug1, voltageSource.Plug1) 
   annotation (Line(points={{-52,-16},{
          -52,-16},{-52,16},{-42,16}}, color={0,0,0}));
  connect(inductor.Plug1, ground3.Plug1)
    annotation (Line(points={{14,-10},{14,-14},{14,-18}}, color={0,0,0}));
  connect(voltageSource.Plug2, resistor.Plug2)
    annotation (Line(points={{-22,16},{-18,16},{-14,16}}, color={0,0,0}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end VoltageSource_RL_Init;
