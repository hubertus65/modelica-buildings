within Buildings.Controls.OBC.CDL.Integers;
block Greater
  "Output y is true, if input u1 is greater than input u2"
  Buildings.Controls.OBC.CDL.Interfaces.IntegerInput u1
    "First input u1"
    annotation (Placement(transformation(extent={{-140,-20},{-100,20}})));
  Buildings.Controls.OBC.CDL.Interfaces.IntegerInput u2
    "Second input u2"
    annotation (Placement(transformation(extent={{-140,-100},{-100,-60}})));
  Buildings.Controls.OBC.CDL.Interfaces.BooleanOutput y
    "Outputs true if u1 is greater than u2"
    annotation (Placement(transformation(extent={{100,-20},{140,20}})));

equation
  y=u1 > u2;
  annotation (
    defaultComponentName="intGre",
    Icon(
      coordinateSystem(
        preserveAspectRatio=false,
        extent={{-100,-100},{100,100}}),
      graphics={
        Rectangle(
          extent={{-100,100},{100,-100}},
          lineColor={0,0,0},
          fillColor={210,210,210},
          fillPattern=FillPattern.Solid,
          borderPattern=BorderPattern.Raised),
        Ellipse(
          extent={{73,7},{87,-7}},
          lineColor=DynamicSelect({235,235,235},
            if y then
              {0,255,0}
            else
              {235,235,235}),
          fillColor=DynamicSelect({235,235,235},
            if y then
              {0,255,0}
            else
              {235,235,235}),
          fillPattern=FillPattern.Solid),
        Ellipse(
          extent={{32,10},{52,-10}},
          lineColor={255,127,0}),
        Line(
          points={{-100,-80},{42,-80},{42,0}},
          color={255,127,0}),
        Line(
          points={{-54,22},{-8,2},{-54,-18}},
          thickness=0.5,
          color={255,127,0}),
        Text(
          extent={{-150,150},{150,110}},
          textString="%name",
          textColor={0,0,255})}),
    Documentation(
      info="<html>
<p>
Block that outputs <code>true</code> if the Integer input <code>u1</code>
is greater than the Integer input <code>u2</code>.
Otherwise the output is <code>false</code>.
</p>
</html>",
      revisions="<html>
<ul>
<li>
August 30, 2017, by Jianjun Hu:<br/>
First implementation, based on the implementation of the
Modelica Standard Library.
</li>
</ul>
</html>"));
end Greater;
