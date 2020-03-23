within ModPowerSystems.EmtThreePhase.Transforms.Functions;

function ABCtoDQ0_Kundur "Amplitude invariant transform and leading second axis"
  input Real f_abc[3];
  input Real theta;
  output Real f_dq0[3];
  
protected
  constant Real[3, 3] K_mat = {{2 / 3 * cos(theta), 2 / 3 * cos(theta - 2 * pi / 3), 2 / 3 * cos(theta + 2 * pi / 3)}, {-2 / 3 * sin(theta), -2 / 3 * sin(theta - 2 * pi / 3), -2 / 3 * sin(theta + 2 * pi / 3)}, {1 / 3, 1 / 3, 1 / 3}};

algorithm
  f_dq0[:] := K_mat * f_abc[:];
 annotation (Documentation(info="<html>
<p>Implemented according to [1].</p>
<p>References:</p>
<p>[1] P. Kundur, N. J. Balu, and M. G. Lauby, Power system stability and control. New York; London: McGraw-Hill, 1994. </p>
</html>"));
end ABCtoDQ0_Kundur;
