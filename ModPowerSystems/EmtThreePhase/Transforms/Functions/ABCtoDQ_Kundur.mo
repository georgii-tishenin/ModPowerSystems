within ModPowerSystems.EmtThreePhase.Transforms.Functions;
function ABCtoDQ_Kundur "Amplitude invariant transform and leading second axis"
  input Real f_abc[3];
  input Real theta;
  output Real f_dq[2];

protected
  constant Real[2,3] K_mat = {{2/3*cos(theta),2/3*cos(theta-2*pi/3),2/3*cos(theta+2*pi/3)},{-2/3*sin(theta),-2/3*sin(theta-2*pi/3),-2/3*sin(theta+2*pi/3)}};

algorithm
  f_dq[:] := K_mat*f_abc[:];

  annotation (Documentation(info="<html>
<p>Implemented according to [1].</p>
<p>References:</p>
<p>[1] P. Kundur, N. J. Balu, and M. G. Lauby, Power system stability and control. New York; London: McGraw-Hill, 1994. </p>
</html>"));
end ABCtoDQ_Kundur;
