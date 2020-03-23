within ModPowerSystems.DynPhasorSinglePhase.Examples.BasicGrids;
model SynGen_Park_NoFault_UnitTest_3rdOrderModel_Slack_Step

  ModPowerSystems.DynPhasorSinglePhase.Generation.SynchronousGenerator_3rdOrderModel
    synchronousGenerator_Park
    annotation (Placement(transformation(extent={{-10,-20},{10,0}})));
  Slack.Slack slack(
    Vnom=24e3,
    phiV(displayUnit = "rad")= -Modelica.Constants.pi/2) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={0,20})));
  inner Base.System system(freq_nom=60)
    annotation (Placement(transformation(extent={{-70,54},{-50,74}})));
  Generation.Controllers.ExciterSteadyState exciterSteadyState
    annotation (Placement(transformation(extent={{-30,-38},{-20,-26}})));
  Modelica.Blocks.Sources.Constant Q0(k=0)
    annotation (Placement(transformation(extent={{-62,-48},{-52,-38}})));
  Modelica.Blocks.Sources.Step Pm(
    height=30e6,
    offset=300e6,
    startTime=2)
    annotation (Placement(transformation(extent={{-62,-12},{-52,-2}})));
  Modelica.Blocks.Sources.Constant P0(k=300e6)
    annotation (Placement(transformation(extent={{-62,-32},{-52,-22}})));
equation
  connect(synchronousGenerator_Park.Pin1, slack.Pin1)
    annotation (Line(points={{0,0},{0,0},{0,10}}, color={0,0,0}));
  connect(exciterSteadyState.vfd, synchronousGenerator_Park.v_fd_in)
    annotation (Line(points={{-19,-32},{-16,-32},{-16,-14},{-10.3,-14},{-10.3,
          -12}}, color={0,0,127}));
  connect(Q0.y, exciterSteadyState.Q) annotation (Line(points={{-51.5,-43},{-46,
          -43},{-46,-34.4},{-31,-34.4}}, color={0,0,127}));
  connect(Pm.y, synchronousGenerator_Park.P_m_in) annotation (Line(points={{-51.5,
          -7},{-29.75,-7},{-29.75,-8},{-10.3,-8}}, color={0,0,127}));
  connect(P0.y, exciterSteadyState.P) annotation (Line(points={{-51.5,-27},{-46,
          -27},{-46,-29.6},{-31,-29.6}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)),
    experiment(
      StopTime=30,
      Interval=0.001,
      __Dymola_fixedstepsize=1e-006,
      __Dymola_Algorithm="Dassl"));
end SynGen_Park_NoFault_UnitTest_3rdOrderModel_Slack_Step;
