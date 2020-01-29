clear all; close all; clc;

long = load('long.mat');
long = long.data;
lat = load('lat.mat');
lat = lat.data;
sc_above_gs = load('sc_above_gs.mat');
sc_above_gs = sc_above_gs.data;
% b = long.Data(:, 2);
% plot(long, lat)
n = length(long.data);
x = linspace(-135, -110, 100);
y = linspace(40, 54, 100);
plot(long.data(:), lat.data(:), 'b')
hold on
plot(x, (47+7)*ones(100, 1), 'r', x, (47-7)*ones(100, 1), 'r')
hold on
plot((-122+10)*ones(100, 1), y, 'r', (-122-10)*ones(100, 1), y, 'r')
hold on
plot(-122, 47, 'r*')