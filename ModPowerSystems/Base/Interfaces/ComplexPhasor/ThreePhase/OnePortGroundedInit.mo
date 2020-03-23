within ModPowerSystems.Base.Interfaces.ComplexPhasor.ThreePhase;
partial model OnePortGroundedInit
  "Shell model for one-port models with one initialized electrical three-phase connector"
  
  extends ModPowerSystems.Base.Interfaces.ComplexPhasor.ThreePhase.OnePortGrounded(Plug1(Pins(v(re(start={Vnom/sqrt(3),Vnom/sqrt(3),Vnom/sqrt(3)}), im(start={0,0,0})), i(re(start={0,0,0}),im(start={0,0,0})))));
  
  parameter SI.Voltage Vnom = 110e3 "Nominal phase-to-phase RMS voltage";
  
  annotation (
    Icon(
      coordinateSystem(
        preserveAspectRatio=false,
        extent={{-100,-100},{100,100}})),
    Documentation(info="<html>
      <p>The model represents a one port where the second pin is connected to the ground:</p>
      <p><img src=\"modelica://ModPowerSystems/Resources/Images/OnePortGrounded.png\"/></p>
      <p>Note that, due to the fact that the second pin does not provide any additional information (voltage is zero and current the same as flowing into the port), it is not included in the model.</p>
      </html>"));
end OnePortGroundedInit;
