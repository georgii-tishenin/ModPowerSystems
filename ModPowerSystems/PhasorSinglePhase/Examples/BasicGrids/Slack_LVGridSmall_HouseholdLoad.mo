within ModPowerSystems.PhasorSinglePhase.Examples.BasicGrids;
model Slack_LVGridSmall_HouseholdLoad

  final parameter String LoadProfileFolder = Modelica.Utilities.Files.loadResource("modelica://ModPowerSystems/../ExampleSimulationData/");
  final parameter String LoadProfileName = "loadH";

  inner ModPowerSystems.Base.System system
    annotation (Placement(transformation(extent={{-100,80},{-80,100}})));
  Slack.Slack slack(Vnom=400) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-80,70})));

Connections.BusBar N12(Vnom=400) annotation (Placement(visible=true,
        transformation(
        extent={{-8.0,-8.0},{8.0,8.0}},
        rotation=0,
        origin={30,58})));
Connections.BusBar N8(Vnom=400) annotation (Placement(visible=true,
        transformation(
        extent={{-8.0,-8.0},{8.0,8.0}},
        rotation=0,
        origin={30,30})));
Connections.BusBar N4(Vnom=400) annotation (Placement(visible=true,
        transformation(
        extent={{-8.0,-8.0},{8.0,8.0}},
        rotation=0,
        origin={-34,30})));
Connections.BusBar N6(Vnom=400) annotation (Placement(visible=true,
        transformation(
        extent={{-8.0,-8.0},{8.0,8.0}},
        rotation=0,
        origin={-6,-16})));
Connections.BusBar N5(Vnom=400) annotation (Placement(visible=true,
        transformation(
        extent={{-8.0,-8.0},{8.0,8.0}},
        rotation=0,
        origin={-34,6})));
Connections.BusBar N7(Vnom=400) annotation (Placement(visible=true,
        transformation(
        extent={{-8.0,-8.0},{8.0,8.0}},
        rotation=0,
        origin={-34,60})));
Connections.BusBar N3(Vnom=400) annotation (Placement(visible=true,
        transformation(
        extent={{-8.0,-8.0},{8.0,8.0}},
        rotation=0,
        origin={-80,-16})));
Connections.BusBar N2(Vnom=400) annotation (Placement(visible=true,
        transformation(
        extent={{-8.0,-8.0},{8.0,8.0}},
        rotation=0,
        origin={-80,6})));
Connections.BusBar N11(Vnom=400) annotation (Placement(visible=true,
        transformation(
        extent={{-8.0,-8.0},{8.0,8.0}},
        rotation=0,
        origin={58,-16})));
Connections.BusBar N10(Vnom=400) annotation (Placement(visible=true,
        transformation(
        extent={{-8.0,-8.0},{8.0,8.0}},
        rotation=0,
        origin={30,-16})));
Connections.BusBar N9(Vnom=400) annotation (Placement(visible=true,
        transformation(
        extent={{-8.0,-8.0},{8.0,8.0}},
        rotation=0,
        origin={30,8})));
Connections.BusBar N1(Vnom=400) annotation (Placement(visible=true,
        transformation(
        extent={{-8.0,-8.0},{8.0,8.0}},
        rotation=0,
        origin={-80,30})));
Households.HouseholdLoad HH3(
    Load_Qnom=329,
    Household_Vnom=400,
    Load_ProfileName=LoadProfileName,
    Load_Type=3,
    Load_Pnom=1000,
    Load_ProfileFileName=LoadProfileFolder + "LoadNormProfile_H.txt",
    Vnom=400) annotation (Placement(visible=true, transformation(
        extent={{-8.0,-8.0},{8.0,8.0}},
        rotation=0,
        origin={6,-25.8})));
Households.HouseholdLoad HH2(
    Load_Qnom=329,
    Household_Vnom=400,
    Load_ProfileName=LoadProfileName,
    Load_Type=3,
    Load_Pnom=1000,
    Load_ProfileFileName=LoadProfileFolder + "LoadNormProfile_H.txt",
    Vnom=400) annotation (Placement(visible=true, transformation(
        extent={{-8.0,-8.0},{8.0,8.0}},
        rotation=0,
        origin={-26,-3.8})));
Households.HouseholdLoad HH4(
    Load_Qnom=329,
    Household_Vnom=400,
    Load_ProfileName=LoadProfileName,
    Load_Type=3,
    Load_Pnom=1000,
    Load_ProfileFileName=LoadProfileFolder + "LoadNormProfile_H.txt",
    Vnom=400) annotation (Placement(visible=true, transformation(
        extent={{-8.0,-8.0},{8.0,8.0}},
        rotation=0,
        origin={-26,72.2})));
Households.HouseholdLoad HH1(
    Load_Qnom=329,
    Household_Vnom=400,
    Load_ProfileName=LoadProfileName,
    Load_Type=3,
    Load_Pnom=1000,
    Load_ProfileFileName=LoadProfileFolder + "LoadNormProfile_H.txt",
    Vnom=400) annotation (Placement(visible=true, transformation(
        extent={{-8.0,-8.0},{8.0,8.0}},
        rotation=0,
        origin={-72,-25.8})));
Households.HouseholdLoad HH6(
    Load_Qnom=329,
    Household_Vnom=400,
    Load_ProfileName=LoadProfileName,
    Load_Type=3,
    Load_Pnom=1000,
    Load_ProfileFileName=LoadProfileFolder + "LoadNormProfile_H.txt",
    Vnom=400) annotation (Placement(visible=true, transformation(
        extent={{-8.0,-8.0},{8.0,8.0}},
        rotation=0,
        origin={66,-25.8})));
Households.HouseholdLoad HH5(
    Load_Qnom=329,
    Household_Vnom=400,
    Load_ProfileName=LoadProfileName,
    Load_Type=3,
    Load_Pnom=1000,
    Load_ProfileFileName=LoadProfileFolder + "LoadNormProfile_H.txt",
    Vnom=400) annotation (Placement(visible=true, transformation(
        extent={{-8.0,-8.0},{8.0,8.0}},
        rotation=0,
        origin={38,-25.8})));
Connections.PiLine L8(
    Imax=142.0,
    Sr(displayUnit="W") = 1,
    g=0,
    length=0.010125,
    r=0.772,
    x=0.083,
    b=0.0000000000) annotation (Placement(visible=true, transformation(
        extent={{-8.0,-8.0},{8.0,8.0}},
        rotation=-90,
        origin={30,18})));
Connections.PiLine L11(
    Imax=270.0,
    Sr(displayUnit="W") = 1,
    g=0,
    length=0.021585,
    r=0.249,
    x=0.08,
    b=0.0000000000) annotation (Placement(visible=true, transformation(
        extent={{-8.0,-8.0},{8.0,8.0}},
        rotation=-90,
        origin={29,45})));
Connections.PiLine L7(
    Imax=270.0,
    Sr(displayUnit="W") = 1,
    g=0,
    length=0.015946,
    r=0.249,
    x=0.08,
    b=0.0000000000) annotation (Placement(visible=true, transformation(
        extent={{-8.0,-8.0},{8.0,8.0}},
        rotation=0,
        origin={2,29})));
Connections.PiLine L5(
    Imax=142.0,
    Sr(displayUnit="W") = 1,
    g=0,
    length=0.008092,
    r=0.772,
    x=0.083,
    b=0.0000000000) annotation (Placement(visible=true, transformation(
        extent={{-8.0,-8.0},{8.0,8.0}},
        rotation=-90,
        origin={-6,-4})));
Connections.PiLine L4(
    Imax=142.0,
    Sr(displayUnit="W") = 1,
    g=0,
    length=0.010336,
    r=0.772,
    x=0.083,
    b=0.0000000000) annotation (Placement(visible=true, transformation(
        extent={{-8.0,-8.0},{8.0,8.0}},
        rotation=-90,
        origin={-34,18})));
Connections.PiLine L6(
    Imax=142.0,
    Sr(displayUnit="W") = 1,
    g=0,
    length=0.005658,
    r=0.772,
    x=0.083,
    b=0.0000000000) annotation (Placement(visible=true, transformation(
        extent={{-8.0,-8.0},{8.0,8.0}},
        rotation=-90,
        origin={-35,45})));
Connections.PiLine L2(
    Imax=142.0,
    Sr(displayUnit="W") = 1,
    g=0,
    length=0.007129,
    r=0.772,
    x=0.083,
    b=0.0000000000) annotation (Placement(visible=true, transformation(
        extent={{-8.0,-8.0},{8.0,8.0}},
        rotation=-90,
        origin={-80,-6})));
Connections.PiLine L10(
    Imax=142.0,
    Sr(displayUnit="W") = 1,
    g=0,
    length=0.009339,
    r=0.772,
    x=0.083,
    b=0.0000000000) annotation (Placement(visible=true, transformation(
        extent={{-8.0,-8.0},{8.0,8.0}},
        rotation=-90,
        origin={58,-3})));
Connections.PiLine L9(
    Imax=142.0,
    Sr(displayUnit="W") = 1,
    g=0,
    length=0.007508,
    r=0.772,
    x=0.083,
    b=0.0000000000) annotation (Placement(visible=true, transformation(
        extent={{-8.0,-8.0},{8.0,8.0}},
        rotation=-90,
        origin={30,-4})));
Connections.PiLine L1(
    Imax=142.0,
    Sr(displayUnit="W") = 1,
    g=0,
    length=0.010873,
    r=0.772,
    x=0.083,
    b=0.0000000000) annotation (Placement(visible=true, transformation(
        extent={{-8.0,-8.0},{8.0,8.0}},
        rotation=-90,
        origin={-80,18})));
Connections.PiLine L3(
    Imax=270.0,
    Sr(displayUnit="W") = 1,
    g=0,
    length=0.01946,
    r=0.249,
    x=0.08,
    b=0.0000000000) annotation (Placement(visible=true, transformation(
        extent={{-8.0,-8.0},{8.0,8.0}},
        rotation=0,
        origin={-58,29})));
  Households.HouseholdLoad HH7(
    Load_Qnom=329,
    Household_Vnom=400,
    Load_ProfileName=LoadProfileName,
    Load_Type=3,
    Load_Pnom=1000,
    Load_ProfileFileName=LoadProfileFolder + "LoadNormProfile_H.txt",
    Vnom=400) annotation (Placement(transformation(extent={{30,64},{48,82}})));
equation
  connect(N8.Pin1, L7.Pin2) annotation (Line(
      points={{30,30},{10,30},{10,29}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(N8.Pin1, L8.Pin1) annotation (Line(
      points={{30,30},{30,26}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(N4.Pin1, L3.Pin2) annotation (Line(
      points={{-34,30},{-50,30},{-50,29}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(N6.Pin1, L5.Pin2) annotation (Line(
      points={{-6,-16},{-6,-12}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(N6.Pin1, HH3.Pin1) annotation (Line(
      points={{-6,-16},{-6,-30.6},{-2,-30.6}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(N5.Pin1, L4.Pin2) annotation (Line(
      points={{-34,6},{-34,10}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(N5.Pin1, HH2.Pin1) annotation (Line(
      points={{-34,6},{-34,-8.6}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(N7.Pin1, HH4.Pin1) annotation (Line(
      points={{-34,60},{-34,67.4}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(N3.Pin1, HH1.Pin1) annotation (Line(
      points={{-80,-16},{-80,-30.6}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(N2.Pin1, L1.Pin2) annotation (Line(
      points={{-80,6},{-80,10}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(N11.Pin1, HH6.Pin1) annotation (Line(
      points={{58,-16},{58,-30.6}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(N10.Pin1, L9.Pin2) annotation (Line(
      points={{30,-16},{30,-12}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(N10.Pin1, HH5.Pin1) annotation (Line(
      points={{30,-16},{30,-30.6}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(N9.Pin1, L9.Pin1) annotation (Line(
      points={{30,8},{30,4}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(N9.Pin1, L8.Pin2) annotation (Line(
      points={{30,8},{30,10}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(N1.Pin1, L1.Pin1) annotation (Line(
      points={{-80,30},{-80,26}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(slack.Pin1, N1.Pin1)
    annotation (Line(points={{-80,60},{-80,30}}, color={0,0,0}));
  connect(HH7.Pin1, N12.Pin1)
    annotation (Line(points={{30,67.6},{30,62},{30,58}}, color={0,0,0}));
  connect(L3.Pin1, N1.Pin1) annotation (Line(points={{-66,29},{-68,29},{-68,30},
          {-80,30}}, color={0,0,0}));
  connect(L2.Pin2, N3.Pin1)
    annotation (Line(points={{-80,-14},{-80,-14},{-80,-16}}, color={0,0,0}));
  connect(L2.Pin1, N2.Pin1)
    annotation (Line(points={{-80,2},{-80,6}}, color={0,0,0}));
  connect(L4.Pin1, N4.Pin1)
    annotation (Line(points={{-34,26},{-34,26},{-34,30}}, color={0,0,0}));
  connect(L6.Pin2, N4.Pin1) annotation (Line(points={{-35,37},{-35,33.5},{-34,33.5},
          {-34,30}}, color={0,0,0}));
  connect(L6.Pin1, N7.Pin1) annotation (Line(points={{-35,53},{-35,56.5},{-34,56.5},
          {-34,60}}, color={0,0,0}));
  connect(L7.Pin1, N4.Pin1) annotation (Line(points={{-6,29},{-18,29},{-18,30},{
          -34,30}}, color={0,0,0}));
  connect(N5.Pin1, L5.Pin1)
    annotation (Line(points={{-34,6},{-6,6},{-6,4}}, color={0,0,0}));
  connect(L10.Pin2, N11.Pin1)
    annotation (Line(points={{58,-11},{58,-11},{58,-16}}, color={0,0,0}));
  connect(L10.Pin1, N9.Pin1)
    annotation (Line(points={{58,5},{58,8},{30,8}}, color={0,0,0}));
  connect(L11.Pin2, N8.Pin1) annotation (Line(points={{29,37},{29,33.5},{30,33.5},
          {30,30}}, color={0,0,0}));
  connect(L11.Pin1, N12.Pin1) annotation (Line(points={{29,53},{29,54.5},{30,54.5},
          {30,58}}, color={0,0,0}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-60},
            {100,100}})),                                        Diagram(
        coordinateSystem(preserveAspectRatio=false, extent={{-100,-60},{100,100}})),
        experiment(
      StopTime=31536000,
      Interval=900,
      Tolerance=0.001,
      __Dymola_fixedstepsize=900,
      __Dymola_Algorithm="Dassl"),
    Documentation(info="<html>
<p>This model includes a household model with a heat pump installation. In particular, it requires component models from the libraries AixLib [1] and FastHVAC [2].</p>
<p>References:</p>
<p>[1] D. M&uuml;ller, M. Lauster, A. Constantin, M. Fuchs, and P. Remmen, &ldquo;AIXLIB &ndash; AN OPEN-SOURCE MODELICA LIBRARY WITHIN THE IEA-EBC ANNEX 60 FRAMEWORK&rdquo; </p>
<p>[2] S. Stinner, M. Schumacher, K. Finkbeiner, R. Streblow, and D. M&uuml;ller, &ldquo;FastHVAC - A library for fast composition and simulation of building energy systems&rdquo;</p>
</html>"));
end Slack_LVGridSmall_HouseholdLoad;
