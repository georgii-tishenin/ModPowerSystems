within ModPowerSystems.DynPhasorThreePhase.Connections;
model PiLine
  extends
    ModPowerSystems.Base.Interfaces.ComplexPhasor.ThreePhase.TwoPin;

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

  SI.ComplexCurrent[3] i_rx;
  SI.Current[3] Irel = 'abs'(i1[:])/Imax*100;
equation

  v.re = L*der(i_rx.re) - X*i_rx.im + R*i_rx.re;
  v.im = L*der(i_rx.im) + X*i_rx.re + R*i_rx.im;
  i1.re = i_rx.re + C/2*der(v1.re) - B/2*v1.im + G/2*v1.re;
  i1.im = i_rx.im + C/2*der(v1.im) + B/2*v1.re + G/2*v1.im;
  -i2.re = - i_rx.re + C/2*der(v2.re) - B/2*v2.im + G/2*v2.re;
  -i2.im = - i_rx.im + C/2*der(v2.im) + B/2*v2.re + G/2*v2.im;
  
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
