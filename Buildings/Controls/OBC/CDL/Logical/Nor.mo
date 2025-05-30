within Buildings.Controls.OBC.CDL.Logical;
block Nor
  "Logical 'nor': y = not (u1 or u2)"
  Buildings.Controls.OBC.CDL.Interfaces.BooleanInput u1
    "Input signal for 'nor'"
    annotation (Placement(transformation(extent={{-140,-20},{-100,20}})));
  Buildings.Controls.OBC.CDL.Interfaces.BooleanInput u2
    "Input signal for 'nor'"
    annotation (Placement(transformation(extent={{-140,-100},{-100,-60}})));
  Buildings.Controls.OBC.CDL.Interfaces.BooleanOutput y
    "Output with false if at least one of the inputs is true"
    annotation (Placement(transformation(extent={{100,-20},{140,20}})));

equation
  y=not (u1 or u2);
  annotation (
    defaultComponentName="nor",
    Icon(
      coordinateSystem(
        preserveAspectRatio=true,
        extent={{-100,-100},{100,100}}),
      graphics={
        Rectangle(
          extent={{-100,100},{100,-100}},
          fillColor={210,210,210},
          fillPattern=FillPattern.Solid,
          borderPattern=BorderPattern.Raised),
        Text(
          extent={{-90,40},{90,-40}},
          textColor={0,0,0},
          textString="nor"),
        Ellipse(
          extent={{71,7},{85,-7}},
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
          extent={{-75,-6},{-89,8}},
          lineColor=DynamicSelect({235,235,235},
            if u1 then
              {0,255,0}
            else
              {235,235,235}),
          fillColor=DynamicSelect({235,235,235},
            if u1 then
              {0,255,0}
            else
              {235,235,235}),
          fillPattern=FillPattern.Solid),
        Ellipse(
          extent={{-75,-73},{-89,-87}},
          lineColor=DynamicSelect({235,235,235},
            if u2 then
              {0,255,0}
            else
              {235,235,235}),
          fillColor=DynamicSelect({235,235,235},
            if u2 then
              {0,255,0}
            else
              {235,235,235}),
          fillPattern=FillPattern.Solid),
        Text(
          extent={{-150,150},{150,110}},
          textColor={0,0,255},
          textString="%name")}),
    Documentation(
      info="<html>
<p>
Block that outputs <code>true</code> if none of the inputs is <code>true</code>.
Otherwise the output is <code>false</code>.
</p>
</html>",
      revisions="<html>
<ul>
<li>
January 3, 2017, by Michael Wetter:<br/>
First implementation, based on the implementation of the
Modelica Standard Library.
</li>
</ul>
</html>"));
end Nor;
