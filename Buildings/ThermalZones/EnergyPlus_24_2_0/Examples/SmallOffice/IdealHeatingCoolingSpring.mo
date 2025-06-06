within Buildings.ThermalZones.EnergyPlus_24_2_0.Examples.SmallOffice;
model IdealHeatingCoolingSpring
  "Building with constant fresh air and ideal heating/cooling that exactly meets set point"
  extends Buildings.ThermalZones.EnergyPlus_24_2_0.Examples.SmallOffice.IdealHeatingCoolingWinter;
  annotation (
    __Dymola_Commands(
      file="modelica://Buildings/Resources/Scripts/Dymola/ThermalZones/EnergyPlus_24_2_0/Examples/SmallOffice/IdealHeatingCoolingSpring.mos" "Simulate and plot"),
    experiment(
      StartTime=7344000,
      StopTime=7776000,
      Tolerance=1e-07),
    Icon(
      coordinateSystem(
        extent={{-100,-100},{100,100}},
        preserveAspectRatio=true)),
    Documentation(
      info="<html>
<p>
This is the same model as
<a href=\"modelica://Buildings.ThermalZones.EnergyPlus_24_2_0.Examples.SmallOffice.IdealHeatingCoolingWinter\">
Buildings.ThermalZones.EnergyPlus_24_2_0.Examples.SmallOffice.IdealHeatingCoolingWinter</a>
but configured for simulation of a few days in summer.
</p>
</html>",
      revisions="<html>
<ul>
<li>
November 25, 2024, by Jianjun Hu:<br/>
Changed tolerance to 1e-07.
This is for
<a href=\"https://github.com/lbl-srg/modelica-buildings/issues/4063\">issue #4063</a>.
</li>
<li>
March 5, 2021, by Michael Wetter:<br/>
First implementation.
</li>
</ul>
</html>"));
end IdealHeatingCoolingSpring;
