within Buildings.Obsolete.ThermalZones.EnergyPlus_9_6_0.BaseClasses.Synchronize;
block ObjectSynchronizer
  "Block that synchronizes an object"
  outer Buildings.Obsolete.ThermalZones.EnergyPlus_9_6_0.Building building
    "Reference to outer building model";
  SynchronizeBuilding synBui
    "Model that synchronize the Spawn objects"
    annotation (HideResult=true);

equation
  connect(building.synchronize,synBui.synchronize);
  annotation (
    Icon(
      coordinateSystem(
        preserveAspectRatio=false)),
    Diagram(
      coordinateSystem(
        preserveAspectRatio=false)),
    Documentation(
      info="<html>
<p>
Block with <code>outer</code> declaration that is used to synchronize the calls to the Spawn objects.
</p>
</html>",
      revisions="<html>
<ul><li>
February 17, 2021, by Michael Wetter:<br/>
First implementation.
</li>
</ul>
</html>"));
end ObjectSynchronizer;
