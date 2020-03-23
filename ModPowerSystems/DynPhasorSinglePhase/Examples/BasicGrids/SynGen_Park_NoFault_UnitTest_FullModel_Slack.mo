within ModPowerSystems.DynPhasorSinglePhase.Examples.BasicGrids;
model SynGen_Park_NoFault_UnitTest_FullModel_Slack

  Generation.SynchronousGenerator_FullModel synchronousGenerator_Park
    annotation (Placement(transformation(extent={{-10,-20},{10,0}})));
  Modelica.Blocks.Sources.Constant const1(k=300e6)
    annotation (Placement(transformation(extent={{-36,-12},{-26,-2}})));
  inner Base.System system(freq_nom=60)
    annotation (Placement(transformation(extent={{-80,44},{-60,64}})));
  Slack.Slack slack(
    Vnom=24e3,
    phiV(displayUnit = "rad")= -Modelica.Constants.pi/2) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={0,22})));
equation
  connect(const1.y, synchronousGenerator_Park.P_m_in) annotation (Line(points={{-25.5,
          -7},{-17.75,-7},{-17.75,-8},{-10.3,-8}},      color={0,0,127}));
  connect(slack.Pin1, synchronousGenerator_Park.Pin1)
    annotation (Line(points={{0,12},{0,6},{0,0}}, color={0,0,0}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)),
    experiment(
      StopTime=3,
      Interval=0.001,
      __Dymola_fixedstepsize=1e-006,
      __Dymola_Algorithm="Dassl"));
end SynGen_Park_NoFault_UnitTest_FullModel_Slack;
