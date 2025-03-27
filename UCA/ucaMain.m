clc; clear all; close all;

N = 13;     % no of sensor elements
sAngsDeg = [20,60 ; 40,100 ; 60, 150]; % directions of actual sources in degrees
sAngsDeg = transpose(sAngsDeg);
D = size(sAngsDeg,2);   % no of signals
K = 60;     % no of snapshots
sig = 1;    % signal strength
noi = 1;    % noise strength

sAngsRad = deg2rad(sAngsDeg);   % source angles in radians

ucaSA = ucaSteerVec(N, D, sAngsRad);    % source array steering vector

s = sqrt(sig)*sign(randn(D,K));     % signal generation
no = sqrt(noi)*randn(N,K);  % noise inputs generation
x = ucaSA*s + no;   % sensor inputs generation

P1 = ucaMVDR(x,D);  % output waveforms for MVDR 
P = ucaMUSIC(x, D); % output waveforms for MUSIC

