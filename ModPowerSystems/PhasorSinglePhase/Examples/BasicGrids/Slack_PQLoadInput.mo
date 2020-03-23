within ModPowerSystems.PhasorSinglePhase.Examples.BasicGrids;
model Slack_PQLoadInput
  import ModPowerSystems;

  inner ModPowerSystems.Base.System system
    annotation (Placement(transformation(extent={{-100,80},{-80,100}})));
  ModPowerSystems.PhasorSinglePhase.Slack.Slack slack(Vnom=20e3)
    annotation (Placement(transformation(extent={{-10,30},{10,10}})));
  ModPowerSystems.PhasorSinglePhase.Connections.BusBar N0(Vnom=20e3)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
  Loads.PQLoadInput pQLoad(
    Vnom=20e3,
    enableInputPload=true,
    enableInputQload=true)
              annotation (Placement(transformation(extent={{-10,-24},{10,-4}})));
  Modelica.Blocks.Sources.Constant Pload(k=5000)
    annotation (Placement(transformation(extent={{-56,-22},{-38,-4}})));
  Modelica.Blocks.Sources.Constant Qload(k=1000)
    annotation (Placement(transformation(extent={{-56,-54},{-38,-36}})));
equation
  connect(slack.Pin1, N0.Pin1)
    annotation (Line(points={{0,10},{0,0}},   color={0,0,0}));
  connect(N0.Pin1, pQLoad.Pin1)
    annotation (Line(points={{0,0},{0,-4}},   color={0,0,0}));
  connect(Pload.y, pQLoad.P_loadIn) annotation (Line(points={{-37.1,-13},{-20,
          -13},{-6,-13}},      color={0,0,127}));
  connect(Qload.y, pQLoad.Q_loadIn) annotation (Line(points={{-37.1,-45},{-20,
          -45},{-20,-17},{-6,-17}}, color={0,0,127}));
  annotation(Diagram(coordinateSystem(preserveAspectRatio=false,   extent={{-100,
            -100},{100,100}})));
end Slack_PQLoadInput;
