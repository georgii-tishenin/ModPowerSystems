within ModPowerSystems.EmtThreePhase.Transforms.Functions;

function ABCtoDQ_Park_Power

  input Real f_abc[3];
  input Real theta;
  output Real f_dq[2];
protected
  constant Real[2,3] K_mat = sqrt(2/3)*{{sin(theta),sin(theta-(2*pi)/3),sin(theta+(2*pi)/3)},{cos(theta),cos(theta-(2*pi)/3),cos(theta+(2*pi)/3)}};

algorithm
  f_dq[:] := K_mat*f_abc[:];


annotation(
    Documentation(info = "<html><head></head><body><h3><span style=\"font-weight: normal;\">Park transformation for</span></h3><div><font size=\"4\">* <b>power invariants</b></font></div><div><b><font size=\"4\">* q-axis aligned to a-axis<br></font></b><div><br></div></div><div><font size=\"4\">[1]&nbsp;</font><a href=\"https://de.mathworks.com/help/physmod/sps/ref/parktransform.html\" style=\"font-size: 12px;\">https://de.mathworks.com/help/physmod/sps/ref/parktransform.html</a></div></body></html>"));end ABCtoDQ_Park_Power;
