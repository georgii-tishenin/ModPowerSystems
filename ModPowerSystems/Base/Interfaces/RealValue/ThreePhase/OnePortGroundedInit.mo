within ModPowerSystems.Base.Interfaces.RealValue.ThreePhase;

partial model OnePortGroundedInit
  "Shell model for one-port models with one initialized electrical three-phase connector"
  
  extends ModPowerSystems.Base.Interfaces.RealValue.ThreePhase.OnePortGrounded(Plug1(Pins(v(start={Vnom*sqrt(2)/sqrt(3),Vnom*sqrt(2)/sqrt(3),Vnom*sqrt(2)/sqrt(3)}), i(start={0,0,0}))));
  
  parameter SI.Voltage Vnom = 110e3 "Nominal phase-to-phase RMS voltage";

end OnePortGroundedInit;
