within ModPowerSystems.Base.Interfaces.RealValue.SinglePhase;

partial model OnePortGroundedInit
  "Shell model for one-port models with one initialized electrical connector"
  extends ModPowerSystems.Base.Interfaces.RealValue.SinglePhase.OnePortGrounded(Pin1(v(start=Vnom*sqrt(2)/sqrt(3)), i(start=0)));
  
  parameter SI.Voltage Vnom = 110e3 "Nominal phase-to-phase RMS voltage";
end OnePortGroundedInit;
