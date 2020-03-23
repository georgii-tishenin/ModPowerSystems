within ModPowerSystems.EmtThreePhase.Connections;

model PiLine
  extends ModPowerSystems.Base.Interfaces.RealValue.ThreePhase.TwoPin;

  parameter SI.Resistance[3,3] r = {{0.207,0,0}, {0,0.207,0}, {0,0,0.207}}
    "Series Resistance per km";
  parameter SI.Reactance[3,3] x = {{0.121,0,0}, {0,0.121,0}, {0,0,0.121}}
    "Series Reactance per km";
  parameter Real length = 20 "Length of line in km";
  parameter SI.Susceptance[3,3] b = {{40e-6,0,0}, {0,40e-6,0}, {0,0,40e-6}} "Shunt Susceptance per km";
  parameter SI.Conductance[3,3] g = {{0,0,0}, {0,0,0}, {0,0,0}} "Shunt Conductance per km";

  
  parameter SI.Current Imax=100 "maximal current";

  outer ModPowerSystems.Base.System system;

  // Calculation of line parameters
  SI.Resistance[3,3] R = r * length;
  SI.Reactance[3,3] X = x * length;
  SI.Inductance[3,3] L = X / system.omega;
  
  SI.Susceptance[3,3] B = b * length;
  SI.Conductance[3,3] G = g * length;
  SI.Capacitance[3,3] C = B / system.omega;

  SI.Current[3] i_rx;
  SI.Current[3] Irel = i1/Imax*100;
equation
    R*i_rx + L*der(i_rx) = v1 - v2;
    i1 = i_rx + G/2*v1 + C/2*der(v1);
    -i2 = -i_rx + G/2*v2 + C/2*der(v2);
  annotation (
    Icon(
      coordinateSystem(
        preserveAspectRatio=false,
        extent={{-100,-100},{100,100}},
        grid={2,2}),
      graphics={
        Line(
          points={{100,0},{60,0}},
          color={0,0,0}),
        Text(
          extent={{100,20},{-100,60}},
          textString="%name"),
        Rectangle(
          extent={{-60,20},{60,-20}},
          lineColor={0,0,0}),
        Line(
          points={{-60,0},{-100,0}},
          color={0,0,0})}));

end PiLine;
