within ModPowerSystems.PhasorSinglePhase.Loads;
model PQLoadInput "Controlled constant power load"
  extends
    ModPowerSystems.Base.Interfaces.ComplexPhasor.SinglePhase.OnePortGroundedInit;

  parameter Boolean enableOutputPload = false  annotation (Dialog(group="Data in/out"),choices(checkBox=true));
  parameter Boolean enableInputPload = false  annotation (Dialog(group="Data in/out"),choices(checkBox=true));
  parameter Boolean enableInputQload = false  annotation (Dialog(group="Data in/out"),choices(checkBox=true));

  outer ModPowerSystems.Base.System system;

  Modelica.Blocks.Interfaces.RealOutput P_loadOut=Pnom if enableOutputPload
    annotation (Placement(transformation(extent={{60,-20},{100,20}}),
        iconTransformation(extent={{46,-20},{76,10}})));

  Modelica.Blocks.Interfaces.RealInput P_loadIn if enableInputPload
    annotation (Placement(transformation(extent={{-80,-10},{-40,30}})));
  Modelica.Blocks.Interfaces.RealInput Q_loadIn if enableInputQload
    annotation (Placement(transformation(extent={{-80,-50},{-40,-10}})));

  Modelica.Blocks.Interfaces.RealOutput P_load "support output to allow for conditional input pin";
  Modelica.Blocks.Interfaces.RealOutput Q_load "support output to allow for conditional input pin";
equation
    if enableInputPload then
      P_load/3 = real(v*conj(i));
    else
      0 = real(v*conj(i));
    end if;

    if enableInputQload then
      Q_load/3 = imag(v*conj(i));
    else
      0 = imag(v*conj(i));
    end if;

    connect(P_load,P_loadIn);
    connect(Q_load,Q_loadIn);
  annotation (
  Documentation(info="<html>
<p>
This load model should not be used in transient mode yet.
</p>

</html>"),
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
end PQLoadInput;
