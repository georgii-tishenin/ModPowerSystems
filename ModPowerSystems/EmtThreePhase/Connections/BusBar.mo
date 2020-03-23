within ModPowerSystems.EmtThreePhase.Connections;
model BusBar
  extends ModPowerSystems.Base.Interfaces.RealValue.ThreePhase.OnePortGrounded;

  parameter SI.Voltage Vnom = 110e3 "Nominal phase-to-phase voltage";
  Real Vrel[3] = vpp[:]/Vnom "voltage relative to nominal voltage";

equation
  i = zeros(3);
  
  annotation (
    Icon(
      coordinateSystem(
        preserveAspectRatio=false,
        extent={{-100,0},{100,200}},
        grid={2,2}),
      graphics={
        Text(
          extent={{0,120},{-100,160}},
          textString = "%name"),
        Rectangle(
          extent={{-80,110},{80,90}},
          lineColor={0,0,0},
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid)}), Diagram(coordinateSystem(extent={{-100,
            0},{100,200}})));
 
end BusBar;
