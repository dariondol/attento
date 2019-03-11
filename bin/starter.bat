@echo off
if (%1)==() goto L2

java de.pxlab.pxl.run.Starter %1 %2 %3 %4 %5 %6 %7 %8 %9
goto DONE

:L2
java de.pxlab.pxl.run.Starter ./pxd

:DONE

