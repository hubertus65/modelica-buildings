within Buildings.Occupants.Office.Windows;
model Zhang2012WindowsSouth "A model to predict occupants' window behavior with outdoor temperature for South-oriented windows"
  extends Modelica.Blocks.Icons.DiscreteBlock;
  parameter Real A = 0.10 "Slope of the logistic relation";
  parameter Real B = -3.64 "Intercept of the logistic relation";
  parameter Integer localSeed = 3013
    "Local seed to be used to generate the initial state of the random number generator";
  parameter Integer globalSeed = 30129
    "Global seed to be combined with the local seed";
  parameter Modelica.Units.SI.Time samplePeriod=120 "Sample period";

  Modelica.Blocks.Interfaces.RealInput TOut(
    final unit="K",
    displayUnit="degC") "Outdoor air temperature" annotation (Placement(transformation(extent={{-140,-80},{-100,-40}}),
      iconTransformation(extent={{-140,-80},{-100,-40}})));
  Modelica.Blocks.Interfaces.BooleanInput occ
    "Indoor occupancy, true for occupied"
    annotation (Placement(transformation(extent={{-140,40},{-100,80}})));
  Modelica.Blocks.Interfaces.BooleanOutput on "State of South-oriented window, true for open"
    annotation (Placement(transformation(extent={{100,-10},{120,10}})));

  Real p(
    unit="1",
    min=0,
    max=1) "Probability of window opened";

protected
  parameter Modelica.Units.SI.Time t0(final fixed=false)
    "First sample time instant";
  output Boolean sampleTrigger "True, if sample time instant";
  Integer state[Modelica.Math.Random.Generators.Xorshift1024star.nState]
    "State of the random number generator";
  discrete Real ran(min=0, max=1) "Random number";

initial equation
  t0 = time;
  p = Modelica.Math.exp(A*(TOut - 273.15)+B)/(Modelica.Math.exp(A*(TOut - 273.15)+B) + 1);

  (ran, state) = Modelica.Math.Random.Generators.Xorshift1024star.random(
    stateIn=Modelica.Math.Random.Generators.Xorshift1024star.initialState(
      localSeed = localSeed,
      globalSeed = globalSeed));
  on = ran < p;

equation
  sampleTrigger = sample(t0,samplePeriod);
  when sampleTrigger then
    (ran, state) = Modelica.Math.Random.Generators.Xorshift1024star.random(pre(state));
    if occ then
      p = Modelica.Math.exp(A*(TOut - 273.15)+B)/(Modelica.Math.exp(A*(TOut - 273.15)+B) + 1);
      on = ran < p;
    else
      p = 0;
      on = false;
    end if;
  end when;

  annotation (Icon(graphics={
            Rectangle(extent={{-60,40},{60,-40}}, lineColor={28,108,200}), Text(
            extent={{-40,20},{40,-20}},
            textColor={28,108,200},
            fillColor={0,0,255},
            fillPattern=FillPattern.Solid,
            textStyle={TextStyle.Bold},
            textString="WindowSouth_Tout")}),
defaultComponentName="win",
Documentation(info="<html>
<p>
Model predicting the state of the South-oriented window with the outdoor air temperature
and occupancy.
</p>
<h4>Dynamics</h4>
<p>
When the space is unoccupied, the window is always closed. When the
space is occupied, the lower the outdoor temperature is, the lower
the chance to open the window.
</p>
<h4>References</h4>
<p>
The model is documented in the paper &quot;Zhang, Y. and Barrett, P., 2012.
Factors influencing the occupants’ window opening behaviour in a naturally
ventilated office building. Building and Environment, 50, pp.125-134.&quot;
</p>
<p>
The model parameters are regressed from the field study in a naturally
ventilated office building in Sheffield, UK in 2005/2006. The outdoor air
temperature range during the study is 0 ~ 30 degC.
</p>
</html>",
revisions="<html>
<ul>
<li>
December 6, 2024, by Michael Wetter:<br/>
Refactored implementation of random number calculations, transfering the local state of
the random number generator from one call to the next.<br/>
This is for <a href=\"https://github.com/lbl-srg/modelica-buildings/issues/4069\">#4069</a>.
</li>
<li>
July 25, 2018, by Zhe Wang:<br/>
First implementation.
</li>
</ul>
</html>"));
end Zhang2012WindowsSouth;
