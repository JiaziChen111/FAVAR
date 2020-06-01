Corr = FAVAR.DCC.Corr;
[Nfoo, ~, tfoo] = size(Corr);
%%
DATESfoo = DATES(4:end);
for kfoo = 1:tfoo
     ttl(kfoo,:,:) = tril(squeeze(Corr(:,:,kfoo)))-diag(diag(squeeze(Corr(:,:,kfoo))));
end
%%
set(0,'DefaultAxesColorOrder',[0 0 0]);
axis tight;
set(gcf, 'PaperPosition', [0 0 40 30]);
set(gcf, 'PaperSize', [40 30]);
subplot(5,3,1);plot(DATESfoo, ttl(:,2,1),'LineWidth',1.1);ylim([min(ttl(:,2,1))-0.5*std(ttl(:,2,1)), max(ttl(:,2,1))+0.5*std(ttl(:,2,1))]);title('Factor 1/IP'); xlim([DATESfoo(1),DATESfoo(end)]);yline(0,'--','LineWidth',1);yAX = get(gca,'YAxis');yAX.FontSize = 14;yAX.TickLabelInterpreter = "latex";xAX = get(gca,'XAxis');xAX.FontSize = 14;xAX.TickLabelInterpreter = "latex";recessionplot_RMJ('k',0.2);
subplot(5,3,4);plot(DATESfoo, ttl(:,3,1),'LineWidth',1.1);ylim([min(ttl(:,3,1))-0.5*std(ttl(:,3,1)), max(ttl(:,2,1))+0.5*std(ttl(:,3,1))]);title('Factor 1/FFR');xlim([DATESfoo(1),DATESfoo(end)]);yline(0,'--','LineWidth',1);               yAX = get(gca,'YAxis');yAX.FontSize = 14;yAX.TickLabelInterpreter = "latex";               xAX = get(gca,'XAxis');xAX.FontSize = 14;xAX.TickLabelInterpreter = "latex";recessionplot_RMJ('k',0.2);
subplot(5,3,7);plot(DATESfoo, ttl(:,4,1),'LineWidth',1.1);ylim([min(ttl(:,4,1))-0.5*std(ttl(:,4,1)), max(ttl(:,4,1))+0.5*std(ttl(:,4,1))]);title('Factor 1/Factor 2');xlim([DATESfoo(1),DATESfoo(end)]);yline(0,'--','LineWidth',1);               yAX = get(gca,'YAxis');yAX.FontSize = 14;yAX.TickLabelInterpreter = "latex";               xAX = get(gca,'XAxis');xAX.FontSize = 14;xAX.TickLabelInterpreter = "latex";recessionplot_RMJ('k',0.2);
subplot(5,3,10);plot(DATESfoo, ttl(:,5,1),'LineWidth',1.1);ylim([min(ttl(:,5,1))-0.5*std(ttl(:,5,1)), max(ttl(:,5,1))+0.5*std(ttl(:,5,1))]);title('Factor 1/Factor 3');xlim([DATESfoo(1),DATESfoo(end)]);yline(0,'--','LineWidth',1);               yAX = get(gca,'YAxis');yAX.FontSize = 14;yAX.TickLabelInterpreter = "latex";               xAX = get(gca,'XAxis');xAX.FontSize = 14;xAX.TickLabelInterpreter = "latex";recessionplot_RMJ('k',0.2);
subplot(5,3,13);plot(DATESfoo, ttl(:,6,1),'LineWidth',1.1);ylim([min(ttl(:,6,1))-0.5*std(ttl(:,6,1)), max(ttl(:,6,1))+0.5*std(ttl(:,6,1))]);title('Factor 1/CPI');xlim([DATESfoo(1),DATESfoo(end)]);yline(0,'--','LineWidth',1);               yAX = get(gca,'YAxis');yAX.FontSize = 14;yAX.TickLabelInterpreter = "latex";               xAX = get(gca,'XAxis');xAX.FontSize = 14;xAX.TickLabelInterpreter = "latex";recessionplot_RMJ('k',0.2);
subplot(5,3,2);plot(DATESfoo, ttl(:,3,2),'LineWidth',1.1);ylim([min(ttl(:,3,2))-0.5*std(ttl(:,3,2)), max(ttl(:,3,2))+0.5*std(ttl(:,3,2))]);title('IP/FFR');xlim([DATESfoo(1),DATESfoo(end)]);yline(0,'--','LineWidth',1);               yAX = get(gca,'YAxis');yAX.FontSize = 14;yAX.TickLabelInterpreter = "latex";               xAX = get(gca,'XAxis');xAX.FontSize = 14;xAX.TickLabelInterpreter = "latex";recessionplot_RMJ('k',0.2);
subplot(5,3,5);plot(DATESfoo, ttl(:,4,2),'LineWidth',1.1);ylim([min(ttl(:,4,2))-0.5*std(ttl(:,4,2)), max(ttl(:,4,2))+0.5*std(ttl(:,4,2))]);title('IP/Factor 2');xlim([DATESfoo(1),DATESfoo(end)]);yline(0,'--','LineWidth',1);               yAX = get(gca,'YAxis');yAX.FontSize = 14;yAX.TickLabelInterpreter = "latex";               xAX = get(gca,'XAxis');xAX.FontSize = 14;xAX.TickLabelInterpreter = "latex";recessionplot_RMJ('k',0.2);
subplot(5,3,8);plot(DATESfoo, ttl(:,5,2),'LineWidth',1.1);ylim([min(ttl(:,5,2))-0.5*std(ttl(:,5,2)), max(ttl(:,5,2))+0.5*std(ttl(:,5,2))]);title('IP/Factor 3');xlim([DATESfoo(1),DATESfoo(end)]);yline(0,'--','LineWidth',1);               yAX = get(gca,'YAxis');yAX.FontSize = 14;yAX.TickLabelInterpreter = "latex";               xAX = get(gca,'XAxis');xAX.FontSize = 14;xAX.TickLabelInterpreter = "latex";recessionplot_RMJ('k',0.2);
subplot(5,3,11);plot(DATESfoo, ttl(:,6,2),'LineWidth',1.1);ylim([min(ttl(:,6,2))-0.5*std(ttl(:,6,2)), max(ttl(:,6,2))+0.5*std(ttl(:,6,2))]);title('IP/CPI');xlim([DATESfoo(1),DATESfoo(end)]);yline(0,'--','LineWidth',1);               yAX = get(gca,'YAxis');yAX.FontSize = 14;yAX.TickLabelInterpreter = "latex";               xAX = get(gca,'XAxis');xAX.FontSize = 14;xAX.TickLabelInterpreter = "latex";recessionplot_RMJ('k',0.2);
subplot(5,3,14);plot(DATESfoo, ttl(:,4,3),'LineWidth',1.1);ylim([min(ttl(:,4,3))-0.5*std(ttl(:,4,3)), max(ttl(:,4,3))+0.5*std(ttl(:,4,3))]);title('FFR/Factor 2');xlim([DATESfoo(1),DATESfoo(end)]);yline(0,'--','LineWidth',1);               yAX = get(gca,'YAxis');yAX.FontSize = 14;yAX.TickLabelInterpreter = "latex";               xAX = get(gca,'XAxis');xAX.FontSize = 14;xAX.TickLabelInterpreter = "latex";recessionplot_RMJ('k',0.2);
subplot(5,3,3);plot(DATESfoo, ttl(:,5,3),'LineWidth',1.1);ylim([min(ttl(:,5,3))-0.5*std(ttl(:,5,3)), max(ttl(:,5,3))+0.5*std(ttl(:,5,3))]);title('FFR/Factor 3');xlim([DATESfoo(1),DATESfoo(end)]);yline(0,'--','LineWidth',1);               yAX = get(gca,'YAxis');yAX.FontSize = 14;yAX.TickLabelInterpreter = "latex";               xAX = get(gca,'XAxis');xAX.FontSize = 14;xAX.TickLabelInterpreter = "latex";recessionplot_RMJ('k',0.2);
subplot(5,3,6);plot(DATESfoo, ttl(:,6,3),'LineWidth',1.1);ylim([min(ttl(:,6,3))-0.5*std(ttl(:,6,3)), max(ttl(:,6,3))+0.5*std(ttl(:,6,3))]);title('FFR/CPI');xlim([DATESfoo(1),DATESfoo(end)]);yline(0,'--','LineWidth',1);               yAX = get(gca,'YAxis');yAX.FontSize = 14;yAX.TickLabelInterpreter = "latex";               xAX = get(gca,'XAxis');xAX.FontSize = 14;xAX.TickLabelInterpreter = "latex";recessionplot_RMJ('k',0.2);
subplot(5,3,9);plot(DATESfoo, ttl(:,5,4),'LineWidth',1.1);ylim([min(ttl(:,5,4))-0.5*std(ttl(:,5,4)), max(ttl(:,5,4))+0.5*std(ttl(:,5,4))]);title('Factor 2/Factor 3');xlim([DATESfoo(1),DATESfoo(end)]);yline(0,'--','LineWidth',1);               yAX = get(gca,'YAxis');yAX.FontSize = 14;yAX.TickLabelInterpreter = "latex";               xAX = get(gca,'XAxis');xAX.FontSize = 14;xAX.TickLabelInterpreter = "latex";recessionplot_RMJ('k',0.2);
subplot(5,3,12);plot(DATESfoo, ttl(:,6,4),'LineWidth',1.1);ylim([min(ttl(:,6,4))-0.5*std(ttl(:,6,4)), max(ttl(:,6,4))+0.5*std(ttl(:,6,4))]);title('Factor 2/CPI');xlim([DATESfoo(1),DATESfoo(end)]);yline(0,'--','LineWidth',1);               yAX = get(gca,'YAxis');yAX.FontSize = 14;yAX.TickLabelInterpreter = "latex";               xAX = get(gca,'XAxis');xAX.FontSize = 14;xAX.TickLabelInterpreter = "latex";recessionplot_RMJ('k',0.2);
subplot(5,3,15);plot(DATESfoo, ttl(:,6,5),'LineWidth',1.1);ylim([min(ttl(:,6,5))-0.5*std(ttl(:,6,5)), max(ttl(:,6,5))+0.5*std(ttl(:,6,5))]);title('Factor 3/CPI');xlim([DATESfoo(1),DATESfoo(end)]);yline(0,'--','LineWidth',1);               yAX = get(gca,'YAxis');yAX.FontSize = 14;yAX.TickLabelInterpreter = "latex";               xAX = get(gca,'XAxis');xAX.FontSize = 14;xAX.TickLabelInterpreter = "latex";recessionplot_RMJ('k',0.2);
saveas(gcf,['../Figures/ConditionalCorrelationPostVolck.pdf']);
clearvars Corr Nfoo tfoo DATESfoo ttl kfoo