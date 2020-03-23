within ModPowerSystems.EmtThreePhase.Generation.Controllers;
block ExciterSteadyState

   Modelica.Blocks.Interfaces.RealInput P annotation (Placement(transformation(
          extent={{-120,0},{-80,40}}),  iconTransformation(extent={{-140,20},{-100,
            60}})));
   Modelica.Blocks.Interfaces.RealInput Q annotation (Placement(transformation(
          extent={{-120,-60},{-80,-20}}), iconTransformation(extent={{-140,-60},
            {-100,-20}})));

  // general machine characteristics
  parameter Real V_nom = 24e3 "Nominal phase-to-phase RMS voltage";
  parameter Real P_nom = 555e6 "Nominal turbine (active) power (MW)";
  parameter Real f_nom = 60 "Nominal frequency";
  parameter Real p = 1 "Number of pole pairs";
  parameter Real H = 3.7 "Inertia constant";

  // machine parameters in per-unit system
  parameter Real R_s = 0.003 "Stator Resistance";
  parameter Real L_l = 0.15 "Stator leakage";
  parameter Real L_md = 1.6599 "d axis mutual inductance";
  parameter Real L_mq = 1.61 "q axis mutual inductance";
  parameter Real R_fd = 0.0006 "Rotor Resistance";
  parameter Real L_lfd = 0.1648 "Rotor leakage";

  // initialization parameters
  parameter Real theta_volt_init = -Modelica.Constants.pi/2 "initial voltage angle";
  parameter Real vt_init = sqrt(2/3)*V_nom/v_b;

  // machine constants deduced from machine characteristics
  final parameter Real omega_nom = 2 * Modelica.Constants.pi * f_nom "Nominal angular frequency";

  // base quantities of pu-system deduced from machine characteristics
  final parameter Real v_b = sqrt(2/3)*V_nom; // base = phase-to-ground peak voltage
  final parameter Real i_b = 2/3*P_nom/v_b; // base = line peak current per phase
  final parameter Real omega_b = omega_nom/p;

  // --- initial values ---
  Real S_init;
  Real it_init;
  Real pf_init;
  Real delta_init;

  // electrical variables
  Real v_d_init; // stator
  Real v_q_init;
  Real i_d_init;
  Real i_q_init;
  Real i_fd_init; // rotor
  Real v_fd_init;

  Modelica.Blocks.Interfaces.RealOutput vfd annotation (Placement(
        transformation(extent={{100,-10},{120,10}}),iconTransformation(extent={{100,-20},
            {140,20}})));

algorithm
  S_init := sqrt(P^2+Q^2)/P_nom;
  it_init := S_init/vt_init;
  pf_init := acos(P/P_nom/S_init);
  delta_init := atan(((L_mq + L_l) * it_init * cos(pf_init) - R_s * it_init * sin(pf_init)) / (vt_init + R_s * it_init * cos(pf_init) + (L_mq + L_l) * it_init * sin(pf_init)));

  v_d_init := vt_init * sin(delta_init); // stator
  v_q_init := vt_init * cos(delta_init);
  i_d_init := it_init * sin(delta_init + pf_init);
  i_q_init := it_init * cos(delta_init + pf_init);
  i_fd_init := (v_q_init + (L_md + L_l) * i_d_init) / L_md; // rotor
  v_fd_init := R_fd * i_fd_init;

  vfd := v_fd_init*v_b;

  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end ExciterSteadyState;
