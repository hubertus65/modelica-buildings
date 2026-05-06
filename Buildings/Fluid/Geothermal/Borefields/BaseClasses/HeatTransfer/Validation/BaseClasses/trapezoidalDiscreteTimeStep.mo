within Buildings.Fluid.Geothermal.Borefields.BaseClasses.HeatTransfer.Validation.BaseClasses;
function trapezoidalDiscreteTimeStep
  "Advance one ODE step using the trapezoidal (Heun) rule"
    extends .Modelica.Icons.Function;
  input  Real x_t      "State x at time t";
  input  Real exp_t    "RHS expression dx/dt evaluated at (t, x(t))";
  input  Real exp_t_h  "RHS expression dx/dt evaluated at (t+h, x(t+h))";
  input  Real h        "Step size";

  output Real x_t_h    "State x at time t+h  (i.e. x(t+1))";

algorithm
  x_t_h := x_t + (h / 2.0) * (exp_t + exp_t_h);
  annotation(inline=true);
end trapezoidalDiscreteTimeStep;
