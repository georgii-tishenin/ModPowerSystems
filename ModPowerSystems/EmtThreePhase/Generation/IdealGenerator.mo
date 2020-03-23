within ModPowerSystems.EmtThreePhase.Generation;

model IdealGenerator
  extends ModPowerSystems.Base.Interfaces.RealValue.ThreePhase.OnePortGrounded;

  parameter Modelica.SIunits.Voltage Vnom = 24e3 "Nominal RMS value of sinusoidal voltage";
  parameter SI.Angle phiV = 0 "Initial Voltage Angle";

  constant SI.Angle[3] phaseShift = (0:2)*2*pi/3 "phase shift";

  outer ModPowerSystems.Base.System system;

equation
     v[1] = sqrt(2)*Vnom*cos(system.theta + phiV - phaseShift[1]);
     v[2] = sqrt(2)*Vnom*cos(system.theta + phiV - phaseShift[2]);
     v[3] = sqrt(2)*Vnom*cos(system.theta + phiV - phaseShift[3]);

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
