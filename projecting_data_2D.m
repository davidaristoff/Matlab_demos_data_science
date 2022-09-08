%%%%%%%%%%%%projecting 2D data onto a the line of best fit%%%%%%%%%%%%%%%%%

%create data set consisting of points that approximately lie on a plane
n = 20;           %number of data points
del = 1;          %noise parameter
x1 = rand(n,1);
x2 = 1 + x1 + del*rand(n,1);
X = [x1,x2];                     %X = data matrix
Xm = mean(X);                    %Xm = (column) mean of X, or mean of data

%plot the points in the data set, together with their mean
close all
figure('Renderer', 'painters', 'Position', [20 20 1800 1000]);

subplot(2,2,1)
plot(X(:,1),X(:,2),'.b','markersize',15)  %plot original data
hold on
plot(Xm(1),Xm(2),'s','color',[.5 0 .5],'linewidth',5)     %plot mean of data
plot([0 Xm(1)],[0 Xm(2)],'r')
legend('data','mean of data','interpreter','latex','fontsize',14,'location','southeast')
axis square
%axis([0 1 0 1 0 1])
title('original data set','interpreter','latex','fontsize',14)
axis([0 1 0 3])
set(gca,'fontsize',14)

%now do a PCA analysis of the data set, using projections
Xc = X-Xm;                              %Xc = centered version of X
[u,lam] = eigs(Xc'*Xc,1,'largestabs');  %u = 1st principal component
Xp = (Xc*u)*u';                         %Xp = projected centered data
Xr = Xm + Xp;                           %Xr = 1-term reconstructed data set


subplot(2,2,2)
plot(Xc(:,1),Xc(:,2),'.b','markersize',15) 
hold on
plot(0,0,'sr','linewidth',5)
axis square
legend('data','origin','interpreter','latex','fontsize',14,'location','southeast')
title('mean-subtracted or centered data set','interpreter','latex','fontsize',14)
axis([-1 1 -1 1])
set(gca,'fontsize',14)

subplot(2,2,3)
plot(Xc(:,1),Xc(:,2),'.b','markersize',15)
hold on
plot(Xp(:,1),Xp(:,2),'>','color',[0 .5 0],'linewidth',2)
plot(0,0,'sr','linewidth',5)
for i=1:n
    plot([Xc(i,1) Xp(i,1)],[Xc(i,2) Xp(i,2)],'-r')
end
plot([-2*u(1) 2*u(1)],[-2*u(2) 2*u(2)],...
     '-','color',[.5 0 .5])
axis square
legend('data','projections','origin','interpreter','latex','fontsize',14,'location','southeast')
title('projected and centered data set','interpreter','latex','fontsize',14)
axis([-1 1 -1 1])
set(gca,'fontsize',14)

subplot(2,2,4)
plot(Xr(:,1),Xr(:,2),'>','color',[0 .5 0],'linewidth',2)
hold on
plot([Xm(1)-2*u(1) Xm(1)+2*u(1)],[Xm(2)-2*u(2) Xm(2)+2*u(2)],...
      '--','color',[.5 0 .5])
%plot3(X(:,1),X(:,2),X(:,3),'.b','markersize',20)
plot(Xm(1),Xm(2),'s','color',[.5 0 .5],'linewidth',5)
axis square
legend('approximate data','1D approx space','mean of data',...
     'interpreter','latex','fontsize',14,'location','southeast')
 title('reconstructed data set','interpreter','latex','fontsize',14)
 axis([0 1 0 3])
 set(gca,'fontsize',14)
