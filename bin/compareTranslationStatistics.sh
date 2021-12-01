#!/bin/bash
set -e # This will stop when diff returns non-zero

rm -f dymola.log dymola-old.log

echo """
Advanced.ParallelizeCode = false;
Evaluate=false;
Advanced.CompileWith64=2;
Advanced.EfficientMinorEvents=false;
Advanced.PedanticModelica = true;
openModel(\"package.mo\");
Advanced.TranslationInCommandLog := true;
Modelica.Utilities.Files.remove(\"dymola.log\");
translateModel(\"Buildings.Examples.VAVReheat.Guideline36\");
savelog(\"dymola.log\");
exit();
""" > run.mos

for i in {1..50}; do
echo "******* i = $i"
if [ -f dymola.log ]; then
  cp dymola.log dymola-old.log
fi
dymola /nowindow run.mos
if [ -f dymola-old.log ]; then
  grep Sizes dymola.log > sizes.log
  grep Sizes dymola-old.log > sizes-old.log
  diff sizes.log sizes-old.log
fi
done
