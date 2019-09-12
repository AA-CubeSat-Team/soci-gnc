% This script will read the World Magnetic Model coefficients from the file
% WMM.COF stored in the Include directory. It will create a .mat file of
% the coefficients that will also be placed in the Include directory, and
% can be loaded with the flight software.
%
% To update the WMM coefficients, you just need to download the new WMM.COF
% file from NOAA, place it in the Include directory, and run this file.
%
% This will save a struct called `wmm` that contains:
%   wmm.year : epoch year of the coefficients
%   wmm.model : a string like "WMM-2015v2" that corresponds to NOAAs name
%   wmm.date : a string that indicates when the coefficients were published
%   wmm.COF : a matrix containing the model coefficients in the same order
%   as the WMM.COF file.
%
% T. Reynolds -- RAIN Lab

% Open coefficient file
fid = fopen('WMM_2015v2.COF','r');
if ( fid<0 )
    error('MY_WMM: Cannot open coefficient file WMM.COF')
end

% file sizes
numChars = 48;  % number of entries in each row
numRows  = 90;  % total number of data rows
numCols  = 6;   % total number of data columns
modOrd   = 12;   % model order (and degree)

% read year
formatSpec = ['%4d' '%2c'];
sizeY   = 6;
Yread   = fscanf(fid,formatSpec,sizeY)';
Ybase   = Yread(1);
Ydot    = Yread(2);
Ydec    = Yread(3);
year    = str2double( strcat(string(Ybase),...
                             string(char(Ydot)),...
                             string(char(Ydec))) );

% read model and data
formatSpec = ['%10s' '%10s'];
sizeM   = 2;
M       = fscanf(fid,formatSpec,sizeM)';
model   = strcat(M(1:10))';
date    = strcat(M(10:10))';

% read coefficients
formatSpec  = ['%u  %u  %f  %f  %f  %f\n'];
COF = fscanf(fid,formatSpec,[numCols numRows])';

% close the coefficient file
fclose(fid);

g   = zeros(modOrd,modOrd+1);
dg  = zeros(modOrd,modOrd+1);
h   = zeros(modOrd,modOrd+1);
dh  = zeros(modOrd,modOrd+1);
row = 0;
for n = 1:modOrd
    for m = 0:n
        row = row+1;
            g(n,m+1)    = COF(row,3);
            h(n,m+1)    = COF(row,4);
            dg(n,m+1)   = COF(row,5);
            dh(n,m+1)   = COF(row,6);
    end
end

% save the data
wmm = struct;
wmm.year = year;
wmm.model = model;
wmm.date = date;
wmm.g = g;
wmm.h = h;
wmm.dg = dg;
wmm.dh = dh;
save('../Include/WMM.mat','wmm')

