within ModPowerSystems.EmtThreePhase.Examples.BasicGrids;

  model SynGen_Park_UnitTest_FullModel
    Generation.SynchronousGenerator_FullModel synchronousGenerator_Park annotation(
      Placement(transformation(extent = {{-10, -20}, {10, 0}})));
    Modelica.Blocks.Sources.Constant const(k = 7.0821) annotation(
      Placement(transformation(extent = {{-36, -20}, {-26, -10}})));
    Modelica.Blocks.Sources.Constant const1(k = 5.5558e5) annotation(
      Placement(transformation(extent = {{-36, -2}, {-26, 8}})));
    ModPowerSystems.EmtThreePhase.Basics.Resistor resistor1(R = {{1037.8378, 0, 0}, {0, 1037.8378, 0}, {0, 0, 1037.8378}}) annotation(
      Placement(visible = true, transformation(origin = {20, -10}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
    ModPowerSystems.EmtThreePhase.Basics.Ground ground1 annotation(
      Placement(visible = true, transformation(origin = {20, -32}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
    connect(synchronousGenerator_Park.Plug1, resistor1.Plug1) annotation(
      Line(points = {{0, 0}, {20, 0}, {20, 0}, {20, 0}}));
    connect(resistor1.Plug2, ground1.Plug1) annotation(
      Line(points = {{20, -20}, {20, -22}}));
    connect(const1.y, synchronousGenerator_Park.P_m_in) annotation(
      Line(points = {{-25.5, 3}, {-17.75, 3}, {-17.75, -8}, {-10.3, -8}}, color = {0, 0, 127}));
    connect(const.y, synchronousGenerator_Park.v_fd_in) annotation(
      Line(points = {{-25.5, -15}, {-17.75, -15}, {-17.75, -12}, {-10.3, -12}}, color = {0, 0, 127}));
    annotation(
      Icon(coordinateSystem(preserveAspectRatio = false)),
      Diagram(coordinateSystem(preserveAspectRatio = false)),
      experiment(StopTime = 3, Interval = 5e-05, StartTime = 0, Tolerance = 1e-06));
  end SynGen_Park_UnitTest_FullModel;