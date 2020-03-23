within ModPowerSystems.Base.Interfaces.ComplexPhasor.ThreePhase;
partial model OnePortInit 
  "Shell model for one-port models with one initialized electrical three-phase connector"
  
  extends ModPowerSystems.Base.Interfaces.ComplexPhasor.ThreePhase.OnePort(Plug1(Pins(v(re(start={Vnom/sqrt(3),Vnom/sqrt(3),Vnom/sqrt(3)}), im(start={0,0,0})), i(re(start={0,0,0}),im(start={0,0,0})))),Plug2(Pins(v(re(start={Vnom/sqrt(3),Vnom/sqrt(3),Vnom/sqrt(3)}), im(start={0,0,0})), i(re(start={0,0,0}),im(start={0,0,0})))));
  
  parameter SI.Voltage Vnom = 110e3 "Nominal phase-to-phase RMS voltage";
  
end OnePortInit;
