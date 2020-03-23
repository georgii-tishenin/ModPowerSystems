within ModPowerSystems.Base.Interfaces.ComplexPhasor.ThreePhase;
partial model TwoPinInit
  "Shell model for models with two initialized electrical three-phase connectors"

  extends ModPowerSystems.Base.Interfaces.ComplexPhasor.ThreePhase.TwoPin(Plug1(Pins(v(re(start={Vnom/sqrt(3),Vnom/sqrt(3),Vnom/sqrt(3)}), im(start={0,0,0})), i(re(start={0,0,0}),im(start={0,0,0})))),Plug2(Pins(v(re(start={Vnom/sqrt(3),Vnom/sqrt(3),Vnom/sqrt(3)}), im(start={0,0,0})), i(re(start={0,0,0}),im(start={0,0,0})))));
  
  parameter SI.Voltage Vnom = 110e3 "Nominal phase-to-phase RMS voltage";
  
end TwoPinInit;
