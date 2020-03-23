within ModPowerSystems.Base.Interfaces.RealValue.SinglePhase;

partial model OnePortInit
  "Shell model for one-port models with two initialized electrical connectors"
  extends ModPowerSystems.Base.Interfaces.RealValue.SinglePhase.OnePort(Pin1(v(start=Vnom*sqrt(2)/sqrt(3)), i(start=0)),Pin2(v(start=Vnom*sqrt(2)/sqrt(3)), i(start=0)));
  
  parameter SI.Voltage Vnom = 110e3 "Nominal phase-to-phase RMS voltage";
end OnePortInit;
