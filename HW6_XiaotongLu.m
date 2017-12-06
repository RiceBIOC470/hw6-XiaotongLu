%HW6
%GB comments
1a 95 no plot labels
1b 95 no plot labels
1c 95 no plot labels
1d 95 no plot labels 
1e 75 No graph labels. I think you end up rephrasing your first statement and don’t expand on why this behavior is observed. Meaning, why does 100 values provide better results? 
2a 95 no plot labels
2b 75 no plot labels. Also your comment tells us the same information the graph provides. Why does this occur though? Why is it special? 
2c 95 not plot labels
Overall: 90



% Problem 1. Curve fitting. 
% Part 1. Take 10 x values on the interval 0 < x <= 10 and then create y
% values from the x values by plugging the x values into a third order
% polynomial of your choice. Add random noise to the data by choosing a random number
% in the interval [-D, D]. Start with D = 1. Plot your data in the x-y plane.
figure(1);
xx=rand(1,10);
x=10*xx;
noise=-1+2*rand(1,1);
y=x.^3+x.^2+x+noise;
plot(x,y);




% Part 2. Fit your data with polynomials from order 1 to 9. Plot the fitted
% polynomials together with the data.
figure(2);
plot(x,y,'b.','MarkerSize',18)
hold on;
for ii=1:9
    [coeff,s]=polyfit(x,y,ii);
    plot(x,polyval(coeff,x),'r--','MarkerSize',18);
    hold on
end
hold off;


% Part 3. On a separate plot, plot the R^2 and adjusted R^2 as a function
% of the order of the polynomial. 
figure(3);
R=[];
R_adj=[];
for ii=1:9
    [fit_out,fit_metric]=fit(x',y',['poly',num2str(ii)]);
    r=fit_metric.rsquare;
    R=[R,r];
    r_adj=fit_metric.adjrsquare;
    R_adj=[R_adj,r_adj];
end
plot(1:9,R);
hold on;
plot(1:9,R_adj);
hold off;    
% Part 4. Repeat parts 1 - 3 for D = 10 and D = 1000. Comment on the
% results. 
figure(4);
xx=rand(1,10);
x=10*xx;
noise=-10+20*rand(1,1);
y=x.^3+x.^2+x+noise;
plot(x,y);

figure(5);
plot(x,y,'b.','MarkerSize',18)
hold on;
for ii=1:9
    [coeff,s]=polyfit(x,y,ii);
    plot(x,polyval(coeff,x),'r--','MarkerSize',18);
    hold on
end
hold off;
figure(6);
R=[];
R_adj=[];
for ii=1:9
    [fit_out,fit_metric]=fit(x',y',['poly',num2str(ii)]);
    r=fit_metric.rsquare;
    R=[R,r];
    r_adj=fit_metric.adjrsquare;
    R_adj=[R_adj,r_adj];
end
plot(1:9,R);
hold on;
plot(1:9,R_adj);
hold off;

figure(7);
xx=rand(1,10);
x=10*xx;
noise=-1000+2000*rand(1,1);
y=x.^3+x.^2+x+noise;
plot(x,y);

figure(8);
plot(x,y,'b.','MarkerSize',18)
hold on;
for ii=1:9
    [coeff,s]=polyfit(x,y,ii);
    plot(x,polyval(coeff,x),'r--','MarkerSize',18);
    hold on
end
hold off;
figure(9);
R=[];
R_adj=[];
for ii=1:9
    [fit_out,fit_metric]=fit(x',y',['poly',num2str(ii)]);
    r=fit_metric.rsquare;
    R=[R,r];
    r_adj=fit_metric.adjrsquare;
    R_adj=[R_adj,r_adj];
end
plot(1:9,R);
hold on;
plot(1:9,R_adj);
hold off;

When D became larger, the R^2 was lower than before when the order was small but got higher when the order was large.
So that in the lower order, the curve fits worse than before but in the higher order, the curver fits better than before. 

% Part 5. Now repeat parts 1-3 but take 100 x values on the interval 0 < x <=
% 10. Comment on the results. 
figure(10);
xx=rand(1,100);
x=10*xx;
noise=-10+20*rand(1,1);
y=x.^3+x.^2+x+noise;
plot(x,y);

figure(11);
plot(x,y,'b.','MarkerSize',18)
hold on;
for ii=1:9
    [coeff,s]=polyfit(x,y,ii);
    plot(x,polyval(coeff,x),'r--','MarkerSize',18);
    hold on
end
hold off;

figure(12);
R=[];
R_adj=[];
for ii=1:9
    [fit_out,fit_metric]=fit(x',y',['poly',num2str(ii)]);
    r=fit_metric.rsquare;
    R=[R,r];
    r_adj=fit_metric.adjrsquare;
    R_adj=[R_adj,r_adj];
end
plot(1:9,R);
hold on;
plot(1:9,R_adj);
hold off;

The R^2 for 100x values is larger than that for 10x values which means the
curve for 100x values fits better than the curve for 10x values. And the R^2 is quite similar to R_adj^2.
% Problem 2. Basic statistics. 
% Part 1. Consider two different distributions - Gaussian numbers with a mean of
% 0 and variance 1 and Gaussian numbers with a mean of 1 and variance 1.
% (1) Make a plot of the average p-value for the t-test comparing N random
% numbers chosen from each of these two distributions as a function of N.
clear all;
figure(1);
GN1=randn(100,1);
GN2=randn(100,1)+1;
P=[];
pval=[];
for N=1:10
        xx=GN1(1:N,1);
        yy=GN2(1:N,1);
        [~,pval]=ttest2(xx,yy); 
        if isnan(pval)
            pval=1;
        end
        P=[P,pval];
end
plot(1:N,P)
    

% Part 2. Now keep the first distribution the same, but vary the mean of
% the second distribution between 0 and 10 with the same variance and
% repeat part one. Make a plot of all of these different curves on the same
% set of axes. What is special about the case where the mean of the second
% distribution is 0? 
figure(2);
for ii=0:10
GN1=randn(100,1);
GN2=randn(100,1)+ii;
P=[];
for N=1:10
        xx=GN1(1:N,1);
        yy=GN2(1:N,1);
        [~,pval]=ttest2(xx,yy); 
        if isnan(pval)
            pval=1;
        end
        P=[P,pval];
end
plot(1:N,P)
hold on
end
hold off;
When it is 0, the p value curve goes down first and then goes up again but the p value is always quite large.

% Part 3. Now keep the means of the two distributions at 0 and 1 as in part
% 1, but vary the variance of both distributions simultaneiously between 0.1 and 10 and plot the 
% p-values vs the number of numbers drawn as before. Comment on your
% results.  
figure(3);
for ii=0.1:10
GN1=randn(100,1);
GN2=randn(100,1)+1;
P=[];
for N=1:10
        xx=ii*GN1(1:N,1);
        yy=ii*GN2(1:N,1);
        [~,pval]=ttest2(xx,yy); 
        if isnan(pval)
            pval=1;
        end
        P=[P,pval];
end
plot(1:N,P)
hold on
end
hold off;
The change of p value is somewhat corresponding to the change of variance. When the variance became larger, the p value became
too. That was because variance reflect the variation of these numbers. when the variation of number is large, the p value which shows
whether these number has siginificant diffenrence will certain be large. In a words, they reflect the similar property of these numbers. 


