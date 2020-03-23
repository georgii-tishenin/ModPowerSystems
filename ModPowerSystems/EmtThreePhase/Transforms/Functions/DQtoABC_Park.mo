within ModPowerSystems.EmtThreePhase.Transforms.Functions;
function DQtoABC_Park
  input Real f_dq[2];
  input Real theta;
  output Real f_abc[3];

protected
          constant Real[3,2] K_mat = {{sin(theta),cos(theta)},{sin(theta-2*pi/3),cos(theta-2*pi/3)},{sin(theta+2*pi/3),cos(theta+2*pi/3)}};

algorithm
  f_abc[:] := K_mat*f_dq[:];

annotation(
    Documentation(info = "<html><head></head><body><font size=\"5\">Inverse Park transform to q-axis aligned to a-axis</font></body></html>"));end DQtoABC_Park;
