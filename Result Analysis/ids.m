% ========================================================================
% Hybrid Intrusion Detection System (H-IDS)
% Results Visualization Script for IEEE Publication
% ========================================================================
% Values derived from local evaluation:
% Regex-only, DFA-only, ANN-only, Hybrid Reference, Proposed H-IDS
% ========================================================================

clear; close all; clc;

systems   = {'Regex-only','DFA-only','ANN-only','Hybrid Ref.','Proposed H-IDS'};
accuracy  = [85.0, 85.0, 81.2, 98.2, 97.5];   % Detection Accuracy (%)
fpr       = [6.0, 6.0, 12.0, 4.0, 3.2];       % False Positive Rate (%)
latency   = [5.0, 2.0, 1.0, 2.0, 2.4];        % Latency (ms per packet)
throughput = 1000 ./ latency;                 % Approx. Throughput (packets/sec)

% ---------------- LaTeX / IEEE formatting -------------------------------
set(0,'DefaultTextInterpreter','latex');
set(0,'DefaultAxesFontName','Times New Roman');
set(0,'DefaultAxesFontSize',12);
set(0,'DefaultLineLineWidth',1.5);
set(0,'DefaultAxesTickLabelInterpreter','latex');
set(0,'DefaultLegendInterpreter','latex');

%% ---------------- 1. Detection Accuracy --------------------------------
figure('Units','inches','Position',[1 1 6 3.5]);
bar(categorical(systems), accuracy, 'FaceColor',[0.1 0.6 0.4]);
ylabel('Detection Accuracy (\%)','FontSize',14);
ylim([0 105]); grid on; xtickangle(25);
title('Detection Accuracy Comparison','FontSize',16);
for i=1:numel(accuracy)
    text(i, accuracy(i)+1.2, sprintf('%.1f\\%%',accuracy(i)), ...
         'HorizontalAlignment','center','Interpreter','latex');
end
print('-depsc2','-r300','Result_Accuracy.eps');
print('-dpdf','-r300','Result_Accuracy.pdf');

%% ---------------- 2. False Positive Rate -------------------------------
figure('Units','inches','Position',[1 1 6 3.5]);
bar(categorical(systems), fpr, 'FaceColor',[0.85 0.3 0.2]);
ylabel('False Positive Rate (\%)','FontSize',14);
ylim([0 15]); grid on; xtickangle(25);
title('False Positive Rate Comparison','FontSize',16);
for i=1:numel(fpr)
    text(i, fpr(i)+0.4, sprintf('%.1f\\%%',fpr(i)), ...
         'HorizontalAlignment','center','Interpreter','latex');
end
print('-depsc2','-r300','Result_FPR.eps');
print('-dpdf','-r300','Result_FPR.pdf');

%% ---------------- 3. Latency per Packet --------------------------------
figure('Units','inches','Position',[1 1 6 3.5]);
bar(categorical(systems), latency, 'FaceColor',[0.2 0.4 0.8]);
ylabel('Latency (ms / packet)','FontSize',14);
ylim([0 max(latency)*1.4]); grid on; xtickangle(25);
title('Processing Latency Comparison','FontSize',16);
for i=1:numel(latency)
    text(i, latency(i)+0.1*max(latency), sprintf('%.2f',latency(i)), ...
         'HorizontalAlignment','center','Interpreter','latex');
end
print('-depsc2','-r300','Result_Latency.eps');
print('-dpdf','-r300','Result_Latency.pdf');

%% ---------------- 4. Throughput ----------------------------------------
figure('Units','inches','Position',[1 1 6 3.5]);
bar(categorical(systems), throughput, 'FaceColor',[0.4 0.7 0.2]);
ylabel('Throughput (packets/sec)','FontSize',14);
ylim([0 max(throughput)*1.2]); grid on; xtickangle(25);
title('Throughput Comparison','FontSize',16);
for i=1:numel(throughput)
    text(i, throughput(i)+10, sprintf('%.0f',throughput(i)), ...
         'HorizontalAlignment','center','Interpreter','latex');
end
print('-depsc2','-r300','Result_Throughput.eps');
print('-dpdf','-r300','Result_Throughput.pdf');

%% ---------------- 5. Radar / Spider Plot -------------------------------
acc_norm = (accuracy - min(accuracy)) / (max(accuracy)-min(accuracy));
fpr_norm = 1 - (fpr - min(fpr)) / (max(fpr)-min(fpr));  % lower is better
lat_norm = 1 - (latency - min(latency)) / (max(latency)-min(latency));
radar_vals = [acc_norm; fpr_norm; lat_norm]';

theta = linspace(0,2*pi,4); theta(end)=[];
labels = {'Accuracy','FPR','Latency'};

figure('Units','inches','Position',[1 1 4.2 4.2]); hold on;
for i=1:size(radar_vals,1)
    vals = radar_vals(i,:); vals=[vals vals(1)];
    t = linspace(0,2*pi,length(vals));
    plot(t,vals,'-o','DisplayName',systems{i},'LineWidth',1.3);
end
title('Normalized Multi-Metric Radar Comparison','FontSize',14);
legend('Location','southoutside','Interpreter','latex');
rticks([0 0.25 0.5 0.75 1]); thetaticks(rad2deg(theta));
print('-depsc2','-r300','Result_Radar.eps');
print('-dpdf','-r300','Result_Radar.pdf');

fprintf('\nAll publication-ready IEEE figures exported successfully.\n');
