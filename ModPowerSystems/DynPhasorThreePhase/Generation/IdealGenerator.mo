within ModPowerSystems.DynPhasorThreePhase.Generation;

model IdealGenerator
  extends
    ModPowerSystems.Base.Interfaces.ComplexPhasor.ThreePhase.OnePortGrounded;

  parameter Modelica.SIunits.Voltage Vnom = 24e3 "Nominal RMS value of sinusoidal voltage";
  parameter Modelica.SIunits.Angle phiV = 0 "Initial Voltage Angle";
  constant SI.Angle[3] phaseShift = (0:2)*2*pi/3 "phase shift";

  outer ModPowerSystems.Base.System system;

equation
   v[1] = Complex(Vnom*cos(phiV-phaseShift[1]), Vnom*sin(phiV-phaseShift[1]));
   v[2] = Complex(Vnom*cos(phiV-phaseShift[2]), Vnom*sin(phiV-phaseShift[2]));
   v[3] = Complex(Vnom*cos(phiV-phaseShift[3]), Vnom*sin(phiV-phaseShift[3]));

annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
        Ellipse(extent={{-60,58},{60,-62}}, lineColor={0,0,0}),
        Ellipse(extent={{-40,38},{40,-42}}, lineColor={0,0,0}),
        Text(
          extent={{-30,26},{30,-26}},
          lineColor={0,0,0},
          textString="SG"),
        Line(points={{0,94},{0,58}}, color={0,0,0})}),           Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end IdealGenerator;
