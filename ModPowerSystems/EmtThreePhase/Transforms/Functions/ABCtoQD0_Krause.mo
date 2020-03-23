within ModPowerSystems.EmtThreePhase.Transforms.Functions;
function ABCtoQD0_Krause "Amplitude invariant transform and lagging second axis"
  input Real f_abc[3];
  input Real theta;
  output Real f_qd0[3];

protected
          constant Real[3,3] K_mat = {{2/3*cos(theta),2/3*cos(theta-2*pi/3),2/3*cos(theta+2*pi/3)},{-2/3*sin(theta),-2/3*sin(theta-2*pi/3),-2/3*sin(theta+2*pi/3)},{1/3,1/3,1/3}};

algorithm
  f_qd0[:] := K_mat*f_abc[:];

annotation(
    Documentation(info = "<html><head></head><body><p>Implemented according to [1].</p><p>References:</p><p>[1] P. C. Krause, O. Wasynczuk, S. D. Sudhoff, and S. Pekarek, Analysis of electric machinery and drive systems, 3rd ed. Hoboken, N.J.: Wiley, 2013. </p></body></html>"));end ABCtoQD0_Krause;
