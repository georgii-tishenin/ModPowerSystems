within ModPowerSystems.EmtThreePhase.Transformers;
model Transformer
  extends ModPowerSystems.Base.Interfaces.RealValue.ThreePhase.TwoPin;

  parameter SI.Voltage Vnom1 = 110e3 "primary voltage level";
  parameter SI.Voltage Vnom2 = 20e3 "secondary voltage level";
  parameter SI.Power Sr = 80e6 "rated apparent power";
  parameter Real URr = 0.31 "copper losses";
  parameter Real Ukr = 12.04 "short circuit voltage";

  final parameter Real ratio = Vnom1/Vnom2 "Tap Ratio";
  final parameter SI.Impedance Z = Ukr*Vnom1^2/(Sr*100);
  final parameter SI.Resistance R = URr*Vnom1^2/(Sr*100);
  final parameter SI.Reactance X = sqrt(Z^2-R^2);

  final parameter SI.Resistance[3,3] Rmat = {{R,0,0}, {0,R,0}, {0,0,R}};
  final parameter SI.Reactance[3,3] Xmat = {{X,0,0}, {0,X,0}, {0,0,X}};

  Connections.RxLine Imp(r=Rmat, x=Xmat, length=1) 
    annotation (Placement(transformation(extent={{-60,-20},{-20,20}})));
  IdealTransformer Tr(Vnom1=Vnom1, Vnom2=Vnom2, ratio=ratio)
    annotation (Placement(transformation(extent={{20,-20},{60,20}})));
equation

  connect(Tr.Plug2, Plug2)
    annotation (Line(points={{60,0},{100,0},{100,0}}, color={0,0,0}));
  connect(Tr.Plug1, Imp.Plug2)
    annotation (Line(points={{20,0},{0,0},{-20,0}}, color={0,0,0}));
  connect(Imp.Plug1, Plug1)
    annotation (Line(points={{-60,0},{-80,0},{-100,0}}, color={0,0,0}));
  annotation (
    Icon(
      coordinateSystem(
        preserveAspectRatio=false,
        extent={{-100,-100},{100,100}},
        grid={2,2}),
      graphics={
        Ellipse(extent={{-70,40},{12,-40}}, lineColor={0,0,0}),
        Ellipse(extent={{-12,40},{70,-40}}, lineColor={0,0,0}),
        Line(points={{70,0},{100,0}}, color={0,0,0}),
        Line(points={{-100,0},{-70,0}}, color={0,0,0}),
        Text(extent={{-60,80},{60,40}}, textString="%name"),
        Text(extent={{-10,-78},{-50,-38}}, textString="n"),
        Text(extent={{20,-76},{-20,-36}}, textString=":"),
        Text(extent={{50,-76},{10,-36}}, textString="1")}), Diagram(
        coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}})));
end Transformer;
