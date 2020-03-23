within ModPowerSystems.EmtThreePhase.Loads;

model RLoad "Resistive Load"
  extends ModPowerSystems.Base.Interfaces.RealValue.ThreePhase.OnePortGroundedInit;
  
  parameter SI.Resistance[3] R = {1037.8378,1037.8378,1037.8378};
  
equation
    v = R.*i;

  annotation (
    Placement(
      transformation(
        extent={{-10,110},{10,90}})),
   Icon(
     coordinateSystem(
        preserveAspectRatio=false, initialScale = 0.1),
      graphics={Line(points = {{0, 100}, {0, 20}}), Polygon(fillPattern = FillPattern.Sphere, points = {{0, -40}, {-20, 20}, {20, 20}, {0, -40}}), Text(extent = {{-100, -100}, {100, -60}}, textString = "%name")}));
end RLoad;
