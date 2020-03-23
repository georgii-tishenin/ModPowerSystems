within ModPowerSystems.EmtThreePhase.Transforms.Functions;

function ABCtoDQ_Park

  input Real f_abc[3];
  input Real theta;
  output Real f_dq[2];
protected
  constant Real[2,3] K_mat = (2/3)*{{sin(theta),sin(theta-(2*pi)/3),sin(theta+(2*pi)/3)},{cos(theta),cos(theta-(2*pi)/3),cos(theta+(2*pi)/3)}};

algorithm
  f_dq[:] := K_mat*f_abc[:];


annotation(
    Documentation(info = "<html><head></head><body><h3><span style=\"font-weight: normal;\">standard Park transformation for</span></h3><div><font size=\"4\">* <b>q-axis aligned to a-axis</b></font></div><div><font size=\"4\"><b><br></b></font></div><div><font size=\"4\">or</font></div><div><font size=\"4\"><br></font></div><div><font size=\"4\"><b>*&nbsp;</b></font><span style=\"color: rgb(64, 64, 64); font-family: Arial, Helvetica, sans-serif; font-size: 13px; orphans: 2; widows: 2; background-color: rgb(255, 255, 255);\"><b>Rotating frame aligned 90 degrees behind A axis</b></span></div><!--StartFragment--><!--EndFragment--><div><font size=\"4\"><br></font></div><div><font size=\"4\"><br></font></div><div><font size=\"4\">[1]&nbsp;</font><a href=\"https://de.mathworks.com/help/physmod/sps/ref/parktransform.html\">https://de.mathworks.com/help/physmod/sps/ref/parktransform.html</a></div><!--StartFragment--><!--EndFragment--></body></html>"));end ABCtoDQ_Park;
