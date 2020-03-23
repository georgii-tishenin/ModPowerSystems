within ModPowerSystems.DynPhasorSinglePhase.Examples.BasicGrids;
model SynGen_Park_NoFault_UnitTest_3rdOrderModel_Slack

  ModPowerSystems.DynPhasorSinglePhase.Generation.SynchronousGenerator_3rdOrderModel
    synchronousGenerator_Park
    annotation (Placement(transformation(extent={{-10,-20},{10,0}})));
  Modelica.Blocks.Sources.Constant Pm(k=300e6)
    annotation (Placement(transformation(extent={{-60,-12},{-50,-2}})));
  Slack.Slack slack(
    Vnom=24e3,
    phiV(displayUnit = "rad")= -Modelica.Constants.pi/2) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={0,20})));
  inner Base.System system(freq_nom=60)
    annotation (Placement(transformation(extent={{-70,54},{-50,74}})));
  Generation.Controllers.ExciterSteadyState exciterSteadyState
    annotation (Placement(transformation(extent={{-32,-30},{-22,-18}})));
  Modelica.Blocks.Sources.Constant Q(k=0)
    annotation (Placement(transformation(extent={{-60,-32},{-50,-22}})));
equation
  connect(Pm.y, synchronousGenerator_Park.P_m_in) annotation (Line(points={{
          -49.5,-7},{-17.75,-7},{-17.75,-8},{-10.3,-8}}, color={0,0,127}));
  connect(synchronousGenerator_Park.Pin1, slack.Pin1)
    annotation (Line(points={{0,0},{0,0},{0,10}}, color={0,0,0}));
  connect(exciterSteadyState.vfd, synchronousGenerator_Park.v_fd_in)
    annotation (Line(points={{-21,-24},{-18,-24},{-18,-16},{-18,-12},{-10.3,-12}},
        color={0,0,127}));
  connect(Pm.y, exciterSteadyState.P) annotation (Line(points={{-49.5,-7},{-40,
          -7},{-40,-21.6},{-33,-21.6}}, color={0,0,127}));
  connect(Q.y, exciterSteadyState.Q) annotation (Line(points={{-49.5,-27},{
          -41.75,-27},{-41.75,-26.4},{-33,-26.4}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end SynGen_Park_NoFault_UnitTest_3rdOrderModel_Slack;
