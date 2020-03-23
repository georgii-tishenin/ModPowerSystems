within ModPowerSystems.Base.Interfaces.RealValue.ThreePhase;

partial model OnePortInit
  "Shell model for one-port models with two initialized electrical three-phase connectors"
  
  extends ModPowerSystems.Base.Interfaces.RealValue.ThreePhase.OnePort(Plug1(Pins(v(start={Vnom*sqrt(2)/sqrt(3),Vnom*sqrt(2)/sqrt(3),Vnom*sqrt(2)/sqrt(3)}), i(start={0,0,0}))),Plug2(Pins(v(start={Vnom*sqrt(2)/sqrt(3),Vnom*sqrt(2)/sqrt(3),Vnom*sqrt(2)/sqrt(3)}), i(start={0,0,0}))));
  
  parameter SI.Voltage Vnom = 110e3 "Nominal phase-to-phase RMS voltage";
end OnePortInit;
