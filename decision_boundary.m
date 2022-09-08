[X,Y] = meshgrid(-2:0.1:2);
Z = 1./(1+exp(-5*(X+Y-1)));

close all
surf(X,Y,Z)
colormap spring
hold on
plot3([-1,2],[2 -1],[.5,.5],'-g','linewidth',5)
plot3(-1,-.5,0.01,'.b','markersize',20)
plot3(1,1,1.01,'.r','markersize',20)
legend('logistic function','decision boundary','class 0','class 1',...
    'interpreter','latex','fontsize',18,'autoupdate','off')


plot3(-1,-.5,0.01,'.b','markersize',20)
plot3(-1.1,-.7,0.01,'.b','markersize',20)
plot3(-1.9,-.2,0.01,'.b','markersize',20)
plot3(-1.85,-.75,0.01,'.b','markersize',20)
plot3(-1,-.15,0.01,'.b','markersize',20)
plot3(-1.2,-.45,0.01,'.b','markersize',20)
plot3(1,-1.61,0.01,'.b','markersize',20)
plot3(.8,-1.81,0.01,'.b','markersize',20)
plot3(1,1,1.01,'.r','markersize',20)
plot3(1.5,1.3,1.01,'.r','markersize',20)
plot3(1.1,1.9,1.01,'.r','markersize',20)
plot3(1.2,1.55,1.01,'.r','markersize',20)
plot3(1.9,1.15,1.01,'.r','markersize',20)
