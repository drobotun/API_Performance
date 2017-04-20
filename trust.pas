unit trust;

interface

uses
  Windows, SysUtils;

function getIndex : integer;
function getSumm : real;
function getSigma : real;
function getRTrust : real;
function getLTrust : real;

var
  trustP : string;

implementation

uses main;

const
t_095 : array[1..100] of real =(
  12.70620473, 4.30265273,  3.182446305, 2.776445105,
  2.570581835, 2.446911846, 2.364624251, 2.306004133,
  2.262157158, 2.228138842, 2.200985159, 2.178812827,
  2.160368652, 2.144786681, 2.131449536, 2.119905285,
  2.109815559, 2.100922037, 2.09302405,  2.085963441,
  2.079613837, 2.073873058, 2.068657599, 2.063898547,
  2.059538536, 2.055529418, 2.051830493, 2.048407115,
  2.045229611, 2.042272449, 2.039513438, 2.036933334,
  2.034515287, 2.032244498, 2.030107915, 2.028093987,
  2.026192447, 2.024394147, 2.022690901, 2.02107537,
  2.019540948, 2.018081679, 2.016692173, 2.015367547,
  2.014103359, 2.012895567, 2.01174048,  2.010634722,
  2.009575199, 2.008559072, 2.007583728, 2.006646761,
  2.005745949, 2.004879275, 2.004044769, 2.003240704,
  2.002465444, 2.001717468, 2.000995361, 2.000297804,
  1.999623567, 1.998971498, 1.998340522, 1.997729633,
  1.997137887, 1.996564396, 1.996008331, 1.995468907,
  1.99494539,  1.994437086, 1.993943341, 1.993463539,
  1.992997097, 1.992543466, 1.992102124, 1.991672579,
  1.991254363, 1.990847036, 1.990450177, 1.990063387,
  1.989686288, 1.989318521, 1.988959743, 1.988609629,
  1.988267868, 1.987934166, 1.987608241, 1.987289823,
  1.986978657, 1.986674497, 1.98637711,  1.986086272,
  1.985801768, 1.985523395, 1.985250956, 1.984984263,
  1.984723136, 1.984467404, 1.9842169,   1.983971466);

t_099 : array [1..100] of real = (
  63.65674115, 9.9248432,   5.840909309, 4.604094871,
  4.032142983, 3.70742802,  3.499483297, 3.355387331,
  3.249835541, 3.169272672, 3.105806514, 3.054539586,
  3.012275833, 2.976842734, 2.946712883, 2.920781621,
  2.898230518, 2.878440471, 2.860934604, 2.845339707,
  2.831359554, 2.818756056, 2.807335678, 2.796939498,
  2.787435805, 2.778714523, 2.770682946, 2.763262442,
  2.756385902, 2.749995652, 2.744041917, 2.73848148,
  2.73327664,  2.728394364, 2.723805586, 2.719484627,
  2.715408718, 2.711557598, 2.707913179, 2.704459262,
  2.701181298, 2.69806618,  2.695102073, 2.692278259,
  2.689585012, 2.687013484, 2.68455561,  2.682204018,
  2.679951964, 2.677793261, 2.675722224, 2.67373362,
  2.671822625, 2.669984784, 2.668215976, 2.666512385,
  2.664870469, 2.66328694,  2.661758738, 2.660283014,
  2.658857111, 2.657478549, 2.656145008, 2.65485432,
  2.653604451, 2.652393497, 2.651219666, 2.650081279,
  2.648976754, 2.647904603, 2.646863423, 2.645851891,
  2.64486876,  2.643912849, 2.642983043, 2.642078309,
  2.641197607, 2.64034001,  2.639504623, 2.638690591,
  2.637897108, 2.637123405, 2.636368751, 2.635632452,
  2.634913847, 2.634212304, 2.633527223, 2.632858032,
  2.632204185, 2.631565159, 2.630940457, 2.630329602,
  2.629732138, 2.629147631, 2.628575664, 2.628015836,
  2.627467767, 2.626931088, 2.62640545,  2.625890514);

function getIndex : integer;
begin
  result := mainForm.indexUpDown.Position;
end;

function getSumm : real;
var
  summ : real;
  i : integer;
begin
  summ := 0;
  for i := 0 to getIndex - 1 do
    summ := summ + APIresult[i];
  result := summ / getIndex;
end;

function getSigma : real;
var
  s : real;
  i : integer;
begin
  s := 0;
  for i := 0 to getIndex-1 do
    s := s + sqr(APIresult[i] - getSumm);
  result := sqrt((1 / (getIndex-1))*(s));
end;

function getLTrust : real;
begin
  case mainForm.trustComboBox.ItemIndex of
    0 : begin
          result := getSumm - t_095[getIndex - 1]/sqrt(getIndex) * getSigma;
          trustP := '0,95';
        end;
    1 : begin
          result := getSumm - t_099[getIndex - 1]/sqrt(getIndex) * getSigma;
          trustP := '0,99';
        end;
    else begin
      result := getSumm - t_095[getIndex - 1]/sqrt(getIndex) * getSigma;
      trustP := '0,95';
    end;
  end;
end;

function getRTrust : real;
begin
  case mainForm.trustComboBox.ItemIndex of
    0 : result := getSumm + t_095[getIndex - 1]/sqrt(getIndex) * getSigma;
    1 : result := getSumm + t_099[getIndex - 1]/sqrt(getIndex) * getSigma;
    else result := getSumm + t_095[getIndex - 1]/sqrt(getIndex) * getSigma;
  end;
end;

end.
 