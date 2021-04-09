#!/usr/bin/env wolframscript
(* ::Package:: *)

Block[{Print},<<xAct`xCoba`]
$DefInfoQ=False;
$UndefInfoQ=False;
$CVVerbose=False;
$PrePrint=ScreenDollarIndices;
DefManifold[M,2,{a,b,c,d}]
DefMetric[1,metric[-a,-b],CD,{";","\[Del]"},PrintAs->"g"];
DefChart[\[Theta]\[Phi] ,M,{1,2},{\[Theta][],\[Phi][]}];
DefConstantSymbol[r]
matrix=DiagonalMatrix[{r^2,r^2 Sin[\[Theta][]]^2}];
(*Be careful: r is a constant here, not a function. so we donnot need to write r[]*)
MetricInBasis[metric,-\[Theta]\[Phi],matrix];
MetricCompute[metric,\[Theta]\[Phi],All];
ChristoffelCDPD\[Theta]\[Phi][a,-b,-c]//ToBasis[\[Theta]\[Phi]]//ComponentArray//Flatten;
%==(%//ToValues)//Thread;
%/._==0-> Nothing
