within ModPowerSystems.DynPhasorThreePhase.Loads;
model ZLoad "Constant impedance load"
  extends
    ModPowerSystems.Base.Interfaces.ComplexPhasor.ThreePhase.OnePortGrounded;

  parameter SI.Voltage Vnom = 110e3 "Nominal phase-to-phase RMS voltage";
  parameter SI.ActivePower[3] Pnom = {0.5e6,0.5e6,0.5e6} "active power for each phase";
  parameter SI.ReactivePower[3] Qnom = {0.5e6,0.5e6,0.5e6} "reactive power for each phase";
  final parameter Complex[3] Z={((Vnom/sqrt(3))^2*Pnom[1]/((Pnom[1])^2+(Qnom[1])^2)+j*(Vnom/sqrt(3))^2*Qnom[1]/((Pnom[1])^2+(Qnom[1])^2)),((Vnom/sqrt(3))^2*Pnom[2]/((Pnom[2])^2+(Qnom[2])^2) + j*(Vnom/sqrt(3))^2*Qnom[2]/((Pnom[2])^2+(Qnom[2])^2)),((Vnom/sqrt(3))^2*Pnom[3]/((Pnom[3])^2+(Qnom[3])^2) + j*(Vnom/sqrt(3))^2*Qnom[3]/((Pnom[3])^2+(Qnom[3])^2))};
  outer ModPowerSystems.Base.System system;


equation
  // phase 1
  v[1].re = Z[1].im/system.omega*der(i[1].re) - Z[1].im*i[1].im + Z[1].re*i[1].re;
  v[1].im = Z[1].im/system.omega*der(i[1].im) + Z[1].im*i[1].re + Z[1].re*i[1].im;
  
  // phase 2
  v[2].re = Z[2].im/system.omega*der(i[2].re) - Z[2].im*i[2].im + Z[2].re*i[2].re;
  v[2].im = Z[2].im/system.omega*der(i[2].im) + Z[2].im*i[2].re + Z[2].re*i[2].im;
  
  // phase 3
  v[3].re = Z[3].im/system.omega*der(i[3].re) - Z[3].im*i[3].im + Z[3].re*i[3].re;
  v[3].im = Z[3].im/system.omega*der(i[3].im) + Z[3].im*i[3].re + Z[3].re*i[3].im;
  
  annotation (
    Placement(
      transformation(
        extent={{-10,110},{10,90}})),
   Icon(
     coordinateSystem(
        preserveAspectRatio=false,
        extent={{-100,-100},{100,100}},
        grid={2,2}),
      graphics={
        Line(
          points={{0,100},{0,20}},
          color={0,0,0}),
        Polygon(
          points={{0,-40},{-20,20},{20,20}},
          lineColor={0,0,0},
          fillPattern=FillPattern.Sphere,
          fillColor={0,0,0}),
        Text(
          extent={{100,-100},{-100,-60}},
          textString = "%name")}));
end ZLoad;
