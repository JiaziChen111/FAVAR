function Plot_FAVARfilter(FAVAR, FAVARopt, DATES, Name)

L = FAVAR.nlag;
Y = FAVAR.ENDO(L+1:end,:);
Yhat = FAVAR.fit;
epsilon = FAVAR.residuals;
N = FAVAR.nvar;
Names = FAVARopt.vnames;
DATES = DATES(L+1:end,:);

PV = [datenum(1979,08,06), datenum(1987,08,11)];
figure;
foo = {[1; 3]; 5; [7; 9]; 11; [13; 15]; 17; [2; 4]; 6; [8; 10]; 12; [14; 16]; 18};
set(0,'DefaultAxesColorOrder','remove');
indicator = 1;
for i=1:N
            subplot(9,2,foo{indicator})
                y = plot(DATES, Y(:,i));
                hold on
                y1 = plot(DATES, Yhat(:,i));
                title(Names(i), 'interpreter', 'latex', 'FontSize',14);
                   set(gca,'xtick',[])
                   set(gca,'xticklabel',[])
                   ylabel('Standardized value','Interpreter','latex','FontSize',14);
                   if i == 1
                   legend([y y1], 'Realized Value','Filtered','Location','best','interpreter','latex');
                   end
                   ylim([min(min(Yhat(:,i)), min(Y(:,i)))-0.5*std(Yhat(:,i)), max(max(Yhat(:,i)), max(Y(:,i)))+0.5*std(Yhat(:,i))]);
                   recessionplot_RMJ("k",0.20);
                   recessionplot_RMJ("k",0.075,"recession",PV); 
                   yAX = get(gca,'YAxis');yAX.FontSize = 14;yAX.TickLabelInterpreter = "latex";
                   xAX = get(gca,'XAxis');xAX.FontSize = 14;xAX.TickLabelInterpreter = "latex";
                indicator = indicator + 1 ;
            subplot(9,2,foo{indicator})
                plot(DATES, epsilon(:,i));
                recessionplot_RMJ("k",0.20);
                recessionplot_RMJ("k",0.075,"recession",PV); 
               % ylabel('Residuals');
               % if indicator == 6 | indicator == 12;
               %     xlabel = ('Date');
               yline(0,'--', 'LineWidth',1.25);
               yAX = get(gca,'YAxis');yAX.FontSize = 12;yAX.TickLabelInterpreter = "latex";
               xAX = get(gca,'XAxis');xAX.FontSize = 14;xAX.TickLabelInterpreter = "latex";
               ylabel('Residual','Interpreter','latex');
                if i ~= [3, 6]
                   set(gca,'xtick',[])
                   set(gca,'xticklabel',[])
               end
                indicator = indicator +1;
end
set(gcf, 'PaperPosition', [0 0 40 30]);
set(gcf, 'PaperSize', [40 30]);
saveas(gcf,['../Figures/', Name ,'.pdf']);
end